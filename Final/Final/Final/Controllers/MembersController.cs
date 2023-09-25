using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class MembersController : Controller
    {
        // GET: Members
        public ActionResult Index()
        {
            var db=new AppDbContext();
            var members = db.Members.ToList();
            return View(members);
        }
    }

   
}