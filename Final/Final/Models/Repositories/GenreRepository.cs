using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.Repositories
{
	public class GenreRepository
	{
		/// <summary>
		/// 取得所有Genre資料
		/// </summary>
		/// <returns></returns>
		public List<Genre> GetAllGenres()
		{
			using (var db = new AppDbContext())
			{
				var genres = db.Genres.ToList();

				return genres;
			}
		}

		/// <summary>
		/// 取得指定的Genre Id資料
		/// </summary>
		/// <param name="id">Genre Id</param>
		/// <returns></returns>
		public Genre GetGenre(int id)
		{
			using (var db = new AppDbContext())
			{
				var genre = db.Genres.Find(id);

				return genre;
			}
		}

		/// <summary>
		/// 修改指定的Genre Id資料
		/// </summary>
		/// <param name="genre">Genre Entity</param>
		public void UpdateGenre(Genre genre)
		{
			using (var db = new AppDbContext())
			{
				var genreToUpdate = db.Genres.Find(genre.Id);

				genreToUpdate.Name = genre.Name;

				db.SaveChanges();
			}
		}

		/// <summary>
		/// 刪除指定的Genre Id資料
		/// </summary>
		/// <param name="id">Genre Id</param>
		public void DeleteGenre(int id)
		{
			using (var db = new AppDbContext())
			{
				var genreToDelete = db.Genres.Find(id);

				db.Genres.Remove(genreToDelete);

				db.SaveChanges();
			}
		}
	}
}