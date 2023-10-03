using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Services;
using Final.Models.ViewModels;

namespace Final.Controllers
{
    public class OttTypesApiController : ApiController
    {
        [HttpGet]
		public IHttpActionResult GetAllOtts()
        {
            // 取得所有OTT Rel資料
            var db = new AppDbContext();

            var mediaInfos_OttTypes_Rels = db.MediaInfos_OttTypes_Rel
                .Include(m => m.MediaInfo)
                .Include(m => m.OttTypeId)
                .Select(m => new
                {
				    ID = m.Id,
					MediaInfoId = m.MediaInfoId,
                    MediaInfoTitle = m.MediaInfo.Title,
					OttTypeId = m.OttTypeId,
					OttTypeName = m.OttType.Name,
                    ReleaseDate = m.Release_Date,
                    RemovalDate = m.Removal_Date
				})
                .ToList();

            // 轉換成DTO
            //List<MediaInfosOttTypesRelDTO> mediaInfos_OttTypes_RelsDTO = AutoMapperHelper.MapperObj.Map<List<MediaInfosOttTypesRelDTO>>(mediaInfos_OttTypes_Rels);

			return Ok(mediaInfos_OttTypes_Rels);
		}

        [HttpPost]
        [Route("api/OttTypesApi/Search")]
        // 搜尋 otts 資料
        public IHttpActionResult Search(CriteriaOttsDTO criteria)
        {
			// Genres service 取得 Genres 所有資料
			List<OttTypesDTO> ottsDTO = new OttsService().SearchOtts(criteria);

			// DTO 轉成 VM
            List<OttTypesVm> vm = ottsDTO.Convert2VM();

            return Ok(vm);
		}
        [HttpDelete]
		public IHttpActionResult DeleteOtt(int id)
        {
        // OttTypes service 刪除 ott
        if (id == 0)
        {
	        return BadRequest("無效的參數");
        }
        else
        {
	        new OttsService().DeleteOtt(id);
	        return Ok();
        }
        }

    }
}
