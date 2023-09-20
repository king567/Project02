using Final.Models.DTOs;
using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace Final.Controllers
{
    public class RatingsController : Controller
    {
        // GET: Ratings
        public ActionResult Index()
        {
            return View();
        }

        
    }
}