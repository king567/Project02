using Final.Models.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
	public class OttTypesVm
	{
		public int Id { get; set; }

		[Required]
		[StringLength(150)]
		public string Name { get; set; }
	}

	public static class OttTypesVmExts
	{
		public static List<OttTypesVm> Convert2VM(this List<OttTypesDTO> ottTypes)
		{
			List<OttTypesVm> vm = AutoMapperHelper.MapperObj.Map<List<OttTypesVm>>(ottTypes);

			return vm;
		}

		public static OttTypesVm Convert2VM(this OttTypesDTO ottTypes)
		{
			OttTypesVm vm = AutoMapperHelper.MapperObj.Map<OttTypesVm>(ottTypes);
			return vm;
		}
	}
}