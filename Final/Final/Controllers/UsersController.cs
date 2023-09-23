using Final.Models.EFModels;
using Final.Models.Infra;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Final.Controllers
{
    public class UsersController : Controller
    {
        // GET: Users
        public ActionResult Index()
        {
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
        private void ValidLogin(LoginVm vm)
       {
            var db = new AppDbContext();

            var user = db.Users.FirstOrDefault(p => p.Account == vm.Account);
            if (user == null)
            {
                throw new Exception("帳號或密碼有誤");
            }


            //將vm裡的密碼先雜湊後,在與db裡的密碼比對
            var salt = HashUtility.GetSalt();
            var hushedPassword = HashUtility.ToSHA256(vm.Password, salt);

            if (string.Compare(user.Password, hushedPassword, true) != 0)
            {
                throw new Exception("帳號或密碼有誤");
            }

            
        }
        private (string ReturnUrl, HttpCookie Cookie) ProcessLogin(LoginVm vm)
        {
            var rememberme = false; 
            var account = vm.Account;
            var roles = string.Empty; 

            //建立一張認證票
            var ticket = new FormsAuthenticationTicket(
                            1, 
                            account,
                            DateTime.Now, 
                            DateTime.Now.AddDays(2), 
                            rememberme,  
                            roles,       
                            "/"        
                            );

            //將它加密
            var value = FormsAuthentication.Encrypt(ticket);

            //存入cookie
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, value);

            //取得return url
            var url = FormsAuthentication.GetRedirectUrl(account, true); //第二個引數沒有用處

            return (url, cookie);
        }

    }
}