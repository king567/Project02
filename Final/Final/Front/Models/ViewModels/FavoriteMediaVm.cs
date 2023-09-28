using Project2;
using Project2.Models.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
	public class FavoriteMediaVm
	{
		public int MediaInfoId { get; set; }
		public int MemberId { get; set; }
	}

	public static class FavoriteMediaVmExts 
	{
		public static List<FavoriteMediaVm> Convert2VM(this List<FavoriteMediaDTO> favoriteMedias)
		{
			List<FavoriteMediaVm> vm = AutoMapperHelper.MapperObj.Map<List<FavoriteMediaVm>>(favoriteMedias);

			return vm;
		}

		public static FavoriteMediaVm Convert2VM(this FavoriteMediaDTO favoriteMedias)
		{
			FavoriteMediaVm vm = AutoMapperHelper.MapperObj.Map<FavoriteMediaVm>(favoriteMedias);
			return vm;
		}
	}
}