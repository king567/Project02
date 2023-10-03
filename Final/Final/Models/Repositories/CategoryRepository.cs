using Final.Models.DTOs;
using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using System.Data;

namespace Final.Models.Repositories
{
	public class CategoryRepository
	{
		/// <summary>
		/// 取得所有Category資料
		/// </summary>
		/// <returns></returns>
		public List<Category> GetAllCategories()
		{
			using (var db = new AppDbContext())
			{
				string query = "SELECT * FROM Categories";
				// 用 Dapper 執行 sql command
				var categoriesDapper = db.Database.Connection.Query<Category>(query).ToList();

				return categoriesDapper;

				//var categories = db.Categories.ToList();

				//return categories;
			}
		}

		// 搜尋 Category Name
		public List<Category> Search(CriteriaCategoriesDTO criteria)
		{
			using (var db = new AppDbContext())
			{
				var categories = db.Categories
					.AsNoTracking();

				if (criteria == null)
				{
					return categories.ToList();
				}

				if (!string.IsNullOrEmpty(criteria.Name))
				{
					var filteredGenres = categories.Where(x => x.Name.Contains(criteria.Name)).ToList();
					return filteredGenres;
				}

				return categories.ToList();
			}
		}

		/// <summary>
		/// 取得指定的 Category Id 資料
		/// </summary>
		/// <param name="id">Category Id</param>
		/// <returns></returns>
		public Category GetCategory(int id)
		{
			using (var db = new AppDbContext())
			{
				string query = "SELECT * FROM Categories WHERE Id = @Id";
				// 用 Dapper 執行 sql command
				var categoryDapper = db.Database.Connection.QueryFirstOrDefault<Category>(query, new { Id = id });

				return categoryDapper;

				//var category = db.Categories.Find(id);

				//return category;
			}
		}

		/// <summary>
		/// 修改指定的 Category Id 資料
		/// </summary>
		/// <param name="category">Category Entity</param>
		public void Update(Category category)
		{
			using (var db = new AppDbContext())
			{
				// 使用 stored procedure 更新資料
				string storedProcedureName = "UpdateCategory";

				int effectRow = db.Database.Connection
					.Execute(storedProcedureName,
					new { Id = category.Id, Name = category.Name },
					commandType: CommandType.StoredProcedure);

				//string query = "UPDATE Categories SET Name = @Name WHERE Id = @Id";

				// 用 Dapper 執行 sql command

				//int effectRow = db.Database.Connection.Execute(query, new { Id = category.Id, Name = category.Name });

				//var categoryToUpdate = db.Categories.Find(category.Id);

				//categoryToUpdate.Name = category.Name;

				//db.SaveChanges();
			}
		}

		/// <summary>
		/// 新增Category資料
		/// </summary>
		/// <param name="category">Category Entity</param>
		public bool Create(Category category)
		{
			using (var db = new AppDbContext())
			{
				try
				{
					db.Categories.Add(category);

					db.SaveChanges();

					return true;
				}
				catch
				{
					return false;
				}
			}
		}
		/// <summary>
		/// 刪除指定Category資料
		/// </summary>
		/// <param name="id"></param>
		public bool DeleteCategory(int id)
		{
			using (var db = new AppDbContext())
			{
				var categoryToDelete = db.Categories.Find(id);

				if (categoryToDelete == null)
				{
					return false;
				}
				else
				{
					db.Categories.Remove(categoryToDelete);

					db.SaveChanges();

					return true;
				}
			}
		}

	}
}