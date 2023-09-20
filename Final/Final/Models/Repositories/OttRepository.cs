using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.Repositories
{
	public class OttRepository
	{
		// 取得所有OttType資料
		public List<OttType> GetAllOttTypes()
		{
			using (var db = new AppDbContext())
			{
				var ottTypes = db.OttTypes.ToList();

				return ottTypes;
			}
		}

		// 取得指定的OttType Id資料
		public OttType GetOttType(int id)
		{
			using (var db = new AppDbContext())
			{
				var ottType = db.OttTypes.Find(id);

				return ottType;
			}
		}

		// 修改指定的OttType Id資料
		public void UpdateOttType(OttType ottType)
		{
			using (var db = new AppDbContext())
			{
				var ottTypeToUpdate = db.OttTypes.Find(ottType.Id);

				ottTypeToUpdate.Name = ottType.Name;

				db.SaveChanges();
			}
		}

		// 新增OttType資料
		public void InsertOttType(OttType ottType)
		{
			using (var db = new AppDbContext())
			{
				db.OttTypes.Add(ottType);

				db.SaveChanges();
			}
		}

		// 刪除OttType資料
		public void DeleteOttType(int id)
		{
			using (var db = new AppDbContext())
			{
				var ottTypeToDelete = db.OttTypes.Find(id);

				db.OttTypes.Remove(ottTypeToDelete);

				db.SaveChanges();
			}
		}
	}
}