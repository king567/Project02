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
    public class BlacklistController : Controller
    {
		private AppDbContext db = new AppDbContext();

		// GET: BlacklistVms
		public ActionResult Index()
		{
			// 在呈現黑名單之前，檢查並移除過期的黑名單
			RemoveFromBlacklistIfTimeExpired();

			List<BlacklistVm> vm = GetBlacklist();
			return View(vm);
		}

		private List<BlacklistVm> GetBlacklist()
		{
			//return MapperObj.Map<List<Blacklist>, List<BlacklistVm>>(db.Blacklists.ToList());
			var blacklistData = db.Blacklists
			.Include(b => b.Member) // 加載關聯的會員數據
			.Include(b => b.BlacklistReason) // 加載關聯的黑名單理由數據
			.ToList();

			var vmList = blacklistData.Select(blacklist => new BlacklistVm
			{
				Id = blacklist.Id,
				BlacklistReasonId = blacklist.BlacklistReasonId,
				BlacklistTime = blacklist.BlacklistTime,
				NextRestorationTime = blacklist.NextRestorationTime,

				// 使用關聯的會員和黑名單理由數據填充ViewModel的相關字段
				MemberAccount = blacklist.Member != null ? blacklist.Member.Account : "未知會員",
				Reason = blacklist.BlacklistReason != null ? blacklist.BlacklistReason.Reason : "未知理由"
			}).ToList();

			return vmList;
		}



		// GET: BlacklistVms/Edit/5
		public ActionResult Edit(int? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			Blacklist blacklist = db.Blacklists.Find(id);
			if (blacklist == null)
			{
				return HttpNotFound();
			}
			// 檢索所有黑名單理由，用於下拉式選單
			var blacklistReasons = db.BlacklistReasons.ToList();
			ViewBag.BlacklistReasons = new SelectList(blacklistReasons, "Id", "Reason", blacklist.BlacklistReasonId);

			var vm = MapperObj.Map<Blacklist, BlacklistVm>(blacklist);
			return View(vm);
		}

		// POST: BlacklistVms/Edit/5
		// 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
		// 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Edit(BlacklistVm blacklistVm)
		{
			var blacklistInDb = db.Blacklists.Find(blacklistVm.Id);

			blacklistInDb.BlacklistReasonId = blacklistVm.BlacklistReasonId;
			blacklistInDb.BlacklistTime = blacklistVm.BlacklistTime;
			blacklistInDb.NextRestorationTime = blacklistVm.NextRestorationTime;

			if (ModelState.IsValid)
			{
				db.SaveChanges();
				return RedirectToAction("Index");
			}

			return View(blacklistVm);
		}

		private void RemoveFromBlacklistIfTimeExpired()
		{
			var currentDateTime = DateTime.Now;

			// 找到所有已經過期的黑名單記錄
			var expiredBlacklists = db.Blacklists.Where(b => b.NextRestorationTime <= currentDateTime).ToList();

			foreach (var blacklist in expiredBlacklists)
			{
				// 移除黑名單，這部分可以根據你的業務邏輯進行修改
				var member = db.Members.Find(blacklist.Id);
				if (member != null)
				{
					member.BlacklistEnddate = null;
				}

				// 刪除過期的黑名單記錄
				db.Blacklists.Remove(blacklist);
			}

			// 保存更改
			db.SaveChanges();
		}

	}
}
