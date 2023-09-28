using Project2.Models.DTOs;
using Project2.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Project2.Controllers
{
    public class FavoriteMediaApiController : ApiController
    {
		//新增一筆 FavoriteMedia 資料
		[HttpPost]
		public IHttpActionResult AddFavoriteMedia([FromBody] FavoriteMediaDTO dto)
		{
			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			bool service = new FavoriteMediaService().AddFavoriteMedia(dto);

			if (service)
			{
				return Ok("新增收藏成功");
			}
			else
			{
				return BadRequest("新增收藏失敗");
			}
		}

		// 刪除一筆 FavoriteMedia 資料
		[HttpDelete]
        public IHttpActionResult DeleteFavoriteMedia([FromBody] FavoriteMediaDTO dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            bool service = new FavoriteMediaService().DeleteFavoriteMedia(dto);
            if (service)
            {
                return Ok("刪除收藏成功");
            }
            else
            {
                return BadRequest("刪除收藏失敗");
            }
        }
    }
}
