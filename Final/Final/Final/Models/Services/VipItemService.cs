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
            List<VipItemDto> dto = AutoMapperHelper.MapperObj.Map<List<VipItemDto>>(Entities);
            return dto;
        }
    }
}
