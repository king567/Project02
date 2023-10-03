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
using System.Net.Http.Formatting;
using Antlr.Runtime.Misc;

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
			if (DeleteRequest(id)) return Ok("刪除成功");
			return BadRequest("刪除失敗");
		}

		[HttpPost]
		[Route("api/MediaInfosApi/Edit")]
		public IHttpActionResult Edit(int id)
		{
			if (EditRequest(id)) return Ok("更新成功");
			return BadRequest("更新失敗:應影片不存在");
		}


		private bool SaveRequest()
		{
			try
			{
				string posterWebPath = "/Images/Poster";
				string backdropWebPath = "/Images/Backdrop";

				string posterRootPath = HttpContext.Current.Server.MapPath(posterWebPath);
				string backdropRootPath = HttpContext.Current.Server.MapPath(backdropWebPath);

				// 前台圖片的Poster絕對路徑
				string frontposterPath = posterRootPath.Replace("Final\\Images", "Front\\Images");
				// 前台圖片的Backdrop絕對路徑
				string frontbackdrop = backdropRootPath.Replace("Final\\Images", "Front\\Images");

				if (HttpContext.Current.Request.Files.Count > 0)
				{
					HttpPostedFile Poster = HttpContext.Current.Request.Files["Poster"];
					HttpPostedFile Backdrop = HttpContext.Current.Request.Files["Backdrop"];

					string posterFileName = null;
					string backdropFileName = null;
					string imagesFolderPathPoster = null;
					string imagesFolderPathBackdrop = null;

					if (Poster != null && Poster.ContentLength > 0)
					{
						if (IsValidImageFile(Poster))
						{
							posterFileName = Path.GetRandomFileName() + Path.GetExtension(Poster.FileName);
							imagesFolderPathPoster = Path.Combine(posterRootPath, posterFileName);

							// 前台圖片的絕對路徑
							string imagesFolderFrontPathPoster = Path.Combine(frontposterPath, posterFileName);

							// 保存poster到後台
							Poster.SaveAs(imagesFolderPathPoster);

							// 從後台複製一份到 Front/Images/Poster
							File.Copy(imagesFolderPathPoster, imagesFolderFrontPathPoster, true);
						}
						else
						{
							// 处理无效的文件类型
							return false;
						}
					}

					if (Backdrop != null && Backdrop.ContentLength > 0)
					{
						if (IsValidImageFile(Backdrop))
						{
							backdropFileName = Path.GetRandomFileName() + Path.GetExtension(Backdrop.FileName);
							imagesFolderPathBackdrop = Path.Combine(backdropRootPath, backdropFileName);

							// 前台圖片的絕對路徑
							string imagesFolderFrontPathBackdrop = Path.Combine(frontbackdrop, backdropFileName);

							Backdrop.SaveAs(imagesFolderPathBackdrop);

							// 從後台複製一份到 Front/Images/Backdrop
							File.Copy(imagesFolderPathBackdrop, imagesFolderFrontPathBackdrop, true);
						}
						else
						{
							// 处理无效的文件类型
							return false;
						}
					}

					var db = new AppDbContext();

					string json = HttpContext.Current.Request.Form["MediaInfo"];
					JsonSerializerSettings settings = new JsonSerializerSettings
					{
						NullValueHandling = NullValueHandling.Ignore
					};

					FormDataModelVm vm = JsonConvert.DeserializeObject<FormDataModelVm>(json, settings);


					// 取得 imagesFolderPathPoster 的網站位置
					imagesFolderPathPoster = posterWebPath + "/" + posterFileName;
					imagesFolderPathBackdrop = backdropWebPath + "/" + backdropFileName;

					vm.PosterPath = imagesFolderPathPoster;
					vm.BackdropPath = imagesFolderPathBackdrop;

					MediaInfo entity = AutoMapperHelper.MapperObj.Map<MediaInfo>(vm);
					db.MediaInfos.Add(entity);
					db.SaveChanges();

					return true;
				}

				return false;
			}
			catch
			{
				// 处理异常
				// 可以记录错误日志或向用户提供适当的错误消息
				return false;
			}
		}

		private bool IsValidImageFile(HttpPostedFile file)
		{
			return true;
		}

		private bool EditRequest(int mediaInfoId)
		{

			// 檢查上傳的資料是否為空
			if (HttpContext.Current.Request.Form.Count == 0)
			{
				return false;
			}
			// 取得 MediaInfo 的資料

			string json = HttpContext.Current.Request.Form["MediaInfo"];

			// 自動繫結

			JsonSerializerSettings settings = new JsonSerializerSettings
			{
				NullValueHandling = NullValueHandling.Ignore
			};

			// 轉換成 FormDataModelVm
			FormDataModelVm vm = JsonConvert.DeserializeObject<FormDataModelVm>(json, settings);

			// 驗證 ModelState 是否有錯誤
			if (!ModelState.IsValid)
			{
				return false;
			}

			// 檢查是否有上傳檔案 (有上傳檔案才更新圖片)

			if (HttpContext.Current.Request.Form["PosterPath"] != null)
			{
				vm.PosterPath = HttpContext.Current.Request.Form["PosterPath"];
			}
			if(HttpContext.Current.Request.Form["BackdropPath"] != null)
			{
				vm.BackdropPath = HttpContext.Current.Request.Form["BackdropPath"];
			}

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
						//string posterWebPath = "~/Images/Poster";
						//string backdropWebdPath = "~/Images/Backdrop/";

						HttpPostedFile Poster = HttpContext.Current.Request.Files["Poster"];
						HttpPostedFile Backdrop = HttpContext.Current.Request.Files["Backdrop"];

						if(Poster != null)
						{
							// 取得檔案名稱
							string posterfileName = Path.GetRandomFileName() + Path.GetExtension(Poster.FileName);
							// 取得檔案絕對路徑
							string posterPath = Path.Combine(FileHelper.posterFullPath, posterfileName);
							// 刪除前台跟後台 原本的圖片
							string origPosterFiletPath = HttpContext.Current.Server.MapPath(mediaInfo.PosterPath);
							// 刪除後台圖片
							FileHelper.DeleteFile(origPosterFiletPath);
							// 刪除前台圖片
							FileHelper.DeleteFile(FileHelper.ReplaceFinalToFront(origPosterFiletPath));
							// 儲存 PosterPath 路徑到資料庫
							entity.PosterPath = FileHelper.GetFileWebPath(FileHelper.posterPath, posterfileName);
							// 後台保存 poster
							Poster.SaveAs(posterPath);
							// 前台從後台 複製一份 poster
							File.Copy(posterPath, FileHelper.ReplaceFinalToFront(posterPath), true);
						}
						if (Backdrop != null)
						{
							// 取得檔案名稱
							string backdropfileName = Path.GetRandomFileName() + Path.GetExtension(Backdrop.FileName);
							// 取得檔案絕對路徑
							string backdropPath = Path.Combine(FileHelper.backdropFullPath, backdropfileName);
							// 刪除前台跟後台 原本的圖片
							string origBackdropFiletPath = HttpContext.Current.Server.MapPath(mediaInfo.BackdropPath);
							// 刪除後台圖片
							FileHelper.DeleteFile(origBackdropFiletPath);
							// 刪除前台圖片
							FileHelper.DeleteFile(FileHelper.ReplaceFinalToFront(origBackdropFiletPath));
							// 儲存 BackdropPath 路徑到資料庫
							entity.BackdropPath = FileHelper.GetFileWebPath(FileHelper.backdropPath,backdropfileName);
							// 後台保存backdrop
							Backdrop.SaveAs(backdropPath);
							// 前台從後台 複製一份 backdrop
							File.Copy(backdropPath, FileHelper.ReplaceFinalToFront(backdropPath), true);
						}
					}
				}
				else
				{
					// 沒有上傳檔案就使用原本的圖片
					entity.PosterPath = mediaInfo.PosterPath;
					entity.BackdropPath = mediaInfo.BackdropPath;
				}

				mediaInfo.Title = entity.Title;
				mediaInfo.CategoryId = entity.CategoryId;
				mediaInfo.Adult = entity.Adult;
				mediaInfo.OriginalLanguageId = entity.OriginalLanguageId;
				mediaInfo.OriginalTitle = entity.OriginalTitle;
				mediaInfo.OverView = entity.OverView;
				mediaInfo.PosterPath = entity.PosterPath;
				mediaInfo.BackdropPath = entity.BackdropPath;

				// 設定 entity.MediaInfos_OttTypes_Rel 的 MediaInfoId 為 mediaInfo.Id
				foreach (var item in entity.MediaInfos_OttTypes_Rel)
				{
					item.MediaInfoId = mediaInfo.Id;
				}

				// 設定 entity.MediaInfos_Genres_Rel 的 MediaInfoId 為 mediaInfo.Id
				foreach (var item in entity.MediaInfos_Genres_Rel)
				{
					item.MediaInfoId = mediaInfo.Id;
				}

				// 更新 MediaInfo 資料
				// 移除 MediaInfos_Genres_Rel MediaIndo id資料
				// 移除 MediaInfos_OttTypes_Rel MediaIndo id資料

				db.MediaInfos_Genres_Rel.RemoveRange(mediaInfo.MediaInfos_Genres_Rel);

				db.MediaInfos_OttTypes_Rel.RemoveRange(mediaInfo.MediaInfos_OttTypes_Rel);

				db.MediaInfos_Genres_Rel.AddRange(entity.MediaInfos_Genres_Rel);

				db.MediaInfos_OttTypes_Rel.AddRange(entity.MediaInfos_OttTypes_Rel);

				db.SaveChanges();

				return true;
			}

			return false;
		}

		private bool DeleteRequest(int mediaInfoId)
		{
			var db = new AppDbContext();

			var mediaInfo = db.MediaInfos.Find(mediaInfoId);

			string posterWebPath = mediaInfo.PosterPath;
			string backdropWebdPath = mediaInfo.BackdropPath;

			// 檢查是否有找到 MediaInfo Id 的資料
			if (mediaInfo == null)
			{
				return false;
			}

			//db.MediaInfos.Remove(mediaInfo);

			// 取得 posterWebPath 的絕對路徑
			string posterFilePath = HttpContext.Current.Server.MapPath(posterWebPath);
			// 前台圖片的Poster絕對路徑
			string posterFileFrontPath = FileHelper.ReplaceFinalToFront(posterFilePath);
			// 取得 backdropWebdPath 的絕對路徑
			string backdropFilePath = HttpContext.Current.Server.MapPath(backdropWebdPath);
			// 前台圖片的Backdrop絕對路徑
			string backdropFileFrontPath = FileHelper.ReplaceFinalToFront(backdropFilePath);

			// 刪除後台圖片
			// 刪除 posterWebPath 的圖片
			if (File.Exists(posterFilePath))
			{
				File.Delete(posterFilePath);
			}

			// 刪除 backdropWebdPath 的圖片
			if (File.Exists(backdropFilePath))
			{
				File.Delete(backdropFilePath);
			}

			// 刪除前台圖片
			if (File.Exists(posterFileFrontPath))
			{
				File.Delete(posterFileFrontPath);
			}

			if (File.Exists(backdropFileFrontPath))
			{
				File.Delete(backdropFileFrontPath);
			}

			bool isDelete = new MediaInfoRepository().DeleteMediaInfo(mediaInfoId);

			if (!isDelete)
			{
				return false;
			}

			//db.SaveChanges();

			return true;
		}
	}
}
