using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.Entities
{
	public class MediaInfosGenresRelEntity
	{
		public int Id { get; set; }
		public int MediaInfoId { get; set; }
		public int GenreId { get; set; }
		public string GenreName { get; set; }
	}
}