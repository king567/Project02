using Project2.Models.EFModels;
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
    public class CreditCardController : Controller
    {
        private AppDbContext db = new AppDbContext();
        // GET: CreditCard
        public ActionResult Index()
        {
            var mamberaccount=User.Identity.Name;

            List<CreditCardVm> vm = GetCreditCard(mamberaccount);
            return View(vm);
        }
        // GET: CreditCards/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CreditCards/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CreditCardVm vm)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    CreateCreditCard(vm);
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

        private List<CreditCardVm> GetCreditCard(string acount)
        {

            return MapperObj.Map<List<Creditcard>, List<CreditCardVm>>(db.Creditcards.ToList());
        }

        private void CreateCreditCard(CreditCardVm vm)
        {

            var creditcard = MapperObj.Map<CreditCardVm, Creditcard>(vm);

            db.Creditcards.Add(creditcard);
            db.SaveChanges();
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var dbContext = new AppDbContext();
            var creditcards = dbContext.Creditcards.Find(id);

            if (creditcards == null) return HttpNotFound();

            dbContext.Creditcards.Remove(creditcards);
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