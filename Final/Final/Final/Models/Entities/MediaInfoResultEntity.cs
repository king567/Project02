using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.Entities
{
	public class MediaInfoResultEntity
	{
		public int Id { get; set; }
		public int CategoryId { get; set; }
		public string CategoryName { get; set; }
		public string Title { get; set; }
		public string OverView { get; set; }
		public DateTime ReleaseDate { get; set; }
		public bool Adult { get; set; }
		public double Popularity { get; set; }
		public string OriginalLanguage { get; set; }
		public string OriginalTitle { get; set; }
		public bool Video { get; set; }
		public string BackdropPath { get; set; }
		public string PosterPath { get; set; }
		public List<Tuple<string, int>> GenreId { get; set; }
		public List<Tuple<string, int, DateTime?, DateTime?>> Ott { get; set; }
	}

}