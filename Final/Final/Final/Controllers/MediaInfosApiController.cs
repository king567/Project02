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

			string posterWebPath = mediaInfo.PosterPath;
			string backdropWebdPath = mediaInfo.BackdropPath;

			if (mediaInfo == null)
			{
				return NotFound();
			}

			db.MediaInfos.Remove(mediaInfo);

			string rootPath = HttpContext.Current.Server.MapPath("~");
			string parentDirectory = Path.GetDirectoryName(Path.GetDirectoryName(rootPath));

			string posterFilePath = parentDirectory + @"\\Images\\Poster\\" + posterWebPath;
			string backdropFilePath = parentDirectory + @"\\Images\\Backdrop\\" + backdropWebdPath;

			if (mediaInfo.PosterPath != null)
			{
				if (File.Exists(posterFilePath))
				{
					File.Delete(posterFilePath);
				}
			}
			if (mediaInfo.BackdropPath != null)
			{
				if (File.Exists(backdropFilePath))
				{
					File.Delete(backdropFilePath);
				}
			}

			db.SaveChanges();

			return Ok("刪除成功");
		}

		[HttpPost]
		[Route("api/MediaInfosApi/Edit")]
		public IHttpActionResult Edit(int id)
		{
			//var form = formData;
			//try
			//{
			//	// 从 formData 中提取表单字段值
			//	//var test = HttpContext.Current.Request.Form["OttItems"];

			//	// 执行编辑操作，这里是示例代码
			//	// 这里可以调用服务层或数据访问层来执行实际的编辑逻辑
			//	// EditMediaInfo(name, description);

			//	return Ok("更新成功");
			//}
			//catch (Exception ex)
			//{
			//	// 处理异常
			//	return BadRequest($"更新失败: {ex.Message}");
			//}
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

				string frontposterPath = "C:\\Users\\user\\Documents\\GitHub\\Project02\\Final\\Final\\Front\\Images\\Poster\\";
				string frontbackdrop = "C:\\Users\\user\\Documents\\GitHub\\Project02\\Final\\Final\\Front\\Images\\Backdrop\\";

				//if (!Directory.Exists(imagesFolderPathPoster))
				//{
				//	Directory.CreateDirectory(imagesFolderPathPoster);
				//}
				//if (!Directory.Exists(imagesFolderPathBackdrop))
				//{
				//	Directory.CreateDirectory(imagesFolderPathBackdrop);
				//}

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
							Poster.SaveAs(imagesFolderPathPoster);
							Poster.SaveAs(frontposterPath + posterFileName);
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
							Backdrop.SaveAs(imagesFolderPathBackdrop);
							Backdrop.SaveAs(frontbackdrop + backdropFileName);
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
			// 在此处实现文件类型检查逻辑
			// 例如，你可以检查文件扩展名或内容类型
			// 如果文件有效，返回 true，否则返回 false
			// 请根据你的需求实现这个方法
			return true;
		}

		private bool EditRequest(int mediaInfoId)
		{
			string json = HttpContext.Current.Request.Form["MediaInfo"];

			// 自動繫結

			FormDataModelVm vm = new FormDataModelVm();

			JsonSerializerSettings settings = new JsonSerializerSettings
			{
				NullValueHandling = NullValueHandling.Ignore
			};

			// 轉換成 FormDataModelVm
			vm = JsonConvert.DeserializeObject<FormDataModelVm>(json, settings);

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
						string posterWebPath = "~/Images/Poster";
						string backdropWebdPath = "~/Images/Backdrop/";

						HttpPostedFile Poster = HttpContext.Current.Request.Files["Poster"];
						HttpPostedFile Backdrop = HttpContext.Current.Request.Files["Backdrop"];

						if(Poster != null)
						{
							var posterfileName = Path.GetRandomFileName() + Path.GetExtension(Poster.FileName);
							var posterPath = Path.Combine(HttpContext.Current.Server.MapPath(posterWebPath), posterfileName);
							entity.PosterPath = posterfileName;
							// 保存poster
							Poster.SaveAs(posterPath);
						}
						if (Backdrop != null)
						{
							var backdropfileName = Path.GetRandomFileName() + Path.GetExtension(Backdrop.FileName);
							var backdropPath = Path.Combine(HttpContext.Current.Server.MapPath(backdropWebdPath), backdropfileName);

							entity.BackdropPath = backdropfileName;
							// 保存backdrop
							Backdrop.SaveAs(backdropPath);
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
	}
}
