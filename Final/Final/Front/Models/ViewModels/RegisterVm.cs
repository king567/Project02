using Project2.Models.Infra;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Project2.Models.ViewModels
{
    public class RegisterVm
    {
        public int Id { get; set; }

        [Display(Name = "姓名")]
        [Required(ErrorMessage =DAHelper.Required)]
        [StringLength(50)]
        public string Name { get; set; }

        [Display(Name = "帳號")]
        [Required(ErrorMessage = DAHelper.Required)]
        [StringLength(50)]
        public string Account { get; set; }

        [Display(Name = "密碼")]
        [Required(ErrorMessage = DAHelper.Required)]
        [StringLength(50)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "確認密碼")]
        [Required(ErrorMessage = DAHelper.Required)]
        [StringLength(50)]
        [Compare(nameof(Password), ErrorMessage = DAHelper.Compare)]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
        
        [Display(Name = "生日")]
        [Required(ErrorMessage = DAHelper.Required)]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd HH:mm:SS}", ApplyFormatInEditMode = true)]
        public string BirthOfDay { get; set; }

        [Required(ErrorMessage = DAHelper.Required)]
        [StringLength(256,ErrorMessage =DAHelper.EmailAdress)]
        [EmailAddress]
        public string Email { get; set; }

        

    }
}