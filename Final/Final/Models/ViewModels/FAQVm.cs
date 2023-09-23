using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
	public class FAQVm
	{
		public int Id { get; set; }

		[Required]
		[StringLength(100)]
		[Display(Name = "常見問題")]
		public string Question { get; set; }

		[Required]
		[Display(Name = "回答")]
		public string Answer { get; set; }

		[Display(Name = "是否啟用")]
		public bool Enabled { get; set; }

		[Display(Name = "顯示順序")]
		public int DisplayOrder { get; set; }



	}
}