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
using Final.Models.DTOs;
using Dapper;


namespace Final.Controllers
{
    public class RatingsApiController : ApiController
    {
        [HttpPost]
        public IHttpActionResult GetRatingsWithDetails()
        {
            using (var db = new AppDbContext())
            {
                var connection = db.Database.Connection;

                // 使用 Dapper 執行查詢，獲取詳細數據
                var query = @"
                SELECT r.Id,mi.CategoryId,mi.Title AS MediaInfoTitle, m.Account AS MemberAccount,
                       r.Comment, r.Rate, r.CreatedTime
                FROM Ratings AS r
                JOIN Members AS m ON r.MemberId = m.Id
                JOIN MediaInfos AS mi ON r.MediaInfoId = mi.Id";

                var ratingsWithDetails = connection.Query<RatingsRelDTO>(query).ToList();

                return Ok(ratingsWithDetails);
            }
        }

        //[HttpGet]
        //public IHttpActionResult Detail(int id)
        //{
        //    using (var db = new AppDbContext())
        //    {
        //        var rating = db.Ratings
        //            .Include(x => x.MediaInfo)
        //            .Include(x => x.Member)
        //            .FirstOrDefault(x => x.Id == id);

        //        if (rating == null)
        //        {
        //            return NotFound(); // 如果找不到評分，返回404 Not Found
        //        }

        //        var vm = MapperObj.Map<Rating, RatingVm>(rating);
        //        return Ok(vm); // 返回詳細信息的JSON數據
        //    }
        //}
    }
}


