using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
	public class BlacklistVm
	{
		public int Id { get; set; }

		//public int UserId { get; set; }

		public int? BlacklistReasonId { get; set; }

		public DateTime BlacklistTime { get; set; }

		public DateTime NextRestorationTime { get; set; }
	}
}