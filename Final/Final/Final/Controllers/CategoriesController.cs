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
    public class CategoriesController : Controller
    {
        // GET: Category
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

		// 新增 Category
		[Authorize]
		public ActionResult Create()
        {
			return View();
		}

        [HttpPost]
		[Authorize]
		public ActionResult Create(Category vm)
        {
            // 檢查資料是否正確
            if (ModelState.IsValid)
            {
				// 儲存資料
                new CategoryRepository().Create(vm);
				// 回到 Index 頁面
				return RedirectToAction("Index");
			}
            else
            {
                // 回傳錯誤訊息
                return View(vm);
            }
		}
		// 修改 Category
		[Authorize]
		public ActionResult Edit(int id)
        {
            // Genres Service 取得指定 id genre 並傳給 View
            var category = new CategoryRepository().GetCategory(id);

            return View(category);
        }

        [HttpPost]
		[Authorize]
		public ActionResult Edit(Category vm)
        {
			// 檢查資料是否正確
			if (ModelState.IsValid)
            {
				// 儲存資料
				new CategoryRepository().Update(vm);
				// 回到 Index 頁面
				return RedirectToAction("Index");
			}
			else
            {
				// 回傳錯誤訊息
				return View(vm);
			}
		}
    }
}