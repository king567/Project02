﻿using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
	public class GenresAndOttTypesVm
	{
		public IEnumerable<Genre> Genres { get; set; }
		public IEnumerable<OttType> OttTypes { get; set; }
		public IEnumerable<Category> categories { get; set; }
	}
}