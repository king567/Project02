using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Final.Models.ViewModels
{
    public class RegisterVm
    {
        public int Id { get; set; }

        [Display(Name = "帳號")]
        [Required]
        [StringLength(50)]
        public string Account { get; set; }

        [Display(Name = "密碼")]  
        [Required]
        [StringLength(50)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "確認密碼")]
        [Required]
        [StringLength(50)]
        [Compare(nameof(Password))]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }

        [Display(Name = "姓名")]
        [Required]
        [StringLength(50)]
        public string Name { get; set; }

    }
}