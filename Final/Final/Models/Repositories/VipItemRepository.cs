using Dapper;
using Final.Models.EFModels;
using Final.Models.Entities;
using System.Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Final.Models.DTOs;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using System.Data.Odbc;
using System.Diagnostics;
using Final.Models.ViewModels;

namespace Final.Models.Repositories
{
    public class VipItemRepository
    {
        public List<Vipitem> GetAllVipItems(VipItemSearchVm search)
        {
            //取得Vipitems所有值,包含Member,PayType,並對account,日期做篩選,若沒有篩選條件則回傳全部

            using (var db = new AppDbContext())
            {
                var vipitem = db.Vipitems
                              .AsNoTracking()
                              .Include(v => v.Member)
                              .Include(v => v.PayType)
                              .ToList();

                return vipitem;
            }  
        }
    }
}