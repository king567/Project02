using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Final.Models.ViewModels
{
    public class NewsVm
    {
        public int Id { get; set; }

        [Display(Name = "標題")]
        [Required]
        [StringLength(30)]
        public string Title { get; set; }

        [Display(Name = "內容")]
        [Required]
        public string Description { get; set; }

        [Display(Name = "發佈日期")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}", ApplyFormatInEditMode = true)]
        public DateTime Publishdate { get; set; }


    }

}