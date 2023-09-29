using Final.Models.DTOs;
using Project2.Models.EFModels;
using Final.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Project2;

namespace Final.Models.Services
{
	public class OttsService
	{
		// 取得所有OttType資料
		public List<OttTypesDTO> GetAllOtts()
		{
			var entities = new OttRepository().GetAllOttTypes();

			// Entity 轉成 DTO autoMapper

			List<OttTypesDTO> dtos = AutoMapperHelper.MapperObj.Map<List<OttTypesDTO>>(entities);

			return dtos;
		}
		// 搜尋 ottType Name
		public List<OttTypesDTO> SearchOtts(CriteriaOttsDTO criteria)
		{
			var entities = new OttRepository().Search(criteria);

			// Entity 轉成 DTO autoMapper

			List<OttTypesDTO> dtos = AutoMapperHelper.MapperObj.Map<List<OttTypesDTO>>(entities);

			return dtos;
		}

		// 新增 OttType
		public bool CreateOtt(OttTypesDTO dto)
		{
			var entity = AutoMapperHelper.MapperObj.Map<OttType>(dto);

			bool isCreate = new OttRepository().CreateOttType(entity);

			return isCreate;
		}


		//刪除 OttType
		public bool DeleteOtt(int id)
		{
			bool isDelete = new OttRepository().DeleteOttType(id);
			return isDelete;
		}

		// 修改 OttType
		public bool UpdateOtt(OttTypesDTO dto)
		{
			var entity = AutoMapperHelper.MapperObj.Map<OttType>(dto);

			bool isUpdate = new OttRepository().UpdateOttType(entity);

			return isUpdate;
		}
	}
}