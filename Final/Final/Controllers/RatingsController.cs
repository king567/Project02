using Dapper;
using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace Final.Controllers
{
	public class RatingsController : Controller
	{
		private AppDbContext db = new AppDbContext();

		// GET: Ratings
		public ActionResult Index()
		{
			return View();
		}

		// GET: Ratings/Details/5
		public ActionResult Details(int? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}

			// 檢索 rating 資料，但排除 mediainfos 資料表的 ReleaseDate 欄位

			using (var db = new AppDbContext())
			{
				var connection = db.Database.Connection;

				// 執行查詢，獲取詳細數據
				var query = @"
                SELECT r.Id,mi.CategoryId,mi.Title AS MediaInfoTitle, m.Account AS MemberAccount,
                       r.Comment, r.Rate, r.CreatedTime
                FROM Ratings AS r
                JOIN Members AS m ON r.MemberId = m.Id
                JOIN MediaInfos AS mi ON r.MediaInfoId = mi.Id
				WHERE r.Id = @Id";

				var rating = connection.Query<RatingVm>(query, new { Id = id }).FirstOrDefault(); //使用參數傳遞id

				if (rating == null)
				{
					return HttpNotFound();
				}
				return View(rating);
			}
		}



		// GET: Ratings/Delete/5
		public ActionResult Delete()
		{
			return View();
		}




	}
}