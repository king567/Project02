﻿using Final.Models.DTOs;
using Final.Models.Services;
using Final.Models.ViewModels;
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

            HomesVm vm = new HomesVm()
            {
				GetNextOneMonthRelease = new MediaInfoService().GetNextOneMonthRelease().Convert2VM(),
                GetLastOneMonthMediaInfo = new MediaInfoService().GetLastOneMonthMediaInfo().Convert2VM(),
                GetNextOneMonthORemoval = new MediaInfoService().GetNextOneMonthORemoval().Convert2VM()
			};

			return View(vm);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}