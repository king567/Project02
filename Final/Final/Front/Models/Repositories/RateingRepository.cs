using Project2.Models.EFModels;
using Project2.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.Repositories
{
	public class RateingRepository
	{
		// 取得平均評分 最高的前五部影片 使用 TopFiveRatingMediaInfos
		public List<TopFiveRatingMediaInfos> GetTopFive()
		{
			using (var db = new AppDbContext())
			{
				var result = db.Ratings
					.GroupBy(x => x.MediaInfoId)
					.Select(x => new TopFiveRatingMediaInfos
					{
						MediaInfoId = x.Key,
						AverageRate = (int?)x.Average(y => y.Rate)
					})
					.OrderByDescending(x => x.AverageRate)
					.Take(5)
					.ToList();

				return result;
			}
		}

	}
}