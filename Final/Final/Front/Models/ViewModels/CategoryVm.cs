using Final.Models.DTOs;
using Project2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
	public class CategoryVm
	{
		public int Id { get; set; }
		public string Name { get; set; }
	}

	public static class CategoryVmExts
	{
		public static List<CategoryVm> Convert2VM(this List<CategoryDTO> categories)
		{
			List<CategoryVm> vm = AutoMapperHelper.MapperObj.Map<List<CategoryVm>>(categories);

			return vm;
		}

		public static CategoryVm Convert2VM(this CategoryDTO categories)
		{
			CategoryVm vm = AutoMapperHelper.MapperObj.Map<CategoryVm>(categories);
			return vm;
		}
	}
}