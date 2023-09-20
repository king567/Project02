using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.Entities
{
	public class Movie
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
		public List<Genre> Genre { get; set; }
		public List<Ott> Ott { get; set; }
	}

	public class Genre
	{
		public int GenreId { get; set; }
		public string GenreName { get; set; }
	}

	public class Ott
	{
		public int OttId { get; set; }
		public string OttName { get; set; }
		public DateTime Release_Date { get; set; }
		public DateTime? Removal_Date { get; set; }
	}

}