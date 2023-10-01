using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Final.Models.Infra
{
	public class FileHelper
	{
		// 後台封面圖片路徑
		public static string posterPath = "/Images/Poster";
		// 後台背景圖片路徑
		public static string backdropPath = "/Images/Backdrop";
		// 後台圖片的Poster絕對路徑
		public static string posterFullPath = HttpContext.Current.Server.MapPath(posterPath);
		// 後台圖片的Backdrop絕對路徑
		public static string backdropFullPath = HttpContext.Current.Server.MapPath(backdropPath);
		// 前台圖片的Poster絕對路徑
		public static string frontPosterFullPath = ReplaceFinalToFront(posterFullPath);
		// 前台圖片的Backdrop絕對路徑
		public static string frontBackdropFullPath = ReplaceFinalToFront(backdropFullPath);

		// 替換Final為Front，並回傳絕對路徑
		public static string ReplaceFinalToFront(string path)
		{
			return path.Replace("Final\\Images", "Front\\Images");
		}

		public static string GetFileWebPath(string dirPath,string fileName)
		{
			return dirPath + "/" + fileName;
		}

		// 檢查檔案是否存在
		public static bool IsFileExists(string path)
		{
			return System.IO.File.Exists(path);
		}
		// 檢查資料夾是否存在
		public static bool IsDirectoryExists(string path)
		{
			return System.IO.Directory.Exists(path);
		}
		// 建立資料夾
		public static void CreateDirectory(string path)
		{
			System.IO.Directory.CreateDirectory(path);
		}
		// 檢查資料夾是否存在，不存在就建立
		public static void CheckDirectory(string path)
		{
			if (!IsDirectoryExists(path))
			{
				CreateDirectory(path);
			}
		}
		// 刪除檔案
		public static void DeleteFile(string path)
		{
			if (IsFileExists(path))
			{
				System.IO.File.Delete(path);
			}
		}

		public static void SaveAndCopyFiles(HttpPostedFile file, string basePath, string originalPath, ref string filePath)
		{
			if (file != null)
			{
				// 取得檔案名稱
				string fileName = Path.GetRandomFileName() + Path.GetExtension(file.FileName);
				// 取得檔案絕對路徑
				string fullPath = Path.Combine(basePath, fileName);
				// 刪除前台跟後台原本的圖片
				string origFilePath = HttpContext.Current.Server.MapPath(originalPath);
				// 刪除後台圖片
				FileHelper.DeleteFile(origFilePath);
				// 刪除前台圖片
				FileHelper.DeleteFile(FileHelper.ReplaceFinalToFront(origFilePath));
				// 儲存檔案路徑到資料庫
				filePath = fullPath;
				// 後台保存檔案
				file.SaveAs(fullPath);
				// 前台從後台複製一份檔案
				File.Copy(fullPath, FileHelper.ReplaceFinalToFront(fullPath), true);
			}
		}
	}
}