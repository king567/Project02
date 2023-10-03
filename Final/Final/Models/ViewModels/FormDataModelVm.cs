using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Final.Models.ViewModels
{
	public class FormDataModelVm
	{
		[Required(ErrorMessage = "標題必填")]
		public string Title { get; set; }

		[Required(ErrorMessage = "簡介必填")]
		public string OverView { get; set; }

		[Required(ErrorMessage = "原始語言必填")]
		public string OriginalLanguage { get; set; }

		[Required(ErrorMessage = "原始標題必填")]
		public string OriginalTitle { get; set; }

		[Required(ErrorMessage = "是否為成人片必填")]
		public bool Adult { get; set; }
		public List<OttItem> OttItems { get; set; }
		[Required(ErrorMessage = "影片類型必填")]
		public List<int> Genres { get; set; }

		[Required(ErrorMessage = "影片類別必填")]
		public int CategoryId { get; set; }
        public string PosterPath { get; set; }
		public string BackdropPath { get; set; }

		[Required(ErrorMessage = "影片語言必填")]
        public int LanguageCodeId { get; set; }
		public HttpPostedFileBase Poster { get; set; }
		public HttpPostedFileBase Backdrop { get; set; }
	}

	public class OttItem
	{
		[Required(ErrorMessage = "OTT平台必填")]
		public int ottPlatform { get; set; }
		[Required(ErrorMessage = "上映時間必填")]
		public DateTime releaseDate { get; set; }
		public DateTime? removeDate { get; set; }
	}

}