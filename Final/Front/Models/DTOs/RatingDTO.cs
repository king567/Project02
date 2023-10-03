using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.DTOs
{
	public class RatingDTO
	{
		public int Id { get; set; }
		public string MemberAccount { get; set; }
		public string MovieTitle { get; set; }
		public string Comment { get; set; }
		public int Rate { get; set; }
		public DateTime CreatedTime { get; set; }
	}
}