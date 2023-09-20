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
					.Include(m => m.Category)
					.Include(m => m.MediaInfos_Genres_Rel)
					.Include(m => m.MediaInfos_OttTypes_Rel)
					.ToList();

				return mediaInfos;
			}

		}

		// Dapper 取指定的MediaInfo資料

		public List<MediaInfo> GetMediaInfo(int id)
		{
			using (var db = new AppDbContext())
			{
				//db.Database.Connection.Open();

				//string query = "SELECT * FROM MediaInfos WHERE Id = @Id";
				//var mediaInfo = db.Database.Connection.QueryFirstOrDefault<MediaInfo>(query, new { Id = id });

				var mediaInfo = db.MediaInfos
					.Where(m => m.Id == id)
					.Include(m => m.Category)
					.Include(m => m.MediaInfos_Genres_Rel)
					.Include(m => m.MediaInfos_OttTypes_Rel)
					.ToList();

				return mediaInfo;
			}
		}

		// 測試

		public List<Movie> GetMediaInfoData()
		{
			using (var db = new AppDbContext())
			{
				string sql = @"
SELECT 
m.*, 
c.Name AS CategoryName, 
g.Id AS GenreId,g.Name AS GenreName,  
ot.Id AS OttId,ot.Name AS OttName,  motr.Release_Date, motr.Removal_Date
FROM MediaInfos AS m
LEFT JOIN Categories AS c ON m.CategoryId = c.Id
LEFT JOIN MediaInfos_Genres_Rel AS mgr ON m.Id = mgr.MediaInfoId
LEFT JOIN MediaInfos_OttTypes_Rel AS motr ON m.Id = motr.MediaInfoId
LEFT JOIN Genres AS g ON mgr.GenreId = g.Id
LEFT JOIN OttTypes AS ot ON motr.OttTypeId = ot.Id";

				//建立字典
				var lookup = new Dictionary<int, Movie>();
				var movies = db.Database.Connection.Query<Movie, Entities.Genre, Ott, Movie>(sql, (movie, genre, ott) =>
				{
					movie.Genre = new List<Entities.Genre> { genre };
					movie.Ott = new List<Ott> { ott };
					// 如果字典中沒有這個movie的話，就加入字典
					if (!lookup.ContainsKey(movie.Id))
					{
						lookup.Add(movie.Id, movie);
					}
					// 如果字典裡面Genre的Id不等於現在的Id的話，就加入字典
					if (lookup[movie.Id].Genre.FirstOrDefault(g => g.GenreId == genre.GenreId) == null)
					{
						lookup[movie.Id].Genre.Add(genre);
					}
					// 如果字典裡面Ott的Id不等於現在的Id的話，就加入字典
					if (lookup[movie.Id].Ott.FirstOrDefault(o => o.OttId == ott.OttId) == null)
					{
						lookup[movie.Id].Ott.Add(ott);
					}

					return movie;
					//return movie;
				}, splitOn: "GenreId,OttId")
				//.GroupBy(m => m.Id)
				//.Select(group =>
				//{
				//	var movie = group.First();
				//	movie.Genre = group.Select(m => m.Genre.Single()).ToList();
				//	movie.Ott = group.Select(m => m.Ott.Single()).ToList();
				//	return movie;
				//})
				.ToList();

				// 取出字典裡面的值
				movies = lookup.Values.ToList();

				return movies;
			}
			
		}

		// 取得分頁的MediaInfo資料 並包含Category、Genres、OttTypes
		public List<MediaInfo> GetMediaInfoPage(int page, int pageSize)
		{
			using (var db = new AppDbContext())
			{
				var getCategory = db.MediaInfos
					.Include(m => m.Category).ToList();

				var mediaInfos = db.MediaInfos
					.AsNoTracking()
					//.Include(m => m.Category)
					.Include(m => m.MediaInfos_Genres_Rel)
					.Include(m => m.MediaInfos_OttTypes_Rel)
					.OrderBy(m => m.Id)
					.Skip((page - 1) * pageSize)
					.Take(pageSize)
					.ToList();

				mediaInfos.ForEach( info=> info.MediaInfos_Genres_Rel.Select(g => new GenresDTO
				{
					Id = g.GenreId,
					Name = g.Genre.Name
				}).ToList()
				);

				mediaInfos.ForEach(info => info.MediaInfos_OttTypes_Rel.Select(g => new OttTypesDTO
				{
					Id = g.OttTypeId,
					Name = g.OttType.Name,
					ReleaseDate = g.Release_Date,
					RemovalDate = g.Removal_Date
				}).ToList()
);
				foreach (var mediaInfo in mediaInfos)
				{
					// 單獨查詢並載入 Category 對象
					var category = db.Categories.FirstOrDefault(c => c.Id == mediaInfo.CategoryId);

					if (category != null)
					{
						mediaInfo.Category = category;
					}
				}
				//var dtos = new List<MediaInfosRelPageDTO>();

				//for (var i = 0; i < mediaInfos.Count; i++)
				//{
				//	var dto = new MediaInfosRelPageDTO();

				//	dto.Id = mediaInfos[i].Id;
				//	dto.CategoryId = mediaInfos[i].CategoryId;
				//	dto.Title = mediaInfos[i].Title;
				//	dto.OverView = mediaInfos[i].OverView;
				//	dto.Adult = (bool)mediaInfos[i].Adult;
				//	dto.Popularity = (double)mediaInfos[i].Popularity;
				//	dto.OriginalLanguage = mediaInfos[i].OriginalLanguage;
				//	dto.OriginalTitle = mediaInfos[i].OriginalTitle;
				//	dto.Video = (bool)mediaInfos[i].Video;
				//	dto.BackdropPath = mediaInfos[i].BackdropPath;
				//	dto.PosterPath = mediaInfos[i].PosterPath;
				//	dto.Genre = mediaInfos[i].MediaInfos_Genres_Rel.Select(g => new GenresDTO
				//	{
				//		Id = g.GenreId,
				//		Name = g.Genre.Name
				//	}).ToList();
				//	dto.OttType = mediaInfos[i].MediaInfos_OttTypes_Rel.Select(o => new OttTypesDTO
				//	{
				//		Id = o.OttTypeId,
				//		Name = o.OttType.Name,
				//		ReleaseDate = o.Release_Date,
				//		RemovalDate = o.Removal_Date,
				//	}).ToList();

				//	dtos.Add(dto);
				//};

				return mediaInfos;
			}
		}
			
	}
}