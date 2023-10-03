using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Final.Models.EFModels;
using Final.Models.ViewModels;

using static Final.AutoMapperHelper;
namespace Final.Controllers
{
    [Authorize]
    public class NewsController : Controller
    {
        private AppDbContext db = new AppDbContext();

        // GET: News
        public ActionResult Index()
        {
            List<NewsVm> vm = GetNews();

            return View(vm);
        }

        // GET: News/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: News/Create
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(NewsVm vm)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    CreateNews(vm);
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", ex.Message);
                }
            }
            if (ModelState.IsValid)
            {
                return RedirectToAction("Index");
            }

            return View(vm);
        }

        private List<NewsVm> GetNews()
        {
           
            return MapperObj.Map<List<News>, List<NewsVm>>(db.News.ToList());

        }

        private void CreateNews(NewsVm vm)
        {

            var news = MapperObj.Map<NewsVm, News>(vm);

            db.News.Add(news);
            db.SaveChanges();
        }

        // GET: BlacklistReasons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            var vm = MapperObj.Map<News, NewsVm>(news);
            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(NewsVm vm)
        {
            var newsInDb = db.News.Find(vm.Id);
            newsInDb.Id = vm.Id;
            newsInDb.Title = vm.Title;
            newsInDb.Description = vm.Description;
            newsInDb.Publishdate = vm.Publishdate;

            if (ModelState.IsValid)
            {
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(vm);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var dbContext = new AppDbContext();
            var news = dbContext.News.Find(id);

            if (news == null) return HttpNotFound();

            dbContext.News.Remove(news);
            dbContext.SaveChanges();

            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
