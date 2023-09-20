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
        public IHttpActionResult Get()
        {
            var db = new MediaInfoRepository();
            var data = db.GetMediaInfoData();

			return Ok("Hello World");
		}
    }
}
