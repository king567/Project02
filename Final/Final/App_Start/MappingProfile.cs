using AutoMapper;
using Final.Models.EFModels;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.App_Start
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            // 可以二個方向都寫, 但也可以直接用 ReverseMap() 來反轉,表示二個方向都要做
            CreateMap<BlacklistReason, BlacklistReasonVm>().ReverseMap();
            CreateMap<PayType, PayTypeVm>().ReverseMap();
        }
    }
}