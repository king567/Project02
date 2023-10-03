using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    [Authorize]
    public class VipItemsController : Controller
    {
        // GET: VipItems
        public ActionResult Index()
        {
            return View();
        }
    }
}