using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Final.Models.ViewModels
{
	public class RatingVm
	{
		public int Id { get; set; }

		[Display(Name = "影片分類")]
		public int CategoryId { get; set; }

		[Display(Name = "片名")]
		public string MediaInfoTitle { get; set; }

		[Display(Name = "會員帳號")]
		public string MemberAccount { get; set; }

		[Display(Name = "評分")]
		public int Rate { get; set; }


		[StringLength(500)]
		[Display(Name = "評論")]
		public string Comment { get; set; }

		[Display(Name = "評分時間")]
		public DateTime CreatedTime { get; set; }
	}
}