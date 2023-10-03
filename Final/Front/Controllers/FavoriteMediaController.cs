using Final.Models.DTOs;
using Final.Models.Repositories;
using Final.Models.Services;
using Final.Models.ViewModels;
using Project2.Models.EFModels;
using Project2.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project2.Controllers
{
    public class FavoriteMediaController : Controller
    {
        // GET: FavoriteMedia
        [Authorize]
        public ActionResult Index(int pageIndex = 0)
        {
            int pageSize = 10;

			// 取得會員編號，並傳入 GetFavoriteMedia 方法
			var currentUserAccount = User.Identity.Name;

            int memberId = 0;

            using(var db = new AppDbContext())
            {
                memberId = db.Members.Where(m => m.Account == currentUserAccount).FirstOrDefault().Id;
            }

			ViewBag.MemberId = memberId;

			var vms = new FavoriteMediaService().GetFavoriteMedia(memberId);

            // 根據 vms.MediaInfoId 取得 MediaInfo 資料

            var mediaInfos = new MediaInfoRepository().GetMediaInfosInRange(vms.Select(x => x.MediaInfoId).ToList());

			int total = vms.Count();

            // 取得分頁資料
            var pageData = new MediaInfoRepository().GetMediaInfosInRangePage(vms.Select(x => x.MediaInfoId).ToList(), pageIndex, pageSize);

			// 將 mediaInfos 轉換成 MediaInfosRelDTO

			var mediaInfosRelDTO = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(pageData);

            // 將 mediaInfosRelDTO 轉換成 MediaInfosRelVm

            var mediaInfosRelVm = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelVm>>(mediaInfosRelDTO);

			ViewBag.PaginationInfo = new PaginationInfo(pageSize, pageIndex, total);

			return View(mediaInfosRelVm);
        }
    }
}