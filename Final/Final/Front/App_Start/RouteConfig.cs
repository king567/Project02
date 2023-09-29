using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Project2
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

			// 自訂定義路由規則
			routes.MapRoute(
				name: "Category",
				url: "MediaInfos/Category/{categoryId}",
				defaults: new { controller = "MediaInfos", action = "Category"}
			);

			routes.MapRoute(
				name: "CategoryWithGenre",
				url: "MediaInfos/Category/{categoryId}/Genres/{genreId}",
				defaults: new { controller = "MediaInfos", action = "CategoryWithGenre" }
			);

			routes.MapRoute(
				name: "Index",
				url: "MediaInfos",
				defaults: new { controller = "MediaInfos", action = "Index" }
			);

			routes.MapRoute(
				name: "Details",
				url: "MediaInfos/Details/{id}",
				defaults: new { controller = "MediaInfos", action = "Details" }
			);

			// 近期上映 並分類為 CategoryId
			routes.MapRoute(
				name: "RecentReleaseWithCategory",
				url: "MediaInfos/Category/{categoryId}/RecentRelease",
				defaults: new { controller = "MediaInfos", action = "RecentReleaseWithCategory" }
			);	

			// 即將上架 並分類為 CategoryId
			routes.MapRoute(
				name: "UpcomingReleaseWithCategory",
				url: "MediaInfos/Category/{categoryId}/UpcomingRelease",
				defaults: new { controller = "MediaInfos", action = "UpcomingReleaseWithCategory" }
			);

			// 近期下架 並分類為 CategoryId
			routes.MapRoute(
				name: "RecentRemovalWithCategory",
				url: "MediaInfos/Category/{categoryId}/RecentRemoval",
				defaults: new { controller = "MediaInfos", action = "RecentRemovalWithCategory" }
			);

			// 影片分類 CategoryId 並且類型為 OttTypeId
			routes.MapRoute(
				name: "CategoryWithOttType",
				url: "MediaInfos/Category/{categoryId}/OttType/{ottTypeId}",
				defaults: new { controller = "MediaInfos", action = "CategoryWithOttType" }
			);

			routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );


		}
    }
}
