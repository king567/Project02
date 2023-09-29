using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Project2.Models.ViewModels
{
    public class MemberVm
    {
        public int Id { get; set; }

        [Display(Name = "姓名")]
        public string Name { get; set; }

        [Display(Name = "帳號")]
        public string Account { get; set; }

        [Display(Name = "密碼")]
        public string Password { get; set; }

        [Display(Name = "Email")]
        [EmailAddress]
        public string Email { get; set; }

        [Display(Name = "生日")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd HH:mm:SS}", ApplyFormatInEditMode = true)]
        public DateTime BirthOfDate { get; set; }
    }
}