using Project2.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.DTOs
{
	public class MediaInfosOttTypesRelDTO
	{
		public int Id { get; set; }

		public int MediaInfoId { get; set; }

		public DateTime Release_Date { get; set; }

		public DateTime? Removal_Date { get; set; }

		public string MediaInfoTitle { get; set; }

		public List<int> OttTypeId { get; set; }

		public List<string> OttTypeName { get; set; }
	}
}