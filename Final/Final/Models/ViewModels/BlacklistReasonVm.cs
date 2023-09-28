using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Final.Models.ViewModels
{
    public class BlacklistReasonVm
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "理由")]
        public string Reason { get; set; }
        [Display(Name = "顯示順序")]
        public int DisplayOrder { get; set; }
    }
}