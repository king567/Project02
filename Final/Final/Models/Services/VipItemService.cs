using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Repositories;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.Services
{
    public class VipItemService
    {
        public List<VipItemDto> GetAllVipItems(VipItemSearchVm search)
        {
            List<Vipitem> Entities = new VipItemRepository().GetAllVipItems(search);


            if (!string.IsNullOrEmpty(search.MemberAccount))
            {
                Entities = Entities.Where(v => v.Member.Account.Contains(search.MemberAccount)).ToList();
            }
            if (search.StartDate != null)
            {
                Entities = Entities.Where(v => v.PaymentDate >= search.StartDate).ToList();
            }

            if (search.EndDate != null)
            {
                Entities = Entities.Where(v => v.PaymentDate <= search.EndDate).ToList();
            }
            if (search.SelectedPayTypeId != null && search.SelectedPayTypeId > 0)
            {
                // 使用所選的 PayType 的 ID 進行篩選
                Entities = Entities.Where(v => v.PayTypeId == search.SelectedPayTypeId).ToList();
            }


            List<VipItemDto> dto = AutoMapperHelper.MapperObj.Map<List<VipItemDto>>(Entities);
            return dto;
        }
    }
}
