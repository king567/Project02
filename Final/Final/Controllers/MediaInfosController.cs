using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Repositories;
using Final.Models.Services;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class MediaInfosController : Controller
    {
        // GET: MediaInfos
        public ActionResult Index()
        {
            // 取得所有 genres 資料 和 ottTypes 資料 並傳給 View
            var genres = new GenreRepository().GetAllGenres();
            var otts = new OttRepository().GetAllOttTypes();
            var categories = new CategoryRepository().GetAllCategories();

			var vm = new MediaInfosInitVm
			{
				Genres = genres,
				OttTypes = otts,
                categories = categories
			};


			return View(vm);
        }

        public ActionResult Create()
        {
			// 取得所有 genres 資料 和 ottTypes 資料 並傳給 View
			var genres = new GenreRepository().GetAllGenres();
			var otts = new OttRepository().GetAllOttTypes();
			var categories = new CategoryRepository().GetAllCategories();
            var languageCodes = new LanguageCodeRepository().GetAllLanguageCodes();

			var vm = new MediaInfosInitVm
			{
				Genres = genres,
				OttTypes = otts,
				categories = categories,
				LanguageCodes = languageCodes
			};


			return View(vm);
		}

        // 更新 MediaInfo 資料
		public ActionResult Edit(int id)
		{
			// 取得 MediaInfo Id 的資料,及 genres 資料 和 ottTypes 資料 並傳給 View
			MediaInfosRelDTO mediaInfosDTO = new MediaInfoService().GetMediaInfo(id);

			// dto 轉成 vm
			MediaInfosRelVm editvm = mediaInfosDTO.Convert2VM();

			// 取得所有 genres 資料 和 ottTypes 資料 並傳給 EditInitVm
			var genres = new GenreRepository().GetAllGenres();
			var otts = new OttRepository().GetAllOttTypes();
			var categories = new CategoryRepository().GetAllCategories();
			var languageCodes = new LanguageCodeRepository().GetAllLanguageCodes();

			MediaInfosInitVm mediaInfosInitVm = new MediaInfosInitVm
			{
				Genres = genres,
				OttTypes = otts,
				categories = categories,
				LanguageCodes = languageCodes,
			};

			EditInitVm editInitVm = new EditInitVm
			{
				MediaInfosInitVm = mediaInfosInitVm,
				EditVm = editvm
			};


			return View(editInitVm);
		}

    }
}