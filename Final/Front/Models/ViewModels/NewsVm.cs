using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Project2.Models.Infra;

namespace Project2.Models.ViewModels
{
    public class NewsVm
    {
        public int Id { get; set; }

        [Display(Name ="標題")]
        [Required(ErrorMessage =DAHelper.Required)]
        [StringLength(30)]
        public string Title { get; set; }

        [Display(Name = "內容")]
        [Required(ErrorMessage = DAHelper.Required)]
        public string Description { get; set; }

        [Display(Name = "發佈日期")]
        [Required(ErrorMessage = DAHelper.Required)]
        [Column(TypeName = "date")]
        public DateTime Publishdate { get; set; }
    }
}