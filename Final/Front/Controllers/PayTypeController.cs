using Project2.Models.EFModels;
using Project2.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project2.Controllers
{
    [Authorize]
    public class PayTypeController : Controller
    {
        
        // GET: PayType
        public ActionResult Index()
        {
            List<PayTypeVm> vms = GetPayTypes();
            return View(vms);
        }

        private List<PayTypeVm> GetPayTypes()
        {
            var db = new AppDbContext();
            var paytypes = db.PayTypes
                             .AsNoTracking()
                             .Select(p => new PayTypeVm
                             {
                              Id = p.Id,
                              Type=p.Type,
                              Fee=p.Fee,
                              })
                             .ToList();
            return paytypes;
        }
    }
}