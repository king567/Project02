using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
				var categories = db.Categories.ToList();

				return categories;
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
				var category = db.Categories.Find(id);

				return category;
			}
		}

		/// <summary>
		/// 修改指定的 Category Id 資料
		/// </summary>
		/// <param name="category">Category Entity</param>
		public void UpdateCategory(Category category)
		{
			using (var db = new AppDbContext())
			{
				var categoryToUpdate = db.Categories.Find(category.Id);

				categoryToUpdate.Name = category.Name;

				db.SaveChanges();
			}
		}

		/// <summary>
		/// 新增Category資料
		/// </summary>
		/// <param name="category">Category Entity</param>
		public void InsertCategory(Category category)
		{
			using (var db = new AppDbContext())
			{
				db.Categories.Add(category);

				db.SaveChanges();
			}
		}
		/// <summary>
		/// 刪除指定Category資料
		/// </summary>
		/// <param name="id"></param>
		public void DeleteCategory(int id)
		{
			using (var db = new AppDbContext())
			{
				var categoryToDelete = db.Categories.Find(id);

				db.Categories.Remove(categoryToDelete);

				db.SaveChanges();
			}
		}
	}
}