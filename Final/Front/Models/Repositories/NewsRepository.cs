using Project2.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;

namespace Project2.Models.Repositories
{
    public class NewsRepository
    {
        //取得 News 分頁資料
        public List<News> GetAll(int page, int pageSize) 
        {
            using (var db = new AppDbContext())
            {
                var news=db.News.OrderBy(n =>n.Id).Skip(page * pageSize).Take(pageSize).ToList();
                return news;
            }
        }

        // 計算News的資料總數
        public int NewsCount(string criteria)
        {
            using (var db = new AppDbContext())
            {
                var newscount = db.News.AsNoTracking().Count();

                return newscount;
            }
        }
    }
}