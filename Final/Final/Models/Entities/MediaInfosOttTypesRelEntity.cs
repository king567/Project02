using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.Entities
{
	public class MediaInfosOttTypesRelEntity
	{
		public int Id { get; set; }

		public int MediaInfoId { get; set; }

		public int OttTypeId { get; set; }

		public string OttTypeName { get; set; }

		public DateTime Release_Date { get; set; }

		public DateTime? Removal_Date { get; set; }
	}
}