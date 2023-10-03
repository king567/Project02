using Final.Models.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
	public class GenresVm
	{
		public int Id { get; set; }

		[Required]
		[StringLength(150)]
		public string Name { get; set; }
	}

	public static class GenresVmExts
	{
		public static List<GenresVm> Convert2VM(this List<GenresDTO> genres)
		{
			List<GenresVm> vm = AutoMapperHelper.MapperObj.Map<List<GenresVm>>(genres);

			return vm;
		}

		public static GenresVm Convert2VM(this GenresDTO genres)
		{
			GenresVm vm = AutoMapperHelper.MapperObj.Map<GenresVm>(genres);
			return vm;
		}
	}
}