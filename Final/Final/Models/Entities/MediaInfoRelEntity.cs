using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final.Models.Entities
{
	public class MediaInfoRelEntity
	{
		public int Id { get; set; }

		public int CategoryId { get; set; }

		[StringLength(150)]
		public string Title { get; set; }

		public string OverView { get; set; }

		public DateTime? ReleaseDate { get; set; }

		public bool? Adult { get; set; }

		public int? Popularity { get; set; }

		[StringLength(50)]
		public string OriginalLanguage { get; set; }

		[StringLength(255)]
		public string OriginalTitle { get; set; }

		public bool? Video { get; set; }

		[StringLength(255)]
		public string BackdropPath { get; set; }

		[StringLength(50)]
		public string PosterPath { get; set; }

		public Category Category { get; set; }
		public MediaInfos_Genres_Rel MediaInfos_Genres_Rel { get; set; }
		public MediaInfos_OttTypes_Rel MediaInfos_OttTypes_Rel { get; set; }
	}
}