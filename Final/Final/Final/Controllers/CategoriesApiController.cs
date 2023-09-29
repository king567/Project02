using Final.Models.DTOs;
using Final.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Final.Models.Services;
using Final.Models.ViewModels;

namespace Final.Controllers
{
    public class CategoriesApiController : ApiController
    {
        // 搜尋 Category Name
        [HttpPost]
        [Route("api/Categories/Search")]
        public IHttpActionResult SearchCategories(CriteriaCategoriesDTO criteria)
        {
			List<CategoryDTO> categoryDTOs = new CategoryService().SearchCategories(criteria);

			// dto 轉成 vm
            List<CategoryVm> vms = categoryDTOs.Convert2VM();

			return Ok(vms);
		}

        // 刪除 Category
        [HttpDelete]
		public IHttpActionResult DeleteCategory(int id)
        {
            if (id == 0)
            {
				return BadRequest("無效的參數");
			}
			else
            {
                bool isDelete = new CategoryService().DeleteCategory(id);
                if(isDelete == false)
                {
                    return NotFound();
                }
                else
                {
					return Ok("刪除成功");
				}
            }
        }
    }
}
