using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Final.Models.ViewModels
{
	public class BlacklistVm
	{
		[Display(Name = "會員Id")]
		public int Id { get; set; }

		[Display(Name = "黑名單Id")]
		public int BlacklistReasonId { get; set; }

		[Display(Name = "黑名單時間")]
		public DateTime BlacklistTime { get; set; }

		[Display(Name = "恢復時間")]
		public DateTime NextRestorationTime { get; set; }

		[Display(Name = "黑名單理由")]
		public string Reason { get; set; }

		[Display(Name = "會員帳號")]
		public string MemberAccount { get; set; }
	}

}