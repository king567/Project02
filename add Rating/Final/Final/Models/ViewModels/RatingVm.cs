using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Final.Models.ViewModels
{
    [DataContract]
    public class RatingVm
    {
        public int Id { get; set; }

        [Display(Name = "標題Id")]
        public int MediaInfoId { get; set; }

        [Display(Name = "會員ID")]
        public int? MemberId { get; set; }

        [Display(Name = "評論")]
        [StringLength(500)]
        public string Comment { get; set; }

        [Display(Name = "評分")]
        public int? Rate { get; set; }

        [Display(Name = "評分時間")]
        public DateTime? CreatedTime { get; set; }

        public virtual MediaInfo MediaInfo { get; set; }

        public virtual Member Member { get; set; }
    }
}