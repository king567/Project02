using Final.Models.EFModels;
using Final.Models.Repositories;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class GenresController : Controller
    {
        // GET: Genres
        public ActionResult Index()
        {
			// 取得所有 genres 資料 和 ottTypes 資料 並傳給 View
			var genres = new GenreRepository().GetAllGenres();

			var vm = new MediaInfosInitVm
			{
				Genres = genres,
			};

			return View(vm);
        }

		// 新增 Genre
		public ActionResult Create()
		{
			// Genres Service 取得所有 genres 並傳給 View

			return View();
		}

		[HttpPost]
		public ActionResult Create(Genre genre)
		{
			// Genres Service 新增 genre
			if (ModelState.IsValid)
			{
				new GenreRepository().Create(genre);
				return RedirectToAction("Index");
			}

			return RedirectToAction("Index");
		}

		// 修改 Genre
		public ActionResult Edit(int id)
		{
			// Genres Service 取得指定 id genre 並傳給 View
			var genre = new GenreRepository().GetGenreById(id);

			return View(genre);
		}

		[HttpPost]
		public ActionResult Edit(Genre genre)
		{
			// Genres Service 修改 genre
			if (ModelState.IsValid)
			{
				new GenreRepository().UpdateGenre(genre);
				return RedirectToAction("Index");
			}

			return RedirectToAction("Index");
		}
	}
}