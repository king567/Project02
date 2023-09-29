using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
    public class MemberDetailVm
    {
        public MemberVm Member { get; set; }
        public BlacklistVm Blacklist { get; set; }
        //public List<BlacklistVm> Blacklist { get; set; }
        public List<VipItemVm> Vipitem { get; set; }
    }
}