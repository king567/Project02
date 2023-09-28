using Project2.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Final.Models.Repositories
{
    public class MemberRepository
    {
        public void Delete(int id)
        {
            string sql = "DELETE FROM Members WHERE Id=@Id";

            using (var db = new AppDbContext())
            {
                var members=db.Members.SqlQuery(sql, new SqlParameter("@Id", id)).ToList();
            }
        }
    }
}