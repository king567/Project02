using Final.Models.DTOs;
using Project2.Models.DTOs;
using Project2.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.Repositories
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
				var category = db.Categories.Find(id);

				return category;
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
				var categoryToUpdate = db.Categories.Find(category.Id);

				categoryToUpdate.Name = category.Name;

				db.SaveChanges();
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