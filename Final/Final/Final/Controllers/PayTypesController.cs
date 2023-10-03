using AutoMapper;
using Final.Models.EFModels;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

using static Final.AutoMapperHelper;

namespace Final.Controllers
{
    [Authorize]
    public class PayTypesController : Controller
    {
        private AppDbContext db = new AppDbContext();
        // GET: PayTypes
        public ActionResult Index()
        {
            List<PayTypeVm> vms = GetPayType();

            return View(vms);
        }

        // GET: PayTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PayTypes/Create
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(PayTypeVm vm)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    CreataPayType(vm);
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

        // GET: PayTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayType payType = db.PayTypes.Find(id);
            if (payType == null)
            {
                return HttpNotFound();
            }
            var vm = MapperObj.Map<PayType, PayTypeVm>(payType);

            return View(vm);
        }

        // POST: PayTypes/Edit/5
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(PayTypeVm vm)
        {
            var paytypeInDb = db.PayTypes.Find(vm.Id);
            paytypeInDb.Id = vm.Id;
            paytypeInDb.Type = vm.Type;
            paytypeInDb.Fee = vm.Fee;
            paytypeInDb.DisplayOrder = vm.DisplayOrder;

            if (ModelState.IsValid)
            {
                //db.Entry(payType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(vm);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var dbContext = new AppDbContext();
            var paytype = dbContext.PayTypes.Find(id);

            if (paytype == null) return HttpNotFound();

            dbContext.PayTypes.Remove(paytype);
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

        private List<PayTypeVm> GetPayType()
        {
            //return db.PayTypes.Select(p => new PayTypeVm
            //{
            //    Id = p.Id,
            //    Type = p.Type,
            //    Fee = p.Fee,
            //    DisplayOrder = p.DisplayOrder,
            //}).ToList();

            return MapperObj.Map<List<PayType>, List<PayTypeVm>>(db.PayTypes.ToList());
        }

        private void CreataPayType(PayTypeVm vm)
        {
            var paytype = MapperObj.Map<PayTypeVm, PayType>(vm);


            db.PayTypes.Add(paytype);
            db.SaveChanges();
        }
    }
}