using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace BookStore.Site.Models.ViewModels
{
    public class LoginVm
    {
        [Display(Name = "帳號")]
        [Required]
        //老師省略寫error message 要寫
        public string Account { get; set; }

        [Display(Name = "密碼")]  //明碼
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        //若要記得我 要在這裡加remember me
    }
}