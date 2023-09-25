using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.Repositories
{
	public class LanguageCodeRepository
	{
		public List<LanguageCode> GetAllLanguageCodes()
		{
			using (var db = new AppDbContext())
			{
				return db.LanguageCodes.ToList();
			}
		}
	}
}