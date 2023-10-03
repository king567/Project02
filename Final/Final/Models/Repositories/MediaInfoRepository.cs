using Dapper;
using Final.Models.EFModels;
using Final.Models.Entities;
using System.Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Final.Models.DTOs;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using System.Data.Odbc;
using System.Diagnostics;
using System.Web.Http;

namespace Final.Models.Repositories
{
	public class MediaInfoRepository
	{

		// 取得全部的MediaInfo資料 並包含Category、Genres、OttTypes
		public List<MediaInfo> GetAllMediaInfosRel()
		{
			using (var db = new AppDbContext())
			{
				/*
				// use dapper 測試成功
				//var query = @"
				//SELECT m.*, c.*, mgr.*, motr.*, g.*, ot.*
				//FROM MediaInfos AS m
				//LEFT JOIN Categories AS c ON m.CategoryId = c.Id
				//LEFT JOIN MediaInfos_Genres_Rel AS mgr ON m.Id = mgr.MediaInfoId
				//LEFT JOIN MediaInfos_OttTypes_Rel AS motr ON m.Id = motr.MediaInfoId
				//LEFT JOIN Genres AS g ON mgr.GenreId = g.Id
				//LEFT JOIN OttTypes AS ot ON motr.OttTypeId = ot.Id";

				//// 首先，查询 MediaInfos 表
				//var mediaInfos = db.Database.Connection.Query<MediaInfo>("SELECT * FROM MediaInfos").ToList();

				//// 查询 Categories 表，用于关联 Category
				//var categories = db.Database.Connection.Query<Category>("SELECT * FROM Categories").ToDictionary(c => c.Id);

				//// 查询 MediaInfos_Genres_Rel 表，用于关联 Genres
				//var mediaInfosGenresRel = db.Database.Connection.Query<MediaInfos_Genres_Rel>("SELECT * FROM MediaInfos_Genres_Rel").ToLookup(r => r.MediaInfoId);

				//// 查询 MediaInfos_OttTypes_Rel 表，用于关联 OttTypes
				//var mediaInfosOttTypesRel = db.Database.Connection.Query<MediaInfos_OttTypes_Rel>("SELECT * FROM MediaInfos_OttTypes_Rel").ToLookup(r => r.MediaInfoId);

				//// 现在，将结果映射到实体类中
				//foreach (var mediaInfo in mediaInfos)
				//{
				//	//mediaInfo.CategoryId= categories.GetValueOrDefault(mediaInfo.CategoryId);
				//	mediaInfo.MediaInfos_Genres_Rel = mediaInfosGenresRel[mediaInfo.Id].ToList();
				//	mediaInfo.MediaInfos_OttTypes_Rel = mediaInfosOttTypesRel[mediaInfo.Id].ToList();
				//}

				// 现在，mediaInfos 包含了关联的 Category、Genres 和 OttTypes
				*/
				var mediaInfos = db.MediaInfos
					.AsNoTracking()
					.Include(m => m.Category)
					.Include(m => m.LanguageCode)
					.Include(m => m.MediaInfos_Genres_Rel)
					.Include(m => m.MediaInfos_Genres_Rel.Select(x => x.Genre))
					.Include(m => m.MediaInfos_OttTypes_Rel)
					.Include(m => m.MediaInfos_OttTypes_Rel.Select(x => x.OttType))
					.ToList();

				return mediaInfos;
			}

		}

		// 取指定的MediaInfo Id 資料

		public List<MediaInfo> GetMediaInfo(int id)
		{
			using (var db = new AppDbContext())
			{
				//db.Database.Connection.Open();
				//string query = "SELECT * FROM MediaInfos WHERE Id = @Id";
				//var mediaInfo = db.Database.Connection.QueryFirstOrDefault<MediaInfo>(query, new { Id = id });

				var mediaInfos = db.MediaInfos
					.AsNoTracking()
					.Where(m => m.Id == id)
					.Include(m => m.Category)
					.Include(m => m.LanguageCode)
					.Include(m => m.MediaInfos_Genres_Rel)
					.Include(m => m.MediaInfos_Genres_Rel.Select(x => x.Genre))
					.Include(m => m.MediaInfos_OttTypes_Rel)
					.Include(m => m.MediaInfos_OttTypes_Rel.Select(x => x.OttType))
					.ToList();

				return mediaInfos;
			}
		}

		// 取得分頁的 MediaInfo 資料 並包含Category、Genres、OttTypes
		public List<MediaInfo> GetMediaInfoPage(int page, int pageSize)
		{
			using (var db = new AppDbContext())
			{
				var mediaInfos = db.MediaInfos
					.AsNoTracking()
					.Include(m => m.Category)
					.Include(m => m.LanguageCode)
					.Include(m => m.MediaInfos_Genres_Rel)
					.Include(m => m.MediaInfos_Genres_Rel.Select(x => x.Genre))
					.Include(m => m.MediaInfos_OttTypes_Rel)
					.Include(m => m.MediaInfos_OttTypes_Rel.Select(x => x.OttType))
					.OrderBy(m => m.Id)
					.Skip((page - 1) * pageSize)
					.Take(pageSize)
					.ToList();

				return mediaInfos;
			}
		}

		// 進階查詢
		public List<MediaInfo> Search(CriteriaDTO criteria)
		{
			using (var db = new AppDbContext())
			{
				var query = db.MediaInfos
					.AsNoTracking()
					.Include(m => m.Category)
					.Include(m => m.LanguageCode)
					.Include(m => m.MediaInfos_Genres_Rel)
					.Include(m => m.MediaInfos_Genres_Rel.Select(x => x.Genre))
					.Include(m => m.MediaInfos_OttTypes_Rel)
					.Include(m => m.MediaInfos_OttTypes_Rel.Select(x => x.OttType));

				// 如果為 Null 的話，就不查詢
				if (criteria.Title != string.Empty && criteria.Title != null)
				{
					query = query.Where(p => p.Title.Contains(criteria.Title));
				}
				// 如果為 Null 的話，就不查詢
				if (criteria.CategoryId.HasValue)
				{
					query = query.Where(c => c.Category.Id == criteria.CategoryId);
				}
                // 如果為 Null 的話，就不查詢
                if (criteria.Genres != null)
                {
					if (criteria.Genres.Count != 0)
					{
						query = query.Where(m => m.MediaInfos_Genres_Rel.Any(rel => criteria.Genres.Contains(rel.Genre.Id)));
					}
                }
				// 如果為 Null 的話，就不查詢
				if(criteria.Otts != null)
				{
					if (criteria.Otts.Count != 0)
					{
						query = query.Where(o => o.MediaInfos_OttTypes_Rel.Any(rel => criteria.Otts.Contains(rel.OttType.Id)));
					}
				}
				// 查詢上映時間 範圍內的時間
				if (criteria.BeginTime.HasValue && criteria.EndTine.HasValue)
				{
					query = query.Where(m => m.MediaInfos_OttTypes_Rel.Any(x => x.Release_Date >= criteria.BeginTime && x.Release_Date <= criteria.EndTine));
				}
				// 查詢起始時間 範圍的資料
				else if (criteria.BeginTime.HasValue)
				{
					query = query.Where(m => m.MediaInfos_OttTypes_Rel.Any(x => x.Release_Date >= criteria.BeginTime));
				}
				// 查詢結束時間 範圍的資料
				else if (criteria.EndTine.HasValue)
				{
					query = query.Where(m => m.MediaInfos_OttTypes_Rel.Any(x => x.Release_Date <= criteria.EndTine));
				}


				var mediaInfos = query.ToList();

				return mediaInfos;
			}

		}

		// 根據 CategoryId 取得 MediaInfo 資料

		public List<MediaInfo> GetMediaInfoByCategoryId(int categoryId)
		{
			using (var db = new AppDbContext())
			{
				var mediaInfos = db.MediaInfos
					.AsNoTracking()
					.Where(m => m.CategoryId == categoryId)
					.Include(m => m.Category)
					.Include(m => m.MediaInfos_Genres_Rel)
					.Include(m => m.MediaInfos_Genres_Rel.Select(x => x.Genre))
					.Include(m => m.MediaInfos_OttTypes_Rel)
					.Include(m => m.MediaInfos_OttTypes_Rel.Select(x => x.OttType))
					.ToList();

				return mediaInfos;
			}
		}

		// 根據 CategoryId 和 GenreId 取得 MediaInfo 資料

		public List<MediaInfo> GetMediaInfoByCategoryIdAndGenreId(int categoryId, int genreId)
		{
			// 用 Search 方法 進行查詢 categoryId 和 genreId
			// var criteria = new CriteriaDTO();
			// criteria.CategoryId = categoryId;
			// criteria.Genres.Add(genreId);
			// var mediaInfos = Search(criteria);


			using (var db = new AppDbContext())
			{
				var mediaInfos = db.MediaInfos
					.AsNoTracking()
					.Where(m => m.CategoryId == categoryId)
					.Where(m => m.MediaInfos_Genres_Rel.Any(rel => rel.GenreId == genreId))
					.Include(m => m.Category)
					.Include(m => m.MediaInfos_Genres_Rel)
					.Include(m => m.MediaInfos_Genres_Rel.Select(x => x.Genre))
					.Include(m => m.MediaInfos_OttTypes_Rel)
					.Include(m => m.MediaInfos_OttTypes_Rel.Select(x => x.OttType))
					.ToList();

				return mediaInfos;
			}
		}

		// 根據 Id 刪除 MediaInfo
		public bool DeleteMediaInfo(int id)
		{
			using (var db = new AppDbContext())
			{
				var mediaInfo = db.MediaInfos.Find(id);
				if(mediaInfo == null)
				{
					return false;
				}
				db.MediaInfos.Remove(mediaInfo);
				db.SaveChanges();
				return true;
			}
		}

		// 新增 MediaInfo
		public void CreateMediaInfo(MediaInfo mediaInfo)
		{
			using (var db = new AppDbContext())
			{
				db.MediaInfos.Add(mediaInfo);
				db.SaveChanges();
			}
		}

		// 更新 MediaInfo

		public void UpdateMediaInfo(MediaInfo mediaInfo)
		{
			using (var db = new AppDbContext())
			{
				db.Entry(mediaInfo).State = EntityState.Modified;
				db.SaveChanges();
			}
		}

		// 取得MediaInfo的總筆數

		public int GetMediaInfoCount()
		{
			using (var db = new AppDbContext())
			{
				var count = db.MediaInfos.Count();
				return count;
			}
		}


		// 根據時間範圍取得MediaInfo資料
		// 這裡的時間範圍是指 MediaInfos_OttTypes_Rel 的 Release_Date
		public List<MediaInfo> GetMediaInfosByDateRange(DateTime startDate, DateTime endDate)
		{
			using (var db = new AppDbContext())
			{
				var mediaInfos = db.MediaInfos
					.AsNoTracking()
					.Where(m => m.MediaInfos_OttTypes_Rel.Any(x => x.Release_Date >= startDate && x.Release_Date <= endDate))
					.Include(m => m.Category)
					.Include(m => m.MediaInfos_Genres_Rel)
					.Include(m => m.MediaInfos_Genres_Rel.Select(x => x.Genre))
					.Include(m => m.MediaInfos_OttTypes_Rel)
					.Include(m => m.MediaInfos_OttTypes_Rel.Select(x => x.OttType))
					.ToList();

				return mediaInfos;
			}
		}

		// 搜尋時間範圍近五天內的MediaInfo資料 (近期上映)
		public List<MediaInfo> GetMediaInfosWithinLastFiveDays()
		{
			var startDate = DateTime.Now.AddDays(-5);
			var endDate = DateTime.Now;

			return GetMediaInfosByDateRange(startDate, endDate);
		}

		// 搜尋時間範圍近一個月內的MediaInfo資料
		public List<MediaInfo> GetMediaInfosWithinLastOneMonth()
		{
			var startDate = DateTime.Now.AddMonths(-1);
			var endDate = DateTime.Now;

			return GetMediaInfosByDateRange(startDate, endDate);
		}

		// 搜尋未來一個月內的MediaInfo資料 (即將上映) (測試成功)
		public List<MediaInfo> GetMediaInfosWithinNextOneMonth()
		{
			var startDate = DateTime.Now;
			var endDate = DateTime.Now.AddMonths(1);

			return GetMediaInfosByDateRange(startDate, endDate);
		}

		// 修改 MediaInfo 的 Release_Date 和 Removal_Date
		public void UpdateMediaInfoDate(int id, DateTime releaseDate, DateTime? removalDate)
		{
			using (var db = new AppDbContext())
			{
				var mediaInfo = db.MediaInfos.Find(id);
				mediaInfo.MediaInfos_OttTypes_Rel.FirstOrDefault().Release_Date = releaseDate;
				mediaInfo.MediaInfos_OttTypes_Rel.FirstOrDefault().Removal_Date = removalDate;
				db.SaveChanges();
			}
		}

		// 如果 MediaInfo 的 Genre 有變動，就更新 MediaInfo 的 Genre (測試成功)
		public void UpdateMediaInfoGenreIfChanged(int id, List<int> genres)
		{
			using (var db = new AppDbContext())
			{
				var mediaInfo = db.MediaInfos.Find(id);
				var mediaInfoGenres = mediaInfo.MediaInfos_Genres_Rel.Select(x => x.GenreId).ToList();
				// 如果 MediaInfo 的 Genre 有變動，就更新 MediaInfo 的 Genre
				if (!mediaInfoGenres.SequenceEqual(genres))
				{
					// 先根據 MediaInfo Id 刪除對應 MediaInfos_Genres_Rel 資料

					var mediaInfosGenresRelToDelete = db.MediaInfos_Genres_Rel.Where(e => e.MediaInfoId == id).ToList();

					db.MediaInfos_Genres_Rel.RemoveRange(mediaInfosGenresRelToDelete);

					// 檢查 genres 是否為空，如果為空的話，就不新增 直接回傳
					if (genres.Count == 0)
					{
						db.SaveChanges();
						return;
					}

					// 再新增 MediaInfos_Genres_Rel 資料
					mediaInfo.MediaInfos_Genres_Rel = new List<MediaInfos_Genres_Rel>();

					foreach (var genre in genres)
					{
						mediaInfo.MediaInfos_Genres_Rel.Add(new MediaInfos_Genres_Rel()
						{
							MediaInfoId = id,
							GenreId = genre
						});
					}

					db.SaveChanges();
				}
			}
		}

		// 如果 MediaInfo 的 Ott 有變動，就更新 MediaInfo 的 Ott (待測試)
		public void UpdateMediaInfoOttIfChanged(int id, List<int> otts)
		{
			using (var db = new AppDbContext())
			{
				var mediaInfo = db.MediaInfos.Find(id);
				var mediaInfoOtts = mediaInfo.MediaInfos_OttTypes_Rel.Select(x => x.OttTypeId).ToList();
				// 如果 MediaInfo 的 Ott 有變動，就更新 MediaInfo 的 Ott
				if (!mediaInfoOtts.SequenceEqual(otts))
				{
					// 先根據 MediaInfo Id 刪除對應 MediaInfos_OttTypes_Rel 資料

					var mediaInfosOttTypesRelToDelete = db.MediaInfos_OttTypes_Rel.Where(e => e.MediaInfoId == id).ToList();

					db.MediaInfos_OttTypes_Rel.RemoveRange(mediaInfosOttTypesRelToDelete);

					// 檢查 otts 是否為空，如果為空的話，就不新增 直接回傳
					if (otts.Count == 0)
					{
						db.SaveChanges();
						return;
					}

					// 再新增 MediaInfos_OttTypes_Rel 資料
					mediaInfo.MediaInfos_OttTypes_Rel = new List<MediaInfos_OttTypes_Rel>();

					foreach (var ott in otts)
					{
						mediaInfo.MediaInfos_OttTypes_Rel.Add(new MediaInfos_OttTypes_Rel()
						{
							MediaInfoId = id,
							OttTypeId = ott
						});
					}

					db.SaveChanges();
				}
			}
		}

		// 更新 MediaInfo 的 Category (待測試)
		public void UpdateMediaInfoCategory(int id, int categoryId)
		{
			using (var db = new AppDbContext())
			{
				var mediaInfo = db.MediaInfos.Find(id);
				mediaInfo.CategoryId = categoryId;
				db.SaveChanges();
			}
		}
		// 刪除指定 MediaInfo 的 Id
		public bool DeleteMediaInfoById(int id)
		{
			var GenreRepository = new GenreRepository();

			bool GenresisDeleted = GenreRepository.DeleteMediaInfosGenresRelByMediaInfoId(id);

			using (var db = new AppDbContext())
			{
				var mediaInfo = db.MediaInfos.Find(id);
				if (mediaInfo != null)
				{
					db.MediaInfos.Remove(mediaInfo);
					int rowsAffected = db.SaveChanges();

					if (rowsAffected == 1)
					{
						// 删除成功
						return true;
					}
					else
					{
						// 删除失败
						return false;
					}
				}
				else
				{
					// 没有找到指定的 MediaInfo，不需要删除
					return false;
				}
			}
		}

		public List<MediaInfo> Test()
		{
			using(var db = new AppDbContext())
			{
				var mediaInfos = db.MediaInfos
					.ToList();

				return mediaInfos;
			}
		}

		// 以下為測試
		// 測試

		//		public List<Movie> GetMediaInfoData()
		//		{
		//			using (var db = new AppDbContext())
		//			{
		//				string sql = @"
		//SELECT 
		//m.*, 
		//c.Name AS CategoryName, 
		//g.Id AS GenreId,g.Name AS GenreName,  
		//ot.Id AS OttId,ot.Name AS OttName,  motr.Release_Date, motr.Removal_Date
		//FROM MediaInfos AS m
		//LEFT JOIN Categories AS c ON m.CategoryId = c.Id
		//LEFT JOIN MediaInfos_Genres_Rel AS mgr ON m.Id = mgr.MediaInfoId
		//LEFT JOIN MediaInfos_OttTypes_Rel AS motr ON m.Id = motr.MediaInfoId
		//LEFT JOIN Genres AS g ON mgr.GenreId = g.Id
		//LEFT JOIN OttTypes AS ot ON motr.OttTypeId = ot.Id";

		//				//建立字典
		//				var lookup = new Dictionary<int, Movie>();
		//				var movies = db.Database.Connection.Query<Movie, Entities.Genre, Ott, Movie>(sql, (movie, genre, ott) =>
		//				{
		//					movie.Genre = new List<Entities.Genre> { genre };
		//					movie.Ott = new List<Ott> { ott };
		//					// 如果字典中沒有這個movie的話，就加入字典
		//					if (!lookup.ContainsKey(movie.Id))
		//					{
		//						lookup.Add(movie.Id, movie);
		//					}
		//					// 如果字典裡面Genre的Id不等於現在的Id的話，就加入字典
		//					if (lookup[movie.Id].Genre.FirstOrDefault(g => g.GenreId == genre.GenreId) == null)
		//					{
		//						lookup[movie.Id].Genre.Add(genre);
		//					}
		//					// 如果字典裡面Ott的Id不等於現在的Id的話，就加入字典
		//					if (lookup[movie.Id].Ott.FirstOrDefault(o => o.OttId == ott.OttId) == null)
		//					{
		//						lookup[movie.Id].Ott.Add(ott);
		//					}

		//					return movie;
		//					//return movie;
		//				}, splitOn: "GenreId,OttId")
		//				//.GroupBy(m => m.Id)
		//				//.Select(group =>
		//				//{
		//				//	var movie = group.First();
		//				//	movie.Genre = group.Select(m => m.Genre.Single()).ToList();
		//				//	movie.Ott = group.Select(m => m.Ott.Single()).ToList();
		//				//	return movie;
		//				//})
		//				.ToList();

		//				// 取出字典裡面的值
		//				movies = lookup.Values.ToList();

		//				return movies;
		//			}

		//		}

	}
}