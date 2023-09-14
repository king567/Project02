using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace BookStore.Site.Models.ViewModels
{
    public class EditProfileVm
    {
        public int Id { get; set; }
        
        [Required]
        [StringLength(256)]
        [EmailAddress]
        public string Email { get; set; }

        [Display(Name = "姓名")]
        [Required]
        [StringLength(30)]
        public string Name { get; set; }

        [Display(Name = "手機")]
        [StringLength(10)]
        public string Mobile { get; set; }
        
    }
}