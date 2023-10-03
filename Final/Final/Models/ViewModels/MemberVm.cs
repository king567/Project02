using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
    public class MemberVm
    {
        public int Id { get; set; }

        [Display(Name = "帳號")]
        [Required]
        [StringLength(50)]
        public string Account { get; set; }

        [Display(Name = "姓名")]
        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [Display(Name = "生日")]
        [Required]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}", ApplyFormatInEditMode = true)]
        public DateTime BirthOfDate { get; set; }

        [Display(Name = "Email")]
        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Display(Name = "VIP結束日")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd HH:mm:SS}", ApplyFormatInEditMode = true)]
        public DateTime? VipEnddate { get; set; }

        [Display(Name = "停權結束日")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd HH:mm:SS}", ApplyFormatInEditMode = true)]
        public DateTime? BlacklistEnddate { get; set; }

        [Display(Name = "創建日期")]
        [Required]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}", ApplyFormatInEditMode = true)]
        public DateTime CreatedTime { get; set; }
    }
}