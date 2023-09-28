using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.ViewModels
{
	public class HomesVm
	{
		public List<MediaInfosRelVm> GetNextOneMonthRelease { get; set; }
		public List<MediaInfosRelVm> GetLastOneMonthMediaInfo { get; set; }
		public List<MediaInfosRelVm> GetNextOneMonthORemoval { get; set; }
	}
}