using Final.Models.DTOs;
using Final.Models.Repositories;
using Final.Models.Services;
using Final.Models.ViewModels;
using Microsoft.Ajax.Utilities;
using Project2.Models.DTOs;
using Project2.Models.EFModels;
using Project2.Models.Repositories;
using Project2.Models.Services;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace Project2.Controllers
{
    public class MediaInfosController : Controller
    {
		// GET: MediaInfos
		// 預期網址：http://localhost:xxxx/MediaInfos/Category/2/Genres/1 搜尋分類Category 為2 且 類型Genres 為1的影片
		// 預期網址：http://localhost:xxxx/MediaInfos/Category/2 搜尋分類Category 為2的影片
		// 預期網址：http://localhost:xxxx/MediaInfos 搜尋全部影片
		// GET: MediaInfos
		public ActionResult Index()
		{
			return View();
		}

		// 搜尋影片
		// GET: MediaInfos/Search
		public ActionResult Search(string title, int pageIndex = 0)
		{
			int pageSize = 10;

			var mediaInfos = new MediaInfoService().GetMediaInfosByTitlePage(pageIndex,pageSize,title).Convert2VM();

			int total = new MediaInfoRepository().GetMediaInfosByTitleCount(title);

			ViewBag.PaginationInfo = new PaginationInfo(pageSize, pageIndex, total);

			return View(mediaInfos);
		}

		// GET: MediaInfos/Details/5
		public ActionResult Details(int id)
		{
			var dto = new MediaInfoService().GetMediaInfo(id);
			var vm = dto.Convert2VM();

			var currentUserAccount = User.Identity.Name;

            Models.EFModels.Member memberInfo = new Models.EFModels.Member();

			if (currentUserAccount != null)
			{
				memberInfo = new MemberRepository().GetMemberByAccount(currentUserAccount);
			}

			ViewBag.MediaInfoId = id;
			ViewBag.Member = memberInfo;
			ViewBag.CheckFavoriteMedia = false;

			if (memberInfo != null)
			{
				ViewBag.CheckFavoriteMedia = new FavoriteMediaService().CheckFavoriteMedia(new FavoriteMediaDTO { MediaInfoId = id, MemberId = memberInfo.Id });
			}

			return View(vm);
		}

		// GET: MediaInfos/Category/2
		public ActionResult Category(int categoryId,int pageIndex = 0)
		{
			// 取得所有 Genres
			var genresVms = new GenreService().GetAllGenres().Convert2VM();

			int pageSize = 10;

			var MediaInfosByCategoryVms = new MediaInfoService().GetMediaInfosByCategory(categoryId, pageIndex, pageSize).Convert2VM();

			var ottTypes = new OttsService().GetAllOtts().Convert2VM();

			int total = new MediaInfoRepository().GetMediaInfoPageByCategoryCount(categoryId);

			ViewBag.PaginationInfo = new PaginationInfo(pageSize, pageIndex, total);
			ViewBag.CategoryId = categoryId;
			ViewBag.Genres = genresVms;
			ViewBag.OttTypes = ottTypes;

			return View(MediaInfosByCategoryVms);
		}

		// GET: MediaInfos/Category/2/Genres/1
		public ActionResult CategoryWithGenre(int categoryId, int genreId,int pageIndex = 0)
		{

			int pageSize = 10;

			var getMediaInfosByCategoryWithGenre = new MediaInfoService().GetMediaInfosByCategoryWithGenre(categoryId, genreId, pageIndex, pageSize).Convert2VM();
			// 取得所有 Genres
			var genresVms = new GenreService().GetAllGenres().Convert2VM();

			var ottTypes = new OttsService().GetAllOtts().Convert2VM();

			int total = new MediaInfoRepository().GetMediaInfoPageByCategoryWithGenreCount(categoryId, genreId);

			ViewBag.PaginationInfo = new PaginationInfo(pageSize, pageIndex, total);
			ViewBag.CategoryId = categoryId;
			ViewBag.GenreId = genreId;
			ViewBag.Genres = genresVms;
			ViewBag.OttTypes = ottTypes;

			return View(getMediaInfosByCategoryWithGenre);
		}

		// 取得影片資訊 在 category 分類底下的 ottType 類型
		public ActionResult CategoryWithOttType(int categoryId, int ottTypeId,int pageIndex = 0)
		{
			int pageSize = 10;

			var getMediaInfosByCategoryWithOttType = new MediaInfoService().GetMediaInfosByCategoryWithOttType(categoryId, ottTypeId, pageIndex, pageSize).Convert2VM();

			var genresVms = new GenreService().GetAllGenres().Convert2VM();

			var ottTypes = new OttsService().GetAllOtts().Convert2VM();

			int total = new MediaInfoRepository().GetMediaInfosByCategoryAndOttTypeCount(categoryId, ottTypeId);

			ViewBag.PaginationInfo = new PaginationInfo(pageSize, pageIndex, total);
			ViewBag.CategoryId = categoryId;
			ViewBag.OttTypeId = ottTypeId;
			ViewBag.Genres = genresVms;
			ViewBag.OttTypes = ottTypes;

			return View(getMediaInfosByCategoryWithOttType);
		}

		// 近期上映 在 category 分類底下
		public ActionResult RecentReleaseWithCategory(int categoryId,int pageIndex = 0)
		{
			int pageSize = 10;

			var getMediaInfosByRecentRelease = new MediaInfoService().GetMediaInfosWithinLastOneMonthPage(pageIndex, pageSize, categoryId).Convert2VM();

			var genresVms = new GenreService().GetAllGenres().Convert2VM();

			var ottTypes = new OttsService().GetAllOtts().Convert2VM();

			int total = new MediaInfoRepository().GetMediaInfosWithinLastOneMonthCount(categoryId);

			ViewBag.PaginationInfo = new PaginationInfo(pageSize, pageIndex, total);
			ViewBag.CategoryId = categoryId;
			ViewBag.Genres = genresVms;
			ViewBag.OttTypes = ottTypes;

			return View(getMediaInfosByRecentRelease);
		}

		// 即將上映 在 category 分類底下
		public ActionResult UpcomingReleaseWithCategory(int categoryId,int pageIndex = 0)
		{
			int pageSize = 10;

			var getMediaInfosByUpcomingRelease = new MediaInfoService().GetMediaInfosWithinNextOneMonthPage(pageIndex, pageSize, categoryId).Convert2VM();

			var genresVms = new GenreService().GetAllGenres().Convert2VM();

			var ottTypes = new OttsService().GetAllOtts().Convert2VM();

			int total = new MediaInfoRepository().GetMediaInfosWithinNextOneMonthCount(categoryId);

			ViewBag.PaginationInfo = new PaginationInfo(pageSize, pageIndex, total);
			ViewBag.CategoryId = categoryId;
			ViewBag.Genres = genresVms;
			ViewBag.OttTypes = ottTypes;

			return View(getMediaInfosByUpcomingRelease);
		}

		// 近期下架 在 category 分類底下
		public ActionResult RecentRemovalWithCategory(int categoryId,int pageIndex = 0)
		{
			int pageSize = 10;

			var getMediaInfosByRecentRemoval = new MediaInfoService().GetRemovalMediaInfosWithinLastOneMonthPage(pageIndex, pageSize, categoryId).Convert2VM();

			var genresVms = new GenreService().GetAllGenres().Convert2VM();

			var ottTypes = new OttsService().GetAllOtts().Convert2VM();

			int total = new MediaInfoRepository().GetRemovalMediaInfosCount(categoryId);

			ViewBag.PaginationInfo = new PaginationInfo(pageSize, pageIndex, total);
			ViewBag.CategoryId = categoryId;
			ViewBag.Genres = genresVms;
			ViewBag.OttTypes = ottTypes;

			return View(getMediaInfosByRecentRemoval);
		}

		// 近期上映 在 category 分類底下 且 類型為 genre
		//public ActionResult RecentReleaseWithCategoryAndGenre(int categoryId, int genreId,int pageIndex = 0)
		//{
		//	int pageSize = 10;

		//	var getMediaInfosByRecentRelease = new MediaInfoService().GetMediaInfosWithinLastOneMonthPage(pageIndex, pageSize, categoryId, genreId).Convert2VM();

		//	var genresVms = new GenreService().GetAllGenres().Convert2VM();

		//	var ottTypes = new OttsService().GetAllOtts().Convert2VM();

		//	int total = new MediaInfoRepository().GetMediaInfosWithinLastOneMonthCount(categoryId, genreId);

		//	ViewBag.PaginationInfo = new PaginationInfo(pageSize, pageIndex, total);
		//	ViewBag.Genres = genresVms;
		//	ViewBag.OttTypes = ottTypes;

		//	return View(getMediaInfosByRecentRelease);
		//}
	}
	public class PaginationInfo
	{
		public int Total { get; set; } // 總筆數
		public int PageSize { get; set; } // 每頁筆數
		public int PageIndex { get; set; } // 目前頁數, 0-based
		public PaginationInfo(int pageSize, int pageIndex, int total)
		{
			this.PageSize = pageSize;
			this.PageIndex = pageIndex;
			this.Total = total;
		}
	}
	public class Paged<T>
	{
		public int Total { get; set; } // 總筆數
		public int PageSize { get; set; } // 每頁筆數
		public int PageIndex { get; set; } // 目前頁數, 0-based

		public IEnumerable<T> Data { get; set; } // 單頁資料

		public Paged(IEnumerable<T> data, int pageSize, int pageIndex, int total)
		{
			this.Data = data;
			this.PageSize = pageSize;
			this.Total = total;
			this.PageIndex = pageIndex;
		}
	}
}