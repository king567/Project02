using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Project2.Models.ViewModels
{
    public class VipitemVm
    {
        [Display(Name = "付款日期")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd HH:mm:SS}", ApplyFormatInEditMode = true)]
        public DateTime PaymentDate { get; set; }

        [Display(Name = "起始日期")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd HH:mm:SS}", ApplyFormatInEditMode = true)]
        public DateTime StartDate { get; set; }

        [Display(Name = "到期日期")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd HH:mm:SS}", ApplyFormatInEditMode = true)]
        public DateTime ExpiryDate { get; set; }
        public int PaytypeId { get; set; }

        [Display(Name = "方案")]
        public string Type{ get; set; }

        [Display(Name = "費用")]
        public int Fee { get; set; }
        public int CreditcardId { get; set; }

        [Display(Name = "付款方式")]
        public string CardNumber { get; set; }
    }
}