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

namespace Final.Models.Repositories
{
	public class MediaInfoRepository
	{

		// 取得全部的MediaInfo資料 並包含Category、Genres、OttTypes
		public List<MediaInfo> GetAllMediaInfosRel()
		{
			using (var db = new AppDbContext())
			{
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

				var mediaInfos = db.MediaInfos
					.AsNoTracking()
					.Include(m => m.Category)
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
					.Include(m => m.MediaInfos_Genres_Rel)
					.Include(m => m.MediaInfos_Genres_Rel.Select(x => x.Genre))
					.Include(m => m.MediaInfos_OttTypes_Rel)
					.Include(m => m.MediaInfos_OttTypes_Rel.Select(x => x.OttType))
					.ToList();

				return mediaInfos;
			}
		}

		// 取得分頁的MediaInfo資料 並包含Category、Genres、OttTypes
		public List<MediaInfo> GetMediaInfoPage(int page, int pageSize)
		{
			using (var db = new AppDbContext())
			{
				var mediaInfos = db.MediaInfos
					.AsNoTracking()
					.Include(m => m.Category)
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
			//CriteriaDTO criteria
			using (var db = new AppDbContext())
			{
				var query = db.MediaInfos
					.AsNoTracking()
					.Include(m => m.Category)
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
				if (criteria.Genres.Count != 0)
				{
					query = query.Where(m => m.MediaInfos_Genres_Rel.Any(rel => criteria.Genres.Contains(rel.Genre.Id)));
				}
				// 如果為 Null 的話，就不查詢
				if (criteria.Otts.Count != 0)
				{
					query = query.Where(o => o.MediaInfos_OttTypes_Rel.Any(rel => criteria.Otts.Contains(rel.OttType.Id)));
				}

				var mediaInfos = query.ToList();

				return mediaInfos;
			}

		}

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