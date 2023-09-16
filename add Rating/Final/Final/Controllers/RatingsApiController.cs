using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.Entity;
using static Final.AutoMapperHelper;
using Final.Models.ViewModels;

namespace Final.Controllers
{
    public class RatingsApiController : ApiController
    {
        [HttpGet]
        public IHttpActionResult GetAll()
        {
            using (var db = new AppDbContext())
            {

                var ratings = db.Ratings
                    .Include(x => x.MediaInfo)
                    .Include(x => x.Member)
                    .ToList();

                var vm = MapperObj.Map<List<Rating>, List<RatingVm>>(ratings);

             
                return Ok(vm);
            }

        }
    }
}
