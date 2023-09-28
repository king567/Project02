using Project2.Models.Infra;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Project2.Models.ViewModels
{
    public class LoginVm
    {
        [Display(Name = "帳號")]
        [Required(ErrorMessage =DAHelper.Required)]
        public string Account { get; set; }

        [Display(Name = "密碼")]  //明碼
        [Required(ErrorMessage = DAHelper.Required)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        //若要記得我 要在這裡加remember me
        [Display(Name = "記住我")]
        public bool RememberMe { get; set; }
    }
}