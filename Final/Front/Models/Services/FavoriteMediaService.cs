using Final.Models.ViewModels;
using Project2.Models.DTOs;
using Project2.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.Services
{
	public class FavoriteMediaService
	{
		// 新增一筆 FavoriteMedia 資料
		public bool AddFavoriteMedia(FavoriteMediaDTO dto)
		{
			bool result = new FavoriteMediaRepository().AddFavoriteMedia(dto);

			if (result)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		// 刪除一筆 FavoriteMedia 資料
		public bool DeleteFavoriteMedia(FavoriteMediaDTO dto)
		{
			bool result = new FavoriteMediaRepository().DeleteFavoriteMedia(dto);

			if (result)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		// 取得 FavoriteMedia 資料
		public List<FavoriteMediaVm> GetFavoriteMedia(int memberId)
		{
			var entiies = new FavoriteMediaRepository().GetFavoriteMedia(memberId);

			// 轉換成 DTO
			var vms = AutoMapperHelper.MapperObj.Map<List<FavoriteMediaDTO>>(entiies).Convert2VM();

			return vms;
		}

		// 檢查是否已經有收藏
		public bool CheckFavoriteMedia(FavoriteMediaDTO dto)
		{
			bool result = new FavoriteMediaRepository().CheckFavoriteMedia(dto);

			if (result)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}