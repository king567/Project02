using Final.Models.DTOs;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
    public class VipItemVm
    {
        [Display(Name ="會員帳號")]
        public string MemberAccount { get; set; }
        [Display(Name = "姓名")]
        public string MemberName { get; set; }
        [Display(Name = "方案")]
        public string Type { get; set; }
        [Display(Name = "費用")]
        public int Fee { get; set; }
        [Display(Name = "付款日期")]
        public DateTime PaymentDate { get; set; }
        [Display(Name ="起始日期")]
        public DateTime StartDate { get; set; }
        [Display(Name ="到期日期")]
        public DateTime ExpiryDate { get; set; }
        [Display(Name ="狀態")]
        public bool Status { get; set; }
    }
    public static class VipItemVmExts
    {
        public static List<VipItemVm> Convert2VM(this List<VipItemDto> vipitem)
        {
            List<VipItemVm> vm = AutoMapperHelper.MapperObj.Map<List<VipItemVm>>(vipitem);

            return vm;
        }
    }
}