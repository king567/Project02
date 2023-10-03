using Final.Models.DTOs;
using Final.Models.Repositories;
using Final.Models.Services;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Final.Controllers
{
    public class VipItemApiController : ApiController
    {
        [HttpPost]
        public IHttpActionResult GetAllVipItem(VipItemSearchVm search)
        {
            List<VipItemDto> VipItem = new VipItemService().GetAllVipItems(search);

            List<VipItemVm> vm = VipItem.Convert2VM();

            return Ok(vm);
        }
    }
}
