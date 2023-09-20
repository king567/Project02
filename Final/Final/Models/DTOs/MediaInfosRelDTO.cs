using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.DTOs
{
	public class MediaInfosRelDTO
	{
		public int Id { get; set; }
		public int CategoryId { get; set; }
		public string CategoryName { get; set; }
		public string Title { get; set; }
		public string OverView { get; set; }
		public bool Adult { get; set; }
		public double Popularity { get; set; }
		public string OriginalLanguage { get; set; }
		public string OriginalTitle { get; set; }
		public bool Video { get; set; }
		public string BackdropPath { get; set; }
		public string PosterPath { get; set; }
		public List<GenresDTO> Genres { get; set; }
		public List<OttTypesDTO> OttTypes { get; set; }
	}
}