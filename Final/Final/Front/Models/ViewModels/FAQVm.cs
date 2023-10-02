using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Project2.Models.ViewModels
{
	public class FAQVm
	{
		[Display(Name = "編號")]
		public int Id { get; set; }

		[Required]
		[StringLength(100)]
		[Display(Name = "問題")]
		public string Question { get; set; }

		[Required]
		[Display(Name = "回答")]
		public string Answer { get; set; }
	}
}