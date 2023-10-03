using Project2.Models.Infra;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Project2.Models.ViewModels
{
    public class CheckoutVm
    {
        [Display(Name = "信用卡號")]
        [Required(ErrorMessage = DAHelper.Required)]
        [StringLength(16, ErrorMessage = DAHelper.StringLength)]
        public string CardNumber { get; set; }

        [Display(Name = "背面末三碼")]
        [Required(ErrorMessage = DAHelper.Required)]
        [StringLength(3, ErrorMessage = DAHelper.StringLength)]
        public string ThreeNumber { get; set; }

        [Display(Name = "到期日")]
        [Required(ErrorMessage = DAHelper.Required)]
        [StringLength(7, ErrorMessage = "格式必須為yyyy/MM")]
        public string ExpireDate { get; set; }

        [Display(Name = "姓氏")]
        [Required(ErrorMessage = DAHelper.Required)]
        [StringLength(20, ErrorMessage = DAHelper.StringLength)]
        public string FirstName { get; set; }

        [Display(Name = "名字")]
        [Required(ErrorMessage = DAHelper.Required)]
        [StringLength(20, ErrorMessage = DAHelper.StringLength)]
        public string LastName { get; set; }
    }
}