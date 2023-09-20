using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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

		public List<MediaInfosRelDTO> GetMediaInfo(int id)
		{
			List<MediaInfo> Entities = new MediaInfoRepository().GetMediaInfo(id);
			List<MediaInfosRelDTO> dto = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);
			return dto;
		}
	}
}