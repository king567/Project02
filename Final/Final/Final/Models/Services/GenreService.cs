using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.Services
{
	public class GenreService
	{
		// 取得 Genres 所有資料
		public List<GenresDTO> GetAllGenres()
		{
			var entities = new GenreRepository().GetAllGenres();

			// Entity 轉成 DTO autoMapper

			List<GenresDTO> dtos = AutoMapperHelper.MapperObj.Map<List<GenresDTO>>(entities);

			return dtos;
		}
		// 搜尋 Genres Name
		public List<GenresDTO> SearchGenres(CriteriaGenresDTO criteria)
		{
			var entities = new GenreRepository().Search(criteria);

			// Entity 轉成 DTO autoMapper

			List<GenresDTO> dtos = AutoMapperHelper.MapperObj.Map<List<GenresDTO>>(entities);

			return dtos;
		}

		// 刪除 Genre
		public bool DeleteGenre(int id)
		{
			bool isDelete = new GenreRepository().DeleteGenre(id);
			return isDelete;
		}
	}
}