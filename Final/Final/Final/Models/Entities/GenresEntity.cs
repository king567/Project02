using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final.Models.Entities
{
	public class GenresEntity
	{
		public int Id { get; set; }

		[Required]
		[StringLength(150)]
		public string Name { get; set; }

		//public MediaInfosGenresRelEntity MediaInfos_Genres_Rel { get; set; }
	}
}