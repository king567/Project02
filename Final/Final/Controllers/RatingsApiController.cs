using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using static Final.AutoMapperHelper;
using Final.Models.ViewModels;
//using Final.Models.DTOs;
using Dapper;



namespace Final.Controllers
{
	public class RatingsApiController : ApiController
	{
		[HttpPost]
		public IHttpActionResult GetRatingsWithDetails()
		{
			using (var db = new AppDbContext())
			{
				var connection = db.Database.Connection;

				// 使用 Dapper 執行查詢，獲取詳細數據
				var query = @"
                SELECT r.Id,mi.CategoryId,mi.Title AS MediaInfoTitle, m.Account AS MemberAccount,
                       r.Comment, r.Rate, r.CreatedTime
                FROM Ratings AS r
                JOIN Members AS m ON r.MemberId = m.Id
                JOIN MediaInfos AS mi ON r.MediaInfoId = mi.Id";

				var ratingsWithDetails = connection.Query<RatingVm>(query).ToList();

				return Ok(ratingsWithDetails);
			}
		}





		//[HttpDelete]
		//public IHttpActionResult Delete(int id)
		//{
		//	using (var db = new AppDbContext())
		//	{
		//		db.Open();

		//		// 檢查評分是否存在
		//		var existingRating = db.QuerySingleOrDefault<Rating>("SELECT * FROM Ratings WHERE Id = @Id", new { Id = id });

		//		if (existingRating == null)
		//		{
		//			return NotFound(); // 如果找不到評分，返回 404 Not Found
		//		}

		//		// 執行刪除操作
		//		var deleteQuery = "DELETE FROM Ratings WHERE Id = @Id";
		//		db.Execute(deleteQuery, new { Id = id });

		//		return Ok(); // 成功刪除返回 OK
		//	}
		//}
	}
}


