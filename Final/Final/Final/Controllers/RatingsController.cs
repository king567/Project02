using Dapper;
using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
//using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace Final.Controllers
{
    [Authorize]
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

				var blacklistReasons = db.BlacklistReasons.ToList();
				ViewBag.BlacklistReasons = new SelectList(blacklistReasons, "Id", "Reason");


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

		//接收Blacklist訊息並存到table中
		[HttpPost]
		public ActionResult AddToBlacklist(int memberId, int blacklistReasonId)
		{
			using (var db = new AppDbContext())
			{
				// 取得會員資訊
				var member = db.Members.Find(memberId);

				if (member == null)
				{
					return HttpNotFound();
				}

				// 建立黑名單記錄
				var blacklist = new Blacklist
				{
					Id = member.Id,
					BlacklistReasonId = blacklistReasonId,
					BlacklistTime = DateTime.Now,
					NextRestorationTime = DateTime.Now.AddMonths(2)
				};

				// 將黑名單記錄加入資料庫
				db.Blacklists.Add(blacklist);
				db.SaveChanges();

				// 這裡你可以加入其他邏輯，例如發送通知給會員

				// 返回成功的視圖或重新導向到其他頁面
				return RedirectToAction("Index");
			}
		}
		[HttpGet]
		public ActionResult GetMemberIdByAccount(string memberAccount)
		{
			using (var db = new AppDbContext())
			{
				// 根據會員帳號取得會員Id
				var memberId = db.Members.Where(m => m.Account == memberAccount).Select(m => m.Id).FirstOrDefault();
				return Json(memberId, JsonRequestBehavior.AllowGet);
			}
		}

		//檢查成員是否在黑名單中
		[HttpGet]
		public ActionResult CheckMemberInBlacklist(int memberId)
		{
			using (var db = new AppDbContext())
			{
				// 检查 memberId 是否在黑名单中
				bool isBlacklisted = db.Blacklists.Any(b => b.Id == memberId && b.NextRestorationTime > DateTime.Now);
				return Json(isBlacklisted, JsonRequestBehavior.AllowGet);
			}
		}


	}
}

