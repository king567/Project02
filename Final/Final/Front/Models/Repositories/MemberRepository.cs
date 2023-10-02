using Project2.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.Repositories
{
	public class MemberRepository
	{
		// 根據帳號取得 Member 資料
		public Member GetMemberByAccount(string account)
		{
			using (var db = new AppDbContext())
			{
				var member = db.Members.Where(m => m.Account == account).FirstOrDefault();

				return member;
			}
		}
	}
}