using Project2.Models.DTOs;
using Project2.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using static Project2.AutoMapperHelper;
namespace Project2.Models.Services
{
    public class NewsService
    {
        // 取得 News 分頁資料
        public List<NewsDto> GetAll(int page, int pageSize)
        {
            var entities = new NewsRepository().GetAll(page, pageSize);

            List<NewsDto> dtos = MapperObj.Map<List<NewsDto>>(entities);

            return dtos;
        }
    }
}