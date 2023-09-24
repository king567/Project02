using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Repositories;
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
	}
}