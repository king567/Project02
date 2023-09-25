using System;
using System.IO;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Net;
using System.Web;
using System.Net.Http;
using System.Web.Http;
using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Entities;
using Final.Models.Repositories;
using Final.Models.Services;
using Final.Models.ViewModels;
using System.Collections.Specialized;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using Final.Models.Infra;

namespace Final.Controllers
{
	public class MediaInfosApiController : ApiController
	{
		[HttpGet]
		public IHttpActionResult GetAllMediaInfosRel()
		{
			List<MediaInfosRelDTO> mediaInfosDTO = new MediaInfoService().GetAllMediaInfos();

			List<MediaInfosRelVm> vm = mediaInfosDTO.Convert2VM();

			return Ok(vm);
		}

		[HttpGet]
		// web api 取得指定的MediaInfo Id資料
		public IHttpActionResult GetMediaInfo(int id)
		{
			MediaInfosRelDTO mediaInfosDTO = new MediaInfoService().GetMediaInfo(id);

			MediaInfosRelVm vm = mediaInfosDTO.Convert2VM();

			return Ok(vm);
		}


		[HttpGet]
		[Route("api/GetPage")]
		// Web API 取得 MediaInfo 的分頁資料
		// 測試網址: http://localhost:53403/api/GetPage?page=1&pageSize=5
		public IHttpActionResult GetMediaInfoPage(int page, int pageSize)
		{
			//int page = 1, pageSize = 5;

			List<MediaInfosRelDTO> dtos = new MediaInfoService().GetMediaInfosPage(page, pageSize);

			// DTO 轉成 VM
			List<MediaInfosRelVm> vm = dtos.Convert2VM();

			return Ok(vm);
		}

		[HttpPost]
		[Route("api/Search")]
		// Postmam 測試網址: http://localhost:53403/api/Search
		// Body: raw, JSON(application/json)
		// Method: POST
		public IHttpActionResult Search([FromBody] CriteriaDTO criteria)
		{
			var db = new MediaInfoRepository();

			var Entities = db.Search(criteria);

			// Entities 轉成 DTO
			List<MediaInfosRelDTO> dtos = AutoMapperHelper.MapperObj.Map<List<MediaInfosRelDTO>>(Entities);

			// DTO 轉成 VM
			List<MediaInfosRelVm> vm = dtos.Convert2VM();

			return Ok(vm);
		}

		[HttpPost]
		[Route("api/MediaInfosApi/Create")]
		// Postmam 測試網址: http://localhost:53403/api/MediaInfosApi/Create
		public IHttpActionResult Create()
		{
			if(SaveRequest()) return Ok("新增成功");
			return BadRequest("新增失敗");
		}

		[HttpDelete]
		public IHttpActionResult Delete(int id)
		{
			var db = new AppDbContext();

			var mediaInfo = db.MediaInfos.Find(id);

			if (mediaInfo == null)
			{
				return NotFound();
			}

			db.MediaInfos.Remove(mediaInfo);

			// 刪除該MediaInfo Id 的封面及背景圖片
			string posterWebPath = "~/Images/Poster";
			string backdropWebdPath = "~/Images/Backdrop";
			string posterPath = string.Empty;
			string backdropPath = string.Empty;

			// 如果圖片為 null 就不刪除圖片
			if (mediaInfo.PosterPath != null)
			{
				posterPath = Path.Combine(HttpContext.Current.Server.MapPath(posterWebPath), mediaInfo.PosterPath);
			}
			if(mediaInfo.BackdropPath != null)
			{
				backdropPath = Path.Combine(HttpContext.Current.Server.MapPath(backdropWebdPath), mediaInfo.BackdropPath);
			}

			// 檢查檔案是否存在
			if (File.Exists(posterPath))
			{
				File.Delete(posterPath);
			}
			if (File.Exists(backdropPath))
			{
				File.Delete(backdropPath);
			}

			db.SaveChanges();

			return Ok("刪除成功");
		}

		[HttpPost]
		[Route("api/MediaInfosApi/Edit")]
		public IHttpActionResult Edit(int id)
		{
			//var db = new AppDbContext();

			//var mediaInfo = db.MediaInfos.Find(id);

			//if (mediaInfo == null)
			//{
			//	return NotFound();
			//}

			//if (SaveRequest()) return Ok("更新成功");
			//return BadRequest("更新失敗");
			if (EditRequest(id)) return Ok("更新成功");
			return BadRequest("更新失敗:應影片不存在");
		}

		private bool SaveRequest()
		{
			string posterWebPath = "~/Images/Poster";
			string backdropWebdPath = "~/Images/Backdrop";

			//// 使用 uploadHelper 來處理上傳檔案
			//IRenameProvider renameProvider = new GuidRenameProvider();
			//IUploadValidator[] validators = new IUploadValidator[]
			//{
			//	new RequiredValidator(),
			//	new ImageValidator(),
			//	new FileSizeValidator(2048 * 2048) // 最大 1MB
			//};

			//// 檢查 HttpContext.Current.Request.Files["Poster"] 是否有檔案上傳

			//if(HttpContext.Current.Request.Files["Poster"].ContentLength > 0)
			//{
			//	HttpPostedFileBase postedFileBase = new HttpPostedFileWrapper(HttpContext.Current.Request.Files["Poster"]);
			//	UploadFileHelper fileHelper = new UploadFileHelper(renameProvider, validators);

			//	// 假設你有一個名為 file 的 HttpPostedFileBase 實例，以及指定的儲存路徑 path
			//	string uploadedFileName = fileHelper.SaveFile(postedFileBase, posterWebPath);
			//	if (uploadedFileName != null)
			//	{
			//		// 檔案上傳成功，uploadedFileName 包含新的檔案名稱
			//		Console.WriteLine("檔案上傳成功，新檔案名稱：" + uploadedFileName);
			//	}
			//	else
			//	{
			//		// 檔案上傳失敗或不符合驗證規則
			//		Console.WriteLine("檔案上傳失敗或不符合驗證規則");
			//	}
			//}


			// 检查是否有上傳檔案
			if (HttpContext.Current.Request.Files.Count > 0)
			{
				HttpPostedFile file = HttpContext.Current.Request.Files[0];
				// 检查文件是否有效
				if (file != null && file.ContentLength > 0)
				{

					HttpPostedFile Poster = HttpContext.Current.Request.Files["Poster"];

					var posterfileName = Path.GetRandomFileName() + Path.GetExtension(Poster.FileName);
					var posterPath = Path.Combine(HttpContext.Current.Server.MapPath(posterWebPath), posterfileName);

					// 保存poster
					Poster.SaveAs(posterPath);

					HttpPostedFile Backdrop = HttpContext.Current.Request.Files["Backdrop"];

					var backdropfileName = Path.GetRandomFileName() + Path.GetExtension(Backdrop.FileName);
					var backdropPath = Path.Combine(HttpContext.Current.Server.MapPath(backdropWebdPath), backdropfileName);

					// 保存backdrop
					Backdrop.SaveAs(backdropPath);

					var db = new AppDbContext();

					string json = HttpContext.Current.Request.Form["MediaInfo"];

					FormDataModelVm vm = JsonConvert.DeserializeObject<FormDataModelVm>(json);

					vm.PosterPath = @"/Images/Poster/" + posterfileName;
					vm.BackdropPath = @"/Images/Backdrop/" + backdropfileName;

					// FormDataModelVm 轉成 MediaInfo autoMapper 待測試
					MediaInfo entity = AutoMapperHelper.MapperObj.Map<MediaInfo>(vm);

					db.MediaInfos.Add(entity);

					db.SaveChanges();

					return true;
				}
			}

			return false;
		}

		private bool EditRequest(int mediaInfoId)
		{
			string json = HttpContext.Current.Request.Form["MediaInfo"];

			FormDataModelVm vm = JsonConvert.DeserializeObject<FormDataModelVm>(json);

			var db = new AppDbContext();

			MediaInfo entity = AutoMapperHelper.MapperObj.Map<MediaInfo>(vm);

			entity.Id = mediaInfoId;

			// 更新 MediaInfos_Genres_Rel 資料 (先刪除再新增)
			// 更新 MediaInfos_OttTypes_Rel 資料 (先刪除再新增)
			var mediaInfo = db.MediaInfos.Find(entity.Id);
			// 檢查是否有找到 MediaInfo Id 的資料
			if (mediaInfo != null)
			{
				// 检查是否有上傳檔案 (有上傳檔案才更新圖片)
				if (HttpContext.Current.Request.Files.Count > 0)
				{
					HttpPostedFile file = HttpContext.Current.Request.Files[0];
					// 检查文件是否有效
					if (file != null && file.ContentLength > 0)
					{
						string posterWebPath = "~/Images/Poster";
						string backdropWebdPath = "~/Images/Backdrop/";

						HttpPostedFile Poster = HttpContext.Current.Request.Files["Poster"];
						HttpPostedFile Backdrop = HttpContext.Current.Request.Files["Backdrop"];

						var posterfileName = Path.GetRandomFileName() + Path.GetExtension(Poster.FileName);
						var posterPath = Path.Combine(HttpContext.Current.Server.MapPath(posterWebPath), posterfileName);
						var backdropfileName = Path.GetRandomFileName() + Path.GetExtension(Backdrop.FileName);
						var backdropPath = Path.Combine(HttpContext.Current.Server.MapPath(backdropWebdPath), backdropfileName);

						// 保存poster
						Poster.SaveAs(posterPath);
						// 保存backdrop
						Backdrop.SaveAs(backdropPath);

						entity.PosterPath = @"/Images/Poster/" + posterfileName;
						entity.BackdropPath = @"/Images/Backdrop/" + backdropfileName;
					}
				}
				else
				{
					// 沒有上傳檔案就使用原本的圖片
					entity.PosterPath = mediaInfo.PosterPath;
					entity.BackdropPath = mediaInfo.BackdropPath;
				}

				// 更新 MediaInfo 資料
				db.MediaInfos_Genres_Rel.RemoveRange(mediaInfo.MediaInfos_Genres_Rel);
				db.MediaInfos_OttTypes_Rel.RemoveRange(mediaInfo.MediaInfos_OttTypes_Rel);
				db.SaveChanges();

				db.MediaInfos.Add(entity);

				// 儲存變更
				db.SaveChanges();

				return true;
			}

			return false;
		}
	}
}
