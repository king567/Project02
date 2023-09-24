using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
	public class FormDataModelVm
	{
		public string Title { get; set; }
		public string OverView { get; set; }
		public string OriginalLanguage { get; set; }
		public string OriginalTitle { get; set; }
		public bool? Adult { get; set; }
		public bool? Video { get; set; }
		public List<OttItem> OttItems { get; set; }
		public List<int> Genres { get; set; }
		public int CategoryId { get; set; }
        public string PosterPath { get; set; }
		public string BackdropPath { get; set; }
        public int LanguageCodeId { get; set; }
    }

	public class OttItem
	{
		public int ottPlatform { get; set; }
		public DateTime releaseDate { get; set; }
		public DateTime? removeDate { get; set; }
	}

}