using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//using static Final.AutoMapperHelper;
namespace Final.Models.Services
{
    public class MemberService
    {
        //public List<MemberDto> SearchMembers(string account = "", bool vip = false, bool blacklist = false)
        //{
        //    using (var db = new AppDbContext())
        //    {
        //        // 使用 AsQueryable() 將集合轉換為 IQueryable
        //        var query = new MemberRepository().GetAllMembers().AsQueryable();

        //        // 根據條件篩選
        //        if (!string.IsNullOrEmpty(account))
        //        {
        //            query = query.Where(m => m.Account.Contains(account));
        //        }
        //        if (vip)
        //        {
        //            query = query.Where(m => m.VipEnddate != null);
        //        }
        //        if (blacklist)
        //        {
        //            query = query.Where(m => m.BlacklistEnddate != null);
        //        }

        //        var members = query.ToList();

        //        //var dtos = AutoMapperHelper.MapperObj.Map<List<Member>, List<MemberDto>>(members);
        //        var dtos = new List<MemberDto>();
        //        foreach (var member in members)
        //        {
        //            var dto = new MemberDto
        //            {
        //                Id = member.Id,
        //                Account = member.Account,
        //                Password = member.Password,
        //                Name = member.Name,
        //                Email = member.Email,
        //                BirthOfDate = member.BirthOfDate,
        //                VipStartdate = member.VipStartdate,
        //                VipEnddate = member.VipEnddate,
        //                BlacklistEnddate = member.BlacklistEnddate,
        //                IsConfirmed = member.IsConfirmed,   
        //                ConfirmedCode = member.ConfirmedCode,
        //                CreatedTime = member.CreatedTime
        //            };
        //            dtos.Add(dto);
        //        }

        //        return dtos;
        //    }
        //}
        public int TotalMembers()
        {
            var membercount = new MemberRepository().CalculateTotalMembers();
            return membercount;
        }
    }
}