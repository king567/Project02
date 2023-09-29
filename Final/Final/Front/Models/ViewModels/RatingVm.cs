using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.ViewModels
{
	public class RatingVm
	{
		public int Id { get; set; }
		public int MemberId { get; set; }
		public int MediaInfoId { get; set; }
		public int Rate { get; set; }
		public string Comment { get; set; }

		public DateTime CreatedTime { get; set; }

		public double AverageRating { get; set; }
		public int TotalReview { get; set; }
	}
}