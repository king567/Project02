using Project2.Models.EFModels;
using Project2.Models.Repositories;
using Project2.Models.Services;
using Project2.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

using static Project2.AutoMapperHelper;
namespace Project2.Controllers
{
    public class NewsController : Controller
    {
        // GET: News
        public ActionResult Index(int pageIndex = 0)
        {
            int pageSize = 10;
            var news = new NewsService().GetAll(pageIndex, pageSize);
            var total = new NewsRepository().NewsCount("");
            var vm = MapperObj.Map<List<NewsVm>>(news);
            ViewBag.PaginationInfo = new PaginationInfo(pageSize, pageIndex, total);

            return View(vm);
        }

        // GET: News/Details/5
        public ActionResult Details(int? id)
        {
            var db = new AppDbContext();

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            var vm = MapperObj.Map<NewsVm>(news);
            return View(vm);
        }
    }
}