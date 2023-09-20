﻿using Final.Models.DTOs;
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
            CriteriaDTO criteria = new CriteriaDTO()
            {
                Id = null,
                Title = title,
                OverView = string.Empty,
                CategoryId = null,
                Genres = new List<int>() {/* 12, 53 */},
                Otts = new List<int>() { },
                ReleaseDate = null,
                RemovalDate = null
            };

            var db = new MediaInfoRepository();
            var data = db.Search(criteria);

			List<MediaInfosRelPageDTO> dtos = data.Select(e => AutoMapperHelper.MapperObj.Map<MediaInfosRelPageDTO>(e)).ToList();

			return Ok(dtos);
		}
    }
}
