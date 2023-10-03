
using Project2.Models.EFModels;
using Project2.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using static Project2.AutoMapperHelper;
namespace Project2.Controllers
{
    public class VIPController : Controller
    {
        // GET: VIP
        [Authorize]
        public ActionResult JoinVip(int paytypeId)
        {
            return RedirectToAction("Checkout", new { paytypeId = paytypeId });
        }


        [Authorize]
        public ActionResult Checkout()
        {
            var buyer = User.Identity.Name;

            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult Checkout(int paytypeId, CheckoutVm vm)
        {
            if (!ModelState.IsValid) return View(vm);

            var buyer = User.Identity.Name;


            ProcessCheckout(buyer, paytypeId, vm);
            return View("ConfirmCheckout");

        }

        private void ProcessCheckout(string account, int paytypeId, CheckoutVm vm)
        {
            //建立訂單主檔明細檔
            CreateOrder(account, paytypeId, vm);
        }

        private void CreateOrder(string account, int paytypeId, CheckoutVm vm)
        {
            var db = new AppDbContext();

            var memberId = db.Members.First(m => m.Account == account).Id;

            var virtualCreditcard = new Creditcard
            {
                MemberId = memberId,
                CardNumber = vm.CardNumber,
                ThreeNumber = vm.ThreeNumber,
                ExpireDate = vm.ExpireDate,
                FirstName = vm.FirstName,
                LastName = vm.LastName
                
                // 设置其他信用卡属性，例如 CardNumber、ThreeNumber、ExpireDate、FirstName、LastName 等
                // 你可以设置这些属性为默认值或者根据需求设置
            };
            db.Creditcards.Add(virtualCreditcard);
            db.SaveChanges();

            var vipitem = new Vipitem
            {
                MemberId = memberId,
                PayTypeId = paytypeId,
                CreditcardId = virtualCreditcard.Id,
                PaymentDate = DateTime.Now,
                StartDate = DateTime.Now,
                ExpiryDate = CalculateExpiryDate(paytypeId)

            };

            // 保存 vipitem 到数据库
            db.Vipitems.Add(vipitem);
            db.SaveChanges();

            var members = db.Members.FirstOrDefault(m =>m.Id==memberId);

            members.VipStartdate = DateTime.Now;
            members.VipEnddate = CalculateExpiryDate(paytypeId);

            db.SaveChanges();
        }
        // 新的方法，根據 paytypeId 計算到期日期
        private DateTime CalculateExpiryDate(int paytypeId)
        {
            // 根據不同的 paytypeId 返回不同的到期日期
            switch (paytypeId)
            {
                case 1: // 一個月的方案
                    return DateTime.Now.AddMonths(1);
                case 2: // 季度方案（三個月）
                    return DateTime.Now.AddMonths(3);
                // 可以添加其他方案的計算
                default:
                    return DateTime.Now.AddMonths(1); // 默認為一個月
            }
        }
    }
}