using Final.Models.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
	public class MediaInfosRelVm
	{
		public int Id { get; set; }
		public int CategoryId { get; set; }
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
		public List<int> GenreId { get; set; }
		public List<int> OttTypeId { get; set; }
	}

	public static class MediaInfosRelVmExts
	{
		public static List<MediaInfosRelVm> Convert2VM(this List<MediaInfosRelDTO> mediaInfos)
		{
			List<MediaInfosRelVm> vm = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelVm>>(mediaInfos);

			return vm;
		}
	}
}