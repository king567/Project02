using Final.Models.DTOs;
using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using System.Data;
using System.Xml.Linq;

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
				var categoriesDapper = db.Database.Connection.Query<Category>("GetAllCategories", commandType: CommandType.StoredProcedure).ToList();

				return categoriesDapper;
			}
		}

		/// <summary>
		/// 搜尋 Category Name
		/// </summary>
		/// <param name="criteria"></param>
		/// <returns></returns>
		public List<Category> Search(CriteriaCategoriesDTO criteria)
		{
			using (var db = new AppDbContext())
			{
				var parameters = new DynamicParameters();
				parameters.Add("@Name", criteria?.Name, DbType.String, ParameterDirection.Input);

				var categoriesDapper = db.Database.Connection.Query<Category>("SearchCategories", parameters, commandType: CommandType.StoredProcedure).ToList();

				return categoriesDapper;
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
				var parameters = new DynamicParameters();
				parameters.Add("@Id", id, DbType.Int32, ParameterDirection.Input);
				var categoryDapper = db.Database.Connection.QueryFirstOrDefault<Category>(
				"GetCategoryById",
				parameters,
				commandType: CommandType.StoredProcedure);

				         return categoryDapper;
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
				string storedProcedureName = "UpdateCategory";

				int effectRow = db.Database.Connection
					.Execute(storedProcedureName,
					new { Id = category.Id, Name = category.Name },
					commandType: CommandType.StoredProcedure);
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
				var parameters = new DynamicParameters();
				parameters.Add("@Name", category.Name, DbType.String, ParameterDirection.Input);

				try
				{
					db.Database.Connection.Execute("CreateCategory", parameters, commandType: CommandType.StoredProcedure);

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
		/// <param name="id">Category Id</param>
		public bool DeleteCategory(int id)
		{
			using (var db = new AppDbContext())
			{
				var parameters = new DynamicParameters();
				parameters.Add("@Id", id, DbType.Int32, ParameterDirection.Input);

				try
				{
					// 調用存儲過程來刪除類別記錄
					db.Database.Connection.Execute("DeleteCategory", parameters, commandType: CommandType.StoredProcedure);

					return true;
				}
				catch
				{
					return false;
				}
			}
		}

	}
}