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
    public class BlacklistReasonsController : Controller
    {
        private AppDbContext db = new AppDbContext();

        // GET: BlacklistReasons
        public ActionResult Index()
        {
            List<BlacklistReasonVm> vm = GetBlacklistReason();

            return View(vm);
        }

        // GET: BlacklistReasons/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: BlacklistReasons/Create
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BlacklistReasonVm vm)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    CreateBlacklistReason(vm);
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

        private List<BlacklistReasonVm> GetBlacklistReason()
        {
            //方法一
            //return db.blacklistreasons.select(b => new blacklistreasonvm
            //{
            //    id = b.id,
            //    reason = b.reason,
            //    displayorder = b.displayorder,
            //}).tolist();

            //方法二 (auto mapper)
            //var blacklistreason = db.BlacklistReasons.ToList();

            //var vms = AutoMapperHelper.Mapper.Map<List<BlacklistReason>, List<BlacklistReasonVm>>(blacklistreason);
            //return vms;

            //方法三 (auto mapper,要用using static)
            return MapperObj.Map<List<BlacklistReason>, List<BlacklistReasonVm>>(db.BlacklistReasons.ToList());

        }

        private void CreateBlacklistReason(BlacklistReasonVm vm)
        {

            var reason = MapperObj.Map<BlacklistReasonVm, BlacklistReason>(vm);

            db.BlacklistReasons.Add(reason);
            db.SaveChanges();
        }

        // GET: BlacklistReasons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BlacklistReason blacklistReason = db.BlacklistReasons.Find(id);
            if (blacklistReason == null)
            {
                return HttpNotFound();
            }
            var vm = MapperObj.Map<BlacklistReason, BlacklistReasonVm>(blacklistReason);
            return View(vm);
        }

        // POST: BlacklistReasons/Edit/5
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(BlacklistReasonVm vm)
        {
            var blacklistreasonInDb = db.BlacklistReasons.Find(vm.Id);
            blacklistreasonInDb.Id = vm.Id;
            blacklistreasonInDb.Reason = vm.Reason;
            blacklistreasonInDb.DisplayOrder = vm.DisplayOrder;

            if (ModelState.IsValid)
            {
                //db.Entry(blacklistReason).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(vm);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var dbContext = new AppDbContext();
            var blacklistreason = dbContext.BlacklistReasons.Find(id);

            if (blacklistreason == null) return HttpNotFound();

            dbContext.BlacklistReasons.Remove(blacklistreason);
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