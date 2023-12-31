﻿using Final.Models.EFModels;
using Final.Models.Services;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
//using System.Web.Http;
using System.Web.Mvc;

using static Final.AutoMapperHelper;
namespace Final.Controllers
{
    [Authorize]
    public class MembersController : Controller
    {
        // GET: Members
        
        public ActionResult Index()
        {
            var totalMembers = new MemberService().TotalMembers(); 
            ViewBag.TotalMembers = totalMembers; 

            var db=new AppDbContext();
            var members = db.Members.ToList();
            return View(members);
        }
        public ActionResult Details(int? id)
        {
            var db = new AppDbContext();
            
            var member = db.Members.Find(id);
            var vipitem = db.Vipitems
                             .Where(v => v.MemberId == member.Id)
                             .Include(v => v.PayType)
                             .ToList();
            Blacklist blacklist = db.Blacklists
                              .Where(b => b.Id == member.Id)
                              .Include(b => b.BlacklistReason)
                              .FirstOrDefault();
            if (member == null)
            {
                throw new Exception("會員不存在");
            }
            MemberDetailVm data = new MemberDetailVm
            {
                Member = MapperObj.Map<MemberVm>(member),
                Vipitem = MapperObj.Map<List<VipItemVm>>(vipitem),
                Blacklist = MapperObj.Map<BlacklistVm>(blacklist)
            };

            if (blacklist != null)
            {
                data.Blacklist.Reason = blacklist.BlacklistReason.Reason;
            }

            return View(data);
        }
       
    }

   
}