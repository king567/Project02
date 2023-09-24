using AutoMapper;
using Final.Models.DTOs;
using Final.Models.EFModels;
using Final.Models.Entities;
using Final.Models.Repositories;
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

            //BlacklistReason 轉換成 BlacklistReasonVm
            CreateMap<BlacklistReason, BlacklistReasonVm>().ReverseMap();

            //PayType 轉換成 PayTypeVm
            CreateMap<PayType, PayTypeVm>().ReverseMap();

			//Member 轉換成 MemberVm
            CreateMap<Member, MemberVm>();

			//News 轉換成 NewsVm
			CreateMap<News, NewsVm>();

            //Vipitem 轉換成 VipItemDto
            CreateMap<Vipitem, VipItemDto>()
				.ForMember(dest => dest.MemberId, opt => opt.MapFrom(src => src.Member.Id))
				.ForMember(dest => dest.MemberAccount, opt => opt.MapFrom(src => src.Member.Account))
				.ForMember(dest => dest.PayTypeId, opt => opt.MapFrom(src => src.PayType.Id))
				.ForMember(dest => dest.Type, opt => opt.MapFrom(src => src.PayType.Type))
				.ForMember(dest => dest.Fee, opt => opt.MapFrom(src => src.PayType.Fee));

            //VipItemDto 轉換成 VipItemVm
            CreateMap<VipItemDto, VipItemVm>()
                .ForMember(dest => dest.MemberAccount, opt => opt.MapFrom(src => src.MemberAccount))
                .ForMember(dest => dest.Type, opt => opt.MapFrom(src => src.Type))
                .ForMember(dest => dest.Fee, opt => opt.MapFrom(src => src.Fee));

			// 這裡的寫法是為了讓 AutoMapper 知道要如何將 MediaInfo 轉換成 MediaInfosRelDTO
			// MediaInfosRelDTO 轉換成 MediaInfosRelVm

			CreateMap<MediaInfosRelDTO, MediaInfosRelVm>()
				.ForMember(dest => dest.CategoryId, opt => opt.MapFrom(src => src.CategoryId))
				.ForMember(dest => dest.CategoryName, opt => opt.MapFrom(src => src.CategoryName))
				.ForMember(dest => dest.LanguageCodeId, opt => opt.MapFrom(src => src.LanguageCodeId))
				.ForMember(dest => dest.OriginalLanguage, opt => opt.MapFrom(src => src.OriginalLanguage))
				.ForMember(dest => dest.Genres, opt => opt.MapFrom(src => src.Genres.Select(g => new GenresDTO
				{
					Id = g.Id,
					Name = g.Name
				}).ToList()))
				.ForMember(dest => dest.OttTypes, opt => opt.MapFrom(src => src.OttTypes.Select(o => new OttTypesDTO
				{
					Id = o.Id,
					Name = o.Name,
					ReleaseDate = o.ReleaseDate,
					RemovalDate = o.RemovalDate,
				}).ToList()));

			// 轉換 MediaInfos_OttTypes_Rel to MediaInfos_OttTypes_RelDTO 
			CreateMap<MediaInfos_OttTypes_Rel, MediaInfosOttTypesRelDTO>()
				.ForMember(
					dest => dest.OttTypeId, opt => opt.MapFrom(src => src.OttTypeId)
				)
				.ForMember(
					dest => dest.OttTypeName, opt => opt.MapFrom(src => src.OttType.Name)
				);

			// MediaInfo 轉換成 MediaInfosRelPageDTO 這個可以不用寫, 因為他們的欄位名稱都一樣
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


			// MediaInfo 轉換成 MediaInfosRelDTO
			CreateMap<MediaInfo, MediaInfosRelDTO>()
			.ForMember(dest => dest.CategoryId, opt => opt.MapFrom(src => src.Category.Id))
			.ForMember(dest => dest.CategoryName, opt => opt.MapFrom(src => src.Category.Name))
			.ForMember(dest => dest.OriginalLanguage, opt => opt.MapFrom(src => src.LanguageCode.LanguageName))
			.ForMember(dest => dest.LanguageCodeId, opt => opt.MapFrom(src => src.LanguageCode.Id))
			.ForMember(dest => dest.Genres, opt => opt.MapFrom(src => src.MediaInfos_Genres_Rel.Select(g => new GenresDTO
			{
				Id = g.GenreId,
				Name = g.Genre.Name
			}).ToList()))
			.ForMember(dest => dest.OttTypes, opt => opt.MapFrom(src => src.MediaInfos_OttTypes_Rel.Select(o => new OttTypesDTO
			{
				Id = o.OttTypeId,
				Name = o.OttType.Name,
				ReleaseDate = o.Release_Date,
				RemovalDate = o.Removal_Date,
			}).ToList()));

			// FormDataModelVm 轉換成 MediaInfo

			CreateMap<FormDataModelVm, MediaInfo>()
				.ForMember(dest => dest.CategoryId, opt => opt.MapFrom(src => src.CategoryId))
				.ForMember(dest => dest.OriginalLanguageId, opt => opt.MapFrom(src => src.LanguageCodeId))
				.ForMember(dest => dest.OriginalTitle, opt => opt.MapFrom(src => src.OriginalTitle))
				.ForMember(dest => dest.Adult, opt => opt.MapFrom(src => src.Adult))
				.ForMember(dest => dest.PosterPath, opt => opt.MapFrom(src => src.PosterPath))
				.ForMember(dest => dest.BackdropPath, opt => opt.MapFrom(src => src.BackdropPath))
				.ForMember(dest => dest.MediaInfos_Genres_Rel, opt => opt.MapFrom(src => src.Genres.Select(g => new MediaInfos_Genres_Rel
				{
					GenreId = g,
				}).ToList()))
				.ForMember(dest => dest.MediaInfos_OttTypes_Rel, opt => opt.MapFrom(src => src.OttItems.Select(o => new MediaInfos_OttTypes_Rel
				{
					OttTypeId = o.ottPlatform,
					Release_Date = o.releaseDate,
					Removal_Date = o.removeDate,
				}).ToList()));

			//FAQ 轉換成 FAQVm
			CreateMap<FAQ, FAQVm>().ReverseMap();
        }
	}
}