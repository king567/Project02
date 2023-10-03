using Final.Models.DTOs;
using Final.Models.Services;
using Final.Models.ViewModels;
using Project2.Models.Services;
using Project2.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //int page = 1;
            //int pageSize = 10;

            //List<MediaInfosRelDTO> dtos = new MediaInfoService().GetMediaInfosPage(page, pageSize);

            //// DTO 轉成 VM
            //List<MediaInfosRelVm> vm = dtos.Convert2VM();

            var message = TempData["Message"] as string;

            if (!string.IsNullOrEmpty(message))
            {
                ViewBag.Message = message;
            }

            var joinmember = TempData["JoinMember"] as string;

            if (!string.IsNullOrEmpty(joinmember))
            {
                ViewBag.JoinMember = joinmember;
            }

            var forgetPassword = TempData["ForgetPassword"] as string;

            if (!string.IsNullOrEmpty(forgetPassword))
            {
                ViewBag.JoinMember = forgetPassword;
            }

            var resetPassword = TempData["ResetPassword"] as string;

            if (!string.IsNullOrEmpty(resetPassword))
            {
                ViewBag.JoinMember = resetPassword;
            }

            ViewBag.TopFive = new RatingService().GetTopFive().Convert2VM();

			HomesVm vm = new HomesVm()
            {
				GetNextOneMonthRelease = new MediaInfoService().GetNextOneMonthRelease().Convert2VM(),
                GetLastOneMonthMediaInfo = new MediaInfoService().GetLastOneMonthMediaInfo().Convert2VM(),
                GetNextOneMonthORemoval = new MediaInfoService().GetNextOneMonthORemoval().Convert2VM()
			};

			return View(vm);
        }

        public ActionResult Project()
        {

            return View();
        }
    }
}