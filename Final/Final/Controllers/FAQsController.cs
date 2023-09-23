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
    public class FAQsController : Controller
    {
        private AppDbContext db = new AppDbContext();

        // GET: FAQs
        public ActionResult Index()
        {
            List<FAQVm> vm = GetFAQ();
            return View(vm);
        }

		private List<FAQVm> GetFAQ()
		{
			return MapperObj.Map<List<FAQ>,List<FAQVm>>(db.FAQs.ToList()); 
		}

        // GET: FAQs/Create
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
       public ActionResult Create(FAQVm vm)
        {
			if (ModelState.IsValid)
            {
				try
                {
					CreateFAQ(vm);
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

		private void CreateFAQ(FAQVm vm)
		{
			var faq = MapperObj.Map<FAQVm, FAQ>(vm);

            db.FAQs.Add(faq);
            db.SaveChanges();
		}

		// GET: FAQs/Edit/5
		public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FAQ faq = db.FAQs.Find(id);
            if (faq == null)
            {
                return HttpNotFound();
            }
            var vm = MapperObj.Map<FAQ, FAQVm>(faq);
            return View(vm);
        }

        // POST: FAQs/Edit/5
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( FAQVm fAQVm)
        {   
            var faqInDb = db.FAQs.Find(fAQVm.Id);
                        faqInDb.Id = fAQVm.Id;
                        faqInDb.Question = fAQVm.Question;
                        faqInDb.Answer = fAQVm.Answer;
                        faqInDb.Enabled = fAQVm.Enabled;
                        faqInDb.DisplayOrder = fAQVm.DisplayOrder;

            if (ModelState.IsValid)
            {
                //db.Entry(fAQVm).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(fAQVm);
        }

        // GET: FAQs/Delete/5
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var faq = db.FAQs.Find(id);
            if (faq == null)
            {
                return HttpNotFound();
            }
            
            db.FAQs.Remove(faq);
            db.SaveChanges();

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
