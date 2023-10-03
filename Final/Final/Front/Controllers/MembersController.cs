using Project2.Models.EFModels;
using Project2.Models.Infra;
using Project2.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

using static Project2.AutoMapperHelper;
namespace Project2.Controllers
{
    public class MembersController : Controller
    {
        // GET: Members
        public ActionResult Index()
        {
            var currentUserAccount = User.Identity.Name;
            MemberCenterVm vm = GetMemberProfile(currentUserAccount);
            return View(vm);
        }
        // GET: Members
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterVm vm)
        {
            if (!ModelState.IsValid)
            {
                return View(vm);
            }
            try
            {
                RegisterMember(vm);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(vm);
            }
            return View("ConfirmCode");
        }

        public ActionResult ActiveRegister(int memberId, string confirmCode)
        {
            if (memberId <= 0 || string.IsNullOrEmpty(confirmCode))
            {
                return View();
            }

            var db = new AppDbContext();

            //根據 memberId,confirmCode 取得 Member
            var member = db.Members.FirstOrDefault(p => p.Id == memberId && p.ConfirmedCode == confirmCode && p.IsConfirmed == false);
            if (member == null)
            {
                return View();
            }
            //將他更新為已確認
            member.IsConfirmed = true;
            member.ConfirmedCode = null;
            db.SaveChanges();

            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginVm vm)
        {
            if (!ModelState.IsValid)
            {
                return View(vm);
            }

            try
            {
                ValidLogin(vm);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(vm);
            }

            var processResult = ProcessLogin(vm);

            Response.Cookies.Add(processResult.Cookie);
            return Redirect(processResult.ReturnUrl);
        }

        public ActionResult Logout()
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            return Redirect("/Home/Index");
        }

        [Authorize]
        public ActionResult EditPassword()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult EditPassword(EditPasswordVm vm)
        {
            if (!ModelState.IsValid)
            {
                return View(vm);
            }
            try
            {
                var currentAccount = User.Identity.Name;
                ChangePassword(vm, currentAccount);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View();
            }
            return RedirectToAction("Index");
        }

        public ActionResult ForgetPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ForgetPassword(ForgetPasswordVm vm)
        {
            if (!ModelState.IsValid) return View(vm);

            var urlTemplate = Request.Url.Scheme + "://" + //生成 http://或http:.//
                            Request.Url.Authority + "/" + //生成網域名稱或ip
                            "Members/ResetPassword?memberid={0}&confirmCode={1}'";//生成網頁url

            try
            {
                ProcessResetPassword(vm.Account, vm.Email, urlTemplate);

            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(vm);
            }
            //return PartialView("_ForgetPasswordPartial");
            return View("ForgetPasswordConfirm"); //目前小視窗是怪怪的,無法驗證當隊時才出現
        }

        public ActionResult ResetPassword(int memberId, string confirmedCode)
        {
            return View();
        }

        [HttpPost]
        public ActionResult ResetPassword(int memberId, string confirmedCode, ResetPasswordVm vm)
        {
            //檢查vm是通過驗證
            if (!ModelState.IsValid) return View(vm);

            try
            {
                //檢查是否有 memberId, confirmCode
                //檢查 memberId, confirmCode是否正確
                //重設密碼
                ProcessResetPassword(memberId, confirmedCode, vm);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(vm);
            }
            //顯示重設密碼成功畫面
            return View("ConfirmResetPassword");
        }

        private void ProcessResetPassword(int memberId, string confirmedCode, ResetPasswordVm vm)
        {
            var db = new AppDbContext();

            //檢查 memberId, confirmCode是否正確
            var memberInDb = db.Members.FirstOrDefault(m => m.Id == memberId &&
                                                     m.IsConfirmed == true &&
                                                     m.ConfirmedCode == confirmedCode);
            if (memberInDb == null) return; //不動聲色的離開

            //重設密碼
            var salt = HashUtility.GetSalt();
            var hashedPassword = HashUtility.ToSHA256(vm.Password, salt);
            memberInDb.Password = hashedPassword;
            memberInDb.ConfirmedCode = null;
            db.SaveChanges();

        }

        private void ProcessResetPassword(string account, string email, string urlTemplate)
        {
            var db = new AppDbContext();
            var memberInDb = db.Members.FirstOrDefault(m => m.Account == account);

            if (memberInDb == null)
            {
                throw new Exception("帳號不存在");
            }
            if (string.Compare(email, memberInDb.Email, StringComparison.CurrentCultureIgnoreCase) != 0)
            {
                throw new Exception("帳號或Emil錯誤");
            }

            //檢查IsConfirmed必須是true,因為只有已啟用帳號才能重設密碼
            if (memberInDb.IsConfirmed == false)
            {
                throw new Exception("您還沒有啟用本帳號,請先完成才能重設密碼");
            }

            //更新紀錄,填入confirmCode
            var confirmCode = Guid.NewGuid().ToString("N");
            memberInDb.ConfirmedCode = confirmCode;
            db.SaveChanges();

            //發送重設密碼信
            var url = string.Format(urlTemplate, memberInDb.Id, confirmCode);
            new EmailHelper().SendForgetPasswordEmail(url, memberInDb.Name, email);
        }

        private void RegisterMember(RegisterVm vm)
        {
            var db = new AppDbContext();

            var memberInDb = db.Members.FirstOrDefault(p => p.Account == vm.Account);
            if (memberInDb != null)
            {
                throw new Exception("帳號已存在");
            }

            var member = vm.ToEFModel();

            db.Members.Add(member);
            db.SaveChanges();
        }
        private void ValidLogin(LoginVm vm)
        {
            var db = new AppDbContext();

            //根據帳號取得Member
            var member = db.Members.FirstOrDefault(p => p.Account == vm.Account);
            if (member == null)
            {
                throw new Exception("帳號或密碼有誤");
            }

            //檢查是否已確認
            if (member.IsConfirmed == false)
            {
                throw new Exception("您尚未開通會員資格,請先收確認信,並點選信裡的連結,完成認證,才能登入本網站");
            }

            //將vm裡的密碼先雜湊後,在與db裡的密碼比對
            var salt = HashUtility.GetSalt();
            var hushedPassword = HashUtility.ToSHA256(vm.Password, salt);

            if (string.Compare(member.Password, hushedPassword, true) != 0)
            {
                throw new Exception("帳號或密碼有誤");
            }
        }
        private (string ReturnUrl, HttpCookie Cookie) ProcessLogin(LoginVm vm)
        {
            var rememberme = true; 
            var account = vm.Account;
            var roles = string.Empty; 

            //建立一張認證票
            var ticket = new FormsAuthenticationTicket(
                            1, 
                            account,
                            DateTime.Now, 
                            DateTime.Now.AddDays(30), 
                            rememberme,  
                            roles,       
                            "/"         
                            );

            //將它加密
            var value = FormsAuthentication.Encrypt(ticket);

            //存入cookie
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, value);

            //取得return url
            var url = FormsAuthentication.GetRedirectUrl(account, true); 

            return (url, cookie);
        }
        private void ChangePassword(EditPasswordVm vm, string account)
        {
            //利用vm.Id去資料庫取得member
            var db = new AppDbContext();

            var memberInDb = db.Members.FirstOrDefault(p => p.Account == account);

            if (memberInDb == null)
            {
                throw new Exception("帳號不存在");
            }

            var salt = HashUtility.GetSalt();

            //判斷輸入的原始密碼是否正確
            var hashOrigPassword = HashUtility.ToSHA256(vm.OriginalPassword, salt);
            if (string.Compare(memberInDb.Password, hashOrigPassword, true) != 0)
            {
                throw new Exception("原始密碼不正確");
            }

            //將新密碼雜湊
            var hashPassword = HashUtility.ToSHA256(vm.Password, salt);

            //更新紀錄
            memberInDb.Password = hashPassword;
            db.SaveChanges();
        }

        private MemberCenterVm GetMemberProfile(string account)
        {
            var db = new AppDbContext();

            var member = db.Members.FirstOrDefault(p => p.Account == account);
            
            var vipitem = db.Vipitems
                             .Where(v => v.MemberId == member.Id)
                             .Include(v => v.PayType)
                             .Include(v => v.Creditcard)
                             .ToList();
            Blacklist blacklist = db.Blacklists
                              .Where(b => b.Id == member.Id)
                              .Include(b => b.BlacklistReason)
                              .FirstOrDefault();


            if (member == null)
            {
                throw new Exception("帳號不存在");
            }

            MemberCenterVm data = new MemberCenterVm
            {
                Member = MapperObj.Map<MemberVm>(member),
                Vipitem = MapperObj.Map<List<VipitemVm>>(vipitem),
                Blacklist = MapperObj.Map<BlacklistVm>(blacklist)
            };

            if (blacklist != null)
            {
                data.Blacklist.BlacklistReason= blacklist.BlacklistReason.Reason;
            }

            return data;
        }
    }
}