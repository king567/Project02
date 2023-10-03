using Project2.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.ViewModels
{
    public class MemberCenterVm
    {
        public MemberVm Member { get; set; }
        public BlacklistVm Blacklist { get; set; }
        public List<VipitemVm> Vipitem { get; set; }
    }
}