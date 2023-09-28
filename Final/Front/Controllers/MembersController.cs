using Project2.Models.EFModels;
using Project2.Models.Infra;
using Project2.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Project2.Controllers
{
    public class MembersController : Controller
    {
        // GET: Members
        public ActionResult Index()
        {
            return View();
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
            return View("RegisterConfirm");
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
    }
}