using Final.Models.DTOs;
using Final.Models.Repositories;
using Project2.Models.DTOs;
using Project2.Models.EFModels;
using Project2.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.Services
{
	public class RatingService
	{//連線AppDbContext
		private AppDbContext db = new AppDbContext();

		//新增評分
		public void Create(Rating rating)
		{
			db.Ratings.Add(rating);
			db.SaveChanges();
		}

		//獲取評分列表
		public List<RatingDTO> GetRatings(int mediaInfoId)
		{
			var ratings = db.Ratings
				.Where(r => r.MediaInfoId == mediaInfoId)
				.OrderByDescending(r => r.CreatedTime)
				.Select(r => new RatingDTO
				{
					Id = r.Id,
					MemberAccount = r.Member.Account,
					MovieTitle = r.MediaInfo.Title,
					Comment = r.Comment,
					Rate = r.Rate ?? 0, // 使用 null 合併運算子設置默認值
					CreatedTime = r.CreatedTime ?? DateTime.MinValue // 使用 null 合併運算子設置默認日期/時間
				})
				.ToList();

			return ratings;
		}


		//計算平均評分
		public double CalculateAverageRating(int mediaInfoId)
		{
			var ratings = db.Ratings.Where(r => r.MediaInfoId == mediaInfoId).ToList();
			if (ratings.Count == 0)
			{
				return 0.0;
			}

			var totalRate = ratings.Sum(r => r.Rate);
			var averageRating = (double)totalRate / ratings.Count;

			// 平均分數只保留一位小數
			return Math.Round(averageRating, 1);

		}

		// 取得平均評分 最高的前五部影片
		public List<MediaInfosRelDTO> GetTopFive()
		{
			var topFive = new RateingRepository().GetTopFive();

			// 取得 MediaInfo 的資料
			var Entities = new MediaInfoRepository().GetMediaInfosInRange(topFive.Select(x => x.MediaInfoId).ToList());

			// MediaInfo 轉成 DTO
			List<MediaInfosRelDTO> dtos = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);

			return dtos;
		}
	}
}