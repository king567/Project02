using System;
using System.IO;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Net;
using System.Web;
using System.Net.Http;
using System.Web.Http;
using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Entities;
using Final.Models.Repositories;
using Final.Models.Services;
using Final.Models.ViewModels;
using System.Collections.Specialized;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using Final.Models.Infra;

namespace Final.Controllers
{
    public class GenresApiController : ApiController
    {
        // GET: api/GenresApi
        public IHttpActionResult GetAllGenres()
        {
            // Genres service 取得 Genres 所有資料
            List<GenresDTO> genresDTO = new GenreService().GetAllGenres();

            // DTO 轉成 VM
            List<GenresVm> vm = genresDTO.Convert2VM();

			return Ok(vm);
		}

        // 搜尋 Genres
        [HttpPost]
        [Route("api/GenresApi/Search")]
        public IHttpActionResult SearchGenres([FromBody]  CriteriaGenresDTO criteria)
        {
			// Genres service 取得 Genres 所有資料
			List<GenresDTO> genresDTO = new GenreService().SearchGenres(criteria);

			// DTO 轉成 VM
			List<GenresVm> vm = genresDTO.Convert2VM();

			return Ok(vm);
		}

        [HttpDelete]
        public IHttpActionResult DeleteGenre(int id)
        {
			// Genres service 刪除 genre
			if (id == 0)
            {
                return BadRequest("無效的參數");
            }
            else
            {
                bool isDelete = new GenreService().DeleteGenre(id);
				if (isDelete == false)
                {
					return NotFound();
				}
                else
                {
                    return Ok("刪除成功");
                }

            }
		}
    }
}
