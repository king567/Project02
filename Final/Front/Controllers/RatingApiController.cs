using Dapper;
using Project2.Models.EFModels;
using Project2.Models.Services;
using Project2.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Project2.Controllers
{
	public class RatingApiController : ApiController
	{
		[HttpPost]
		[Route("api/RatingApi/SubmitRating")]
		public IHttpActionResult SubmitRating(RatingVm ratingData)
		{
			using (var db = new AppDbContext())
			{
				var connection = db.Database.Connection;

				// 執行 SQL 查詢，插入新的評分數據
				var insertQuery = "INSERT INTO Ratings (MediaInfoId, MemberId, Comment, Rate, CreatedTime) " +
								  "VALUES (@MediaInfoId, @MemberId, @Comment, @Rate, @CreatedTime)";


				connection.Execute(insertQuery, new
				{
					MediaInfoId = ratingData.MediaInfoId,
					MemberId = ratingData.MemberId,
					Comment = ratingData.Comment,
					Rate = ratingData.Rate,
					CreatedTime = DateTime.Now // 或者您可以使用評分數據中提供的時間
				});

				return Ok("已成功提交評論");
			}
		}

		[HttpGet]
		[Route("api/RatingApi/LoadData")]
		public IHttpActionResult LoadData(int? mediaInfoId = null)
		{
			//使用RatingService處理評分相關的邏輯
			var ratingService = new RatingService();

			//獲取評分數據
			var ratingData = ratingService.GetRatings(mediaInfoId.Value);

			if (ratingData != null)
			{
				// 計算平均評分
				var averageRating = ratingService.CalculateAverageRating(mediaInfoId.Value);

				// 計算評論總數
				var totalReview = ratingData.Count;

				// 計算各個星級的數量
				var fiveStarReview = ratingData.Count(r => r.Rate == 5);
				var fourStarReview = ratingData.Count(r => r.Rate == 4);
				var threeStarReview = ratingData.Count(r => r.Rate == 3);
				var twoStarReview = ratingData.Count(r => r.Rate == 2);
				var oneStarReview = ratingData.Count(r => r.Rate == 1);

				// 包含評分訊息的 JSON 數據
				var result = new
				{
					average_rating = averageRating,
					total_review = totalReview,
					five_star_review = fiveStarReview,
					four_star_review = fourStarReview,
					three_star_review = threeStarReview,
					two_star_review = twoStarReview,
					one_star_review = oneStarReview,
					rating_data = ratingData //包含用戶提交的評分和評論
				};

				return Ok(result);
			}
			else
			{
				return NotFound();
			}
		}

		[HttpGet]
		[Route("api/RatingApi/LoadDataPage")]
		public IHttpActionResult LoadDataPage(int page, int? mediaInfoId = null)
		{
			int pageSize = 10;

			//使用RatingService處理評分相關的邏輯
			var ratingService = new RatingService();

			int totalReview = 0;

			//獲取評分數據
			var ratingData = ratingService.GetRatingsPage(mediaInfoId.Value, page, pageSize);

			if (ratingData != null)
			{
				// 計算平均評分
				var averageRating = ratingService.CalculateAverageRating(mediaInfoId.Value);

				// 計算評論總數
				totalReview = ratingService.GetRatingsCount(mediaInfoId.Value);

				// 計算各個星級的數量
				var fiveStarReview = ratingData.Count(r => r.Rate == 5);
				var fourStarReview = ratingData.Count(r => r.Rate == 4);
				var threeStarReview = ratingData.Count(r => r.Rate == 3);
				var twoStarReview = ratingData.Count(r => r.Rate == 2);
				var oneStarReview = ratingData.Count(r => r.Rate == 1);

				// 包含評分訊息的 JSON 數據
				var result = new
				{
					average_rating = averageRating,
					total_review = totalReview,
					five_star_review = fiveStarReview,
					four_star_review = fourStarReview,
					three_star_review = threeStarReview,
					two_star_review = twoStarReview,
					one_star_review = oneStarReview,
					rating_data = ratingData //包含用戶提交的評分和評論
				};

				return Ok(result);
			}
			else
			{
				return NotFound();
			}
		}

		[HttpDelete]
		public IHttpActionResult DeleteComment(int id)
		{

			var db = new AppDbContext();
			Rating rating = db.Ratings.Find(id);
			if (rating == null)
			{
				return NotFound();
			}

			db.Ratings.Remove(rating);
			db.SaveChanges();

			return Ok(rating);
		}


		public class RatingData
		{
			public int MemberId { get; set; }
			public int MediaInfoId { get; set; }

			public int Rate { get; set; }
			public string Comment { get; set; }
			public DateTime CreatedTime { get; set; }

			public Member Member { get; set; }
			public MediaInfo MediaInfo { get; set; }
		}
	}
}
