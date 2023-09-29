using Final.Models.DTOs;
using Final.Models.Repositories;
using Project2;
using Project2.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Final.Models.Services
{
	public class MediaInfoService
	{
		// 搜尋 title 關鍵字 的 MediaInfo 資料
		public List<MediaInfosRelDTO> GetMediaInfosByTitlePage(int page, int pageSize, string title)
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetMediaInfosByTitlePage(title,page,pageSize);
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}
		public List<MediaInfosRelDTO> GetAllMediaInfos()
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetAllMediaInfosRel();
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}

		public MediaInfosRelDTO GetMediaInfo(int id)
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetMediaInfo(id);
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);

			return dto.FirstOrDefault();
		}

		public List<MediaInfosRelDTO> GetMediaInfosPage(int page, int pageSize)
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetMediaInfoPage(page, pageSize);
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}

		// 取得即將上架(一個月)的 MediaInfo 資料 並且分類為 categoryId
		public List<MediaInfosRelDTO> GetMediaInfosWithinNextOneMonthPage(int page,int pageSize,int categoryId)
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetMediaInfosWithinNextOneMonthPage(page,pageSize,categoryId);
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}

		// 取得近期一個月內上映的 MediaInfo 資料 並且分類為 categoryId
		public List<MediaInfosRelDTO> GetMediaInfosWithinLastOneMonthPage(int page, int pageSize, int categoryId)
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetMediaInfosWithinLastOneMonthPage(page, pageSize, categoryId);
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}

		// 取得即將下架(一個月)的 MediaInfo 資料 並且分類為 categoryId
		public List<MediaInfosRelDTO> GetRemovalMediaInfosWithinLastOneMonthPage(int page, int pageSize, int categoryId)
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetRemovalMediaInfosWithinLastOneMonthPage(page, pageSize, categoryId);
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}

		// 取得近期上架(一個月)
		public List<MediaInfosRelDTO> GetNextOneMonthRelease()
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetMediaInfosWithinNextOneMonth();
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);

			return dto;
		}

		// 取得近期一個月內的MediaInfo資料
		public List<MediaInfosRelDTO> GetLastOneMonthMediaInfo()
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetMediaInfosWithinLastOneMonth();
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}
		// 取得即將下架(一個月)
		public List<MediaInfosRelDTO> GetNextOneMonthORemoval()
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetRemovalMediaInfos();
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}

		// 取得 MediaInfo 分類 Category 的分頁資料
		public List<MediaInfosRelDTO> GetMediaInfosByCategory(int categoryId, int page, int pageSize)
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetMediaInfoPageByCategory(page, pageSize, categoryId);
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}

		// 取得 MediaInfo 搜尋 Category 底下 Genre 的分頁資料

		public List<MediaInfosRelDTO> GetMediaInfosByCategoryWithGenre(int categoryId, int genreId, int page, int pageSize)
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetMediaInfoPageByCategoryWithGenre(page, pageSize, categoryId, genreId);
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}

		// 取得 MediaInfo 分類 Category 底下的 ottType 分頁資料
		public List<MediaInfosRelDTO> GetMediaInfosByCategoryWithOttType(int categoryId, int ottTypeId, int page, int pageSize)
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetMediaInfosByCategoryAndOttTypePage(page, pageSize, categoryId, ottTypeId);
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}
	}
}