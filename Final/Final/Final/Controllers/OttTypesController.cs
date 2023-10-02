using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Repositories;
using Final.Models.Services;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class OttTypesController : Controller
    {
		// GET: OttsTypes
		[Authorize]
		public ActionResult Index()
        {
            return View();
        }

		// 新增 OttType
		[Authorize]
		public ActionResult Create()
        {
			return View();
		}

        [HttpPost]
		[Authorize]
		public ActionResult Create(OttTypesVm vm)
        {
            // OttTypes Service 新增 ottType
            if (ModelState.IsValid)
            {
                // vm 轉成 dto

				OttTypesDTO dto = AutoMapperHelper.MapperObj.Map<OttTypesDTO>(vm);

                // dto 轉成 entity

                OttType entity = AutoMapperHelper.MapperObj.Map<OttType>(dto);

                bool isCreate = new OttRepository().CreateOttType(entity);

                if (isCreate)
                {
                    return RedirectToAction("Index");
                }
                else
                {
					ModelState.AddModelError("", "新增失敗");
				}
            }

            return View();
        }

		// 修改 OttType
		[Authorize]
		public ActionResult Edit(int id)
        {
			// OttTypes Service 取得指定的 OttType Id 資料
			var entity = new OttRepository().GetOttType(id);

			// entity 轉成 dto
			OttTypesDTO dto = AutoMapperHelper.MapperObj.Map<OttTypesDTO>(entity);

			// dto 轉成 vm
			OttTypesVm vm = AutoMapperHelper.MapperObj.Map<OttTypesVm>(dto);

			return View(vm);
		}
        [HttpPost]
		[Authorize]
		public ActionResult Edit(OttTypesVm vm)
        {
			// OttTypes Service 修改 OttType
			if (ModelState.IsValid)
            {
				// vm 轉成 dto
                OttTypesDTO dto = AutoMapperHelper.MapperObj.Map<OttTypesDTO>(vm);

                // service 修改 OttType
                bool isUpdate = new OttsService().UpdateOtt(dto);

                // 檢查修改是否成功
                if (isUpdate)
                {
					return RedirectToAction("Index");
				}
				else
                {
                    ModelState.AddModelError("", "修改失敗");
                }
            }

			return RedirectToAction("Index");
		}
    }
}