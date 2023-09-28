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
    public class OttsApiController : ApiController
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
    }
}
