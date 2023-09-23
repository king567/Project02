using Final.Models.EFModels;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using static Final.AutoMapperHelper;
namespace Final.Controllers
{
    public class MembersApiController : ApiController
    {
        [HttpPost]
        public IHttpActionResult Search(string name = "", bool vip = false, bool blacklist = false)
        {
            using (var db = new AppDbContext())
            {
                var query = db.Members.AsQueryable();

                // 根據條件篩選
                if (!string.IsNullOrEmpty(name))
                {
                    query = query.Where(m => m.Name.Contains(name));
                }
                if (vip)
                {
                    query = query.Where(m => m.VipEnddate != null);
                }
                if (blacklist)
                {
                    query = query.Where(m => m.BlacklistEnddate != null);
                }

                var members = query.ToList();
                var vm = MapperObj.Map<List<Member>, List<MemberVm>>(members);

                return Ok(vm);
            }
        }

        [HttpDelete]
        public IHttpActionResult DeleteMembers(int id)
        {
            var db = new AppDbContext();
            Member member = db.Members.Find(id);
            if (member == null)
            {
                return NotFound();
            }

            db.Members.Remove(member);
            db.SaveChanges();

            return Ok(member);
        }
    }
}
