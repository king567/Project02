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

		// 刪除 MediaInfos_OttTypes_Rel 資料
		public bool DeleteMediaInfos_OttTypes_Rel(int id)
		{
			using (var db = new AppDbContext())
			{
				var relToDelete = db.MediaInfos_OttTypes_Rel.Where(x => x.MediaInfoId == id).ToList();

				if (relToDelete.Count > 0)
				{
					db.MediaInfos_OttTypes_Rel.RemoveRange(relToDelete);
					int rowsAffected = db.SaveChanges();

					if (rowsAffected == relToDelete.Count)
					{
						// 成功删除所有相关数据
						return true;
					}
					else
					{
						// 删除部分或全部相关数据失败
						return false;
					}
				}
				else
				{
					// 没有找到相关数据，无需删除
					return true;
				}

			}
		}

		// 根據ottType Id取得MediaInfo資料
		public List<MediaInfo> GetMediaInfoByOttTypeId(int id)
		{
			using (var db = new AppDbContext())
			{
				var mediaInfos = db.MediaInfos
					.Where(m => m.MediaInfos_OttTypes_Rel.Any(x => x.OttTypeId == id))
					.ToList();

				return mediaInfos;
			}
		}

		// 根據時間範圍取得OttType資料
		// 這裡的時間範圍是指 MediaInfos_OttTypes_Rel 的 Release_Date
		public List<OttType> GetOttTypesByDateRange(DateTime startDate, DateTime endDate)
		{
			using (var db = new AppDbContext())
			{
				var ottTypes = db.OttTypes
					.Where(o => o.MediaInfos_OttTypes_Rel.Any(x => x.Release_Date >= startDate && x.Release_Date <= endDate))
					.ToList();

				return ottTypes;
			}
		}

		// 搜尋時間範圍近五天內的OttType資料
		public List<OttType> GetOttTypesWithinLastFiveDays()
		{
			var startDate = DateTime.Now.AddDays(-5);
			var endDate = DateTime.Now;

			return GetOttTypesByDateRange(startDate, endDate);
		}

		// 搜尋時間範圍近一個月內的OttType資料
		public List<OttType> GetOttTypesWithinLastOneMonth()
		{
			var startDate = DateTime.Now.AddMonths(-1);
			var endDate = DateTime.Now;

			return GetOttTypesByDateRange(startDate, endDate);
		}
	}
}