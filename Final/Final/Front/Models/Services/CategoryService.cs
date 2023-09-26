using Final.Models.DTOs;
using Project2;
using Project2.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.Services
{
	public class CategoryService
	{
		// 搜尋 Category Name
		public List<CategoryDTO> SearchCategories(CriteriaCategoriesDTO criteria)
		{
			var entities = new CategoryRepository().Search(criteria);

			// Entity 轉成 DTO autoMapper

			List<CategoryDTO> dtos = AutoMapperHelper.MapperObj.Map<List<CategoryDTO>>(entities);

			return dtos;
		}

		// 刪除 Category
		public bool DeleteCategory(int id)
		{
			bool isDelete = new CategoryRepository().DeleteCategory(id);
			return isDelete;
		}
	}
}