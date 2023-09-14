using BookStore.Site.Models.FEModels;
using BookStore.Site.Models.Infra;
using BookStore.Site.Models.ViewModels;
using System;
using System.Collections.Generic;
using Microsoft.Ajax.Utilities;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace BookStore.Site.Controllers
{
    public class MembersController : Controller
    {
        [Authorize]
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
            if(!ModelState.IsValid) 
            {
                return View(vm);
            }
            try 
            {
                RegisterMember(vm);
            }catch (Exception ex) 
            {
                ModelState.AddModelError("",ex.Message);
                return View(vm);
            }
            return View("RegisterConfirm");
        }


        //將IsConfirmed設為true 
        //cb20f43cf65b49d384ba6eb12e28883b
        public ActionResult ActiveRegister(int memberId,string confirmCode)
        {
            if(memberId<=0 || string.IsNullOrEmpty(confirmCode)) 
            { 
                return View(); 
            }

            var db=new AppDbContext();

            //根據 memberId,confirmCode 取得 Member
            var member=db.Members.FirstOrDefault(p=>p.Id==memberId && p.ConfirmCode==confirmCode &&p.IsConfirmed==false);
            if (member == null) 
            {
                return View();
            }
            //將他更新為已確認
            member.IsConfirmed = true;
            member.ConfirmCode = null;
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
            }catch(Exception ex) 
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
            return Redirect("/Members/Login");
        }
        
        [Authorize]
        public ActionResult EditProfile() 
        {
            return View() ;
        }

        [Authorize]
        [HttpPost]
        public ActionResult EditProfile(EditProfileVm vm)
        {
            return View();
        }

        private void ValidLogin(LoginVm vm)
         {
            var db = new AppDbContext();

            //根據帳號取得Member
            var member = db.Members.FirstOrDefault(p=>p.Account==vm.Account);
            if (member == null) 
            {
                throw new Exception("帳號或密碼有誤");//原則上不要告知細節
            }

            //檢查是否已確認
            if (member.IsConfirmed == false) 
            {
                throw new Exception("您尚未開通會員資格,請先收確認信,並點選信裡的連結,完成認證,才能登入本網站");
            }

            //將vm裡的密碼先雜湊後,在與db裡的密碼比對
            var salt = HashUtility.GetSalt();
            var hushedPassword = HashUtility.ToSHA256(vm.Password, salt);

            if (string.Compare(member.EncryptedPassword, hushedPassword, true) != 0) 
            {
                throw new Exception("帳號或密碼有誤");
            }
          }

        private (string ReturnUrl, HttpCookie Cookie) ProcessLogin(LoginVm vm)
        {
            var rememberme = false; //若LoginVm有rememberme屬性,記得要設定
            var account=vm.Account;
            var roles = string.Empty; //在本範例沒有用到角色權限,所以存入空白

            //建立一張認證票
            var ticket = new FormsAuthenticationTicket(
                            1, //版本別,沒有特別用處
                            account,
                            DateTime.Now, //發行日
                            DateTime.Now.AddDays(2), //到期日
                            rememberme,  //是否續存
                            roles,       //userdata
                            "/"         //cookie位置
                            );

            //將它加密
            var value=FormsAuthentication.Encrypt(ticket);

            //存入cookie
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, value);

            //取得return url
            var url = FormsAuthentication.GetRedirectUrl(account, true); //第二個引數沒有用處

            return (url, cookie);
        }



        //這支method如何實作註冊功能
        //直接叫用EF
        //較用MemberService
        private void RegisterMember(RegisterVm vm)
        {
            var db = new AppDbContext();

            //判斷帳號是否存在
            var memberInDb=db.Members.FirstOrDefault(p=>p.Account==vm.Account);
            if (memberInDb!=null) 
            {
                throw new Exception("帳號已存在");
            }

            //將vm轉成Member
            var member = vm.ToEFModel();

            //叫用EF寫入資料庫
            db.Members.Add(member);
            db.SaveChanges();

            //todo發出確認信
        }
    }
}