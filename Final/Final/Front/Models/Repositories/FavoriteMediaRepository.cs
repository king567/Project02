using Project2.Models.DTOs;
using Project2.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.Repositories
{
	public class FavoriteMediaRepository
	{
		// 新增一筆 FavoriteMedia 資料
		public bool AddFavoriteMedia(FavoriteMediaDTO dto)
		{
			using (var db = new AppDbContext())
			{
				// 檢查是否已經有收藏
				var favoriteMediaCheck = db.FavoriteMedias
					.Where(x => x.MemberId == dto.MemberId && x.MediaInformId == dto.MediaInfoId)
					.FirstOrDefault();

				if (favoriteMediaCheck != null)
				{
					return false;
				}
				else
				{
					var favoriteMedia = new FavoriteMedia()
					{
						MemberId = dto.MemberId,
						MediaInformId = dto.MediaInfoId
					};

					db.FavoriteMedias.Add(favoriteMedia);
					db.SaveChanges();
				}
				return true;
			}
		}

		// 刪除一筆 FavoriteMedia 資料
		public bool DeleteFavoriteMedia(FavoriteMediaDTO dto)
		{
			using (var db = new AppDbContext())
			{
				var favoriteMedia = db.FavoriteMedias
					.Where(x => x.MemberId == dto.MemberId && x.MediaInformId == dto.MediaInfoId)
					.FirstOrDefault();

				db.FavoriteMedias.Remove(favoriteMedia);
				db.SaveChanges();
			}

			return true;
		}

		// 取得 FavoriteMedia 資料
		public List<FavoriteMedia> GetFavoriteMedia(int memberId)
		{
			using (var db = new AppDbContext())
			{
				var favoriteMedia = db.FavoriteMedias
					.Where(x => x.MemberId == memberId)
					.ToList();

				return favoriteMedia;
			}
		}
	}
}