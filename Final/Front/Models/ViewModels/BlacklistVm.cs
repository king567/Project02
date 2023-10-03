using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Project2.Models.ViewModels
{
    public class BlacklistVm
    {
        public int Id { get; set; }
        public int BlacklistReasonId { get; set; }

        [Display(Name = "停權理由")]
        public string BlacklistReason { get; set; }

        [Display(Name = "停權時間")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd HH:mm:SS}", ApplyFormatInEditMode = true)]
        public DateTime BlacklistTime { get; set; }

        [Display(Name = "解除時間")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd HH:mm:SS}", ApplyFormatInEditMode = true)]
        public DateTime NextRestorationTime { get; set; }
    }
}