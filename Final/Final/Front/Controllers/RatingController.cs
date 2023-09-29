using Project2.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project2.Controllers
{
    public class RatingController : Controller
    {
		// GET: Rating
		public ActionResult Index()
		{
			// 使用 RatingService 或 EF DbContext 從數據庫中獲取評論數據
			var ratingService = new RatingService();
			int mediaInfoId = 26;

			// 將評論數據傳遞給視圖
			var ratings = ratingService.GetRatings(mediaInfoId);
			return View(ratings);
		}
	}
}