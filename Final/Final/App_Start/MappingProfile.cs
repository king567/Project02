using AutoMapper;
using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Entities;
using Final.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.App_Start
{
	public class MappingProfile : Profile
	{
		public MappingProfile()
		{
			// 可以二個方向都寫, 但也可以直接用 ReverseMap() 來反轉,表示二個方向都要做
			CreateMap<BlacklistReason, BlacklistReasonVm>().ReverseMap();
			CreateMap<PayType, PayTypeVm>().ReverseMap();
            CreateMap<Member, MemberVm>();

            // 這裡的寫法是為了讓 AutoMapper 知道要如何將 MediaInfo 轉換成 MediaInfosRelDTO
            CreateMap<MediaInfo, MediaInfosRelDTO>()
			.ForMember(
				dest => dest.GenreId, opt => opt.MapFrom(src => src.MediaInfos_Genres_Rel.Select(rel => rel.GenreId))
			)
			.ForMember(
				dest => dest.OttTypeId, opt => opt.MapFrom(src => src.MediaInfos_OttTypes_Rel.Select(rel => rel.OttTypeId))
			);

			// MediaInfosRelDTO 轉換成 MediaInfosRelVm
			CreateMap<MediaInfosRelDTO, MediaInfosRelVm>().ReverseMap();

			// 轉換 MediaInfos_OttTypes_Rel to MediaInfos_OttTypes_RelDTO
			CreateMap<MediaInfos_OttTypes_Rel, MediaInfosOttTypesRelDTO>()
				.ForMember(
					dest => dest.OttTypeId, opt => opt.MapFrom(src => src.OttTypeId)
				)
				.ForMember(
					dest => dest.OttTypeName, opt => opt.MapFrom(src => src.OttType.Name)
				);

			// MediaInfo 轉換成 MediaInfosRelPageDTO
			CreateMap<MediaInfo, MediaInfosRelPageDTO>()
			.ForMember(dest => dest.CategoryId, opt => opt.MapFrom(src => src.Category.Id))
			.ForMember(dest => dest.CategoryName, opt => opt.MapFrom(src => src.Category.Name))
			.ForMember(dest => dest.Genre, opt => opt.MapFrom(src => src.MediaInfos_Genres_Rel.Select(g => new GenresDTO
			{
				Id = g.GenreId,
				Name = g.Genre.Name
			}).ToList()))
			.ForMember(dest => dest.OttType, opt => opt.MapFrom(src => src.MediaInfos_OttTypes_Rel.Select(o => new OttTypesDTO
			{
				Id = o.OttTypeId,
				Name = o.OttType.Name,
				ReleaseDate = o.Release_Date,
				RemovalDate = o.Removal_Date,
			}).ToList()));
			

			//CreateMap<MediaInfo, MediaInfosRelPageDTO>()
			//.ForMember(dest => dest.CategoryId, opt => opt.MapFrom(src => src.Category.Id))
			//.ForMember(dest => dest.Genre, opt => opt.MapFrom(src => src.MediaInfos_Genres_Rel.Select(g => new GenresDTO
			//{
			//	Id = g.GenreId,
			//	Name = g.Genre.Name
			//}).ToList()));
			////.ForMember(dest => dest.OttType, opt => opt.MapFrom(src => src.MediaInfos_OttTypes_Rel.Select(o => new OttTypesDTO
			////{
			////	Id = o.OttTypeId,
			////	Name = o.OttType.Name,
			////	ReleaseDate = o.Release_Date,
			////	RemovalDate = o.Removal_Date,
			////}).ToList()));
		}
	}
}