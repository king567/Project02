using Final.Models.DTOs;
using Final.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Final.Controllers
{
    public class TestApiController : ApiController
    {
        public IHttpActionResult Get(string title)
        {
            //CriteriaDTO criteria = new CriteriaDTO()
            //{
            //    Id = null,
            //    Title = title,
            //    OverView = string.Empty,
            //    CategoryId = null,
            //    Genres = new List<int>() {/* 12, 53 */},
            //    Otts = new List<int>() { },
            //    ReleaseDate = null,
            //    RemovalDate = null
            //};

            var db = new MediaInfoRepository();
            int genreId = 26;
            List<int> genres = new List<int>() { 18,10770,16 };
            db.UpdateMediaInfoGenreIfChanged(genreId, genres);
			//var data = db.Search(criteria);
			//var getFutureMediaInfos = db.GetMediaInfosWithinNextOneMonth();


			//List<MediaInfosRelPageDTO> dtos = getFutureMediaInfos.Select(e => AutoMapperHelper.MapperObj.Map<MediaInfosRelPageDTO>(e)).ToList();

			return Ok("hello");
		}
    }
}
