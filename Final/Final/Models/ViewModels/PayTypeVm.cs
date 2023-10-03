using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Final.Models.ViewModels
{
    public class PayTypeVm
    {
        public int Id { get; set; }

        [Display(Name = "方案")]
        [Required(ErrorMessage = "{0}必填")]
        public string Type { get; set; }
        [Display(Name = "費用")]
        [DisplayFormat(DataFormatString = "{0:#,#}", ApplyFormatInEditMode = false)]
        public int Fee { get; set; }

        [Display(Name = "顯示順序")]
        [Required(ErrorMessage = "{0}必填")]
        public int DisplayOrder { get; set; }
    }
}