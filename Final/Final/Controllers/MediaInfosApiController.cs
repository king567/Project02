using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Entities;
using Final.Models.Repositories;
using Final.Models.Services;
using Final.Models.ViewModels;

namespace Final.Controllers
{
    public class MediaInfosApiController : ApiController
    {
        [HttpGet]
        public IHttpActionResult GetAllMediaInfosRel()
        {
            List<MediaInfosRelDTO> mediaInfosDTO = new MediaInfoService().GetAllMediaInfos();

            List<MediaInfosRelVm> vm = mediaInfosDTO.Convert2VM();

            return Ok(vm);
        }

        [HttpGet]
        // web api 取得指定的MediaInfo Id資料
        public IHttpActionResult GetMediaInfo(int id)
        {
            //var data = new MediaInfoRepository().GetMediaInfo(id);
			List<MediaInfosRelDTO> mediaInfosDTO = new MediaInfoService().GetMediaInfo(id);

			List<MediaInfosRelVm> vm = mediaInfosDTO.Convert2VM();

			// 還要轉成 dto

			return Ok(vm);
        }

        [HttpGet]
        [Route("api/GetPage")]
		// Web API 取得 MediaInfo 的分頁資料
        public IHttpActionResult GetMediaInfoPage()
        {
			int page = 1, pageSize = 5;
			// 還要轉成 dto
			List<MediaInfo> entities = new MediaInfoRepository().GetMediaInfoPage(page, pageSize);

			//List<MediaInfosRelPageDTO> dtos = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelPageDTO>>(Entities);
			List<MediaInfosRelPageDTO> dtos = entities.Select(e => AutoMapperHelper.MapperObj.Map<MediaInfosRelPageDTO>(e)).ToList() ;


			return Ok(dtos);
		}

    }
}
