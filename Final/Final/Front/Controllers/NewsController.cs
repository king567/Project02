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
        public ActionResult Index( int pageIndex = 0)
        {
            int pageSize = 10;
            var news= new NewsService().GetAll(pageIndex,pageSize);
            var total= new NewsRepository().NewsCount("");
            var vm = MapperObj.Map<List<NewsVm>>(news);
            ViewBag.PaginationInfo = new PaginationInfo(pageSize, pageIndex, total);

            return View(vm);
            //var news=new NewsService().GetAll();
            //var vm=MapperObj.Map<List<NewsVm>>(news);

            //return View(vm);
        }

        // GET: News/Details/5
        public ActionResult Details(int? id)
        {
            var db= new AppDbContext();

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        //private Paged<NewsVm> GetPagedNews(string criteria, int pageSize, int pageIndex)
        //{
        //    var allProducts = Enumerable.Range(1, 10000).Select(n => new NewsVm { Id = n, Title = "Title", Description = "Description",Publishdate=DateTime.Now }).ToList();
        //    int skip = pageIndex * pageSize;

        //    IEnumerable<NewsVm> query = allProducts;
        //    if (!string.IsNullOrEmpty(criteria))
        //    {
        //        query = query.Where(p => p.Title.Contains(criteria));
        //    }

        //    var singlePageProducts = query.Skip(skip).Take(pageSize).ToList();
        //    int total = query.Count();

        //    return new Paged<NewsVm>(singlePageProducts, pageSize, pageIndex, total);
        //}
    }
    
    
    
}