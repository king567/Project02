using System;
using System.Collections.Generic;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Models.ViewModels
{
    public class VipItemSearchVm
    {
        public string MemberAccount { get; set; }
        public int? SelectedPayTypeId { get; set; } // 新增的選擇的 PayType 屬性
        public List<SelectListItem> PayTypes { get; set; } // 下拉選項
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate  { get; set; }
    }
}