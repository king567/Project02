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
			List<MediaInfosRelDTO> mediaInfosDTO = new MediaInfoService().GetMediaInfo(id);

			List<MediaInfosRelVm> vm = mediaInfosDTO.Convert2VM();

			return Ok(vm);
        }


        [HttpGet]
        [Route("api/GetPage")]
		// Web API 取得 MediaInfo 的分頁資料
        // 測試網址: http://localhost:53403/api/GetPage?page=1&pageSize=5
        public IHttpActionResult GetMediaInfoPage(int page,int pageSize)
        {
			//int page = 1, pageSize = 5;
			
            List<MediaInfosRelDTO> dtos = new MediaInfoService().GetMediaInfosPage(page, pageSize);

            // DTO 轉成 VM
			List<MediaInfosRelVm> vm = dtos.Convert2VM();

			return Ok(vm);
		}

    }
}
