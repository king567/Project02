using System;
using System.Collections.Generic;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
    public class VipItemSearchVm
    {
        public string MemberAccount { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate  { get; set; }
    }
}