﻿using AutoMapper;
using Final.Models.DTOs;
using Project2.Models.EFModels;
using Final.Models.Repositories;
using Final.Models.ViewModels;
using Project2.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using Project2.Models.DTOs;

namespace Project2.App_Start
{
	public class MappingProfile : Profile
	{
		public MappingProfile()
		{
			// FavoriteMedia 轉換成 FavoriteMediaDTO
			CreateMap<FavoriteMedia, FavoriteMediaDTO>()
				.ForMember(dest => dest.MediaInfoId, opt => opt.MapFrom(src => src.MediaInformId))
				.ForMember(dest => dest.MemberId, opt => opt.MapFrom(src => src.MemberId));

			// FavoriteMediaDTO 轉換成 FavoriteMediaVm
			CreateMap<FavoriteMediaDTO, FavoriteMediaVm>()
				.ForMember(dest => dest.MediaInfoId, opt => opt.MapFrom(src => src.MediaInfoId))
				.ForMember(dest => dest.MemberId, opt => opt.MapFrom(src => src.MemberId));

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
				.ForMember(dest => dest.OttTypes, opt => opt.MapFrom(src => src.OttTypes.Select(o => new OttTypesRelDTO
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
			.ForMember(dest => dest.OttType, opt => opt.MapFrom(src => src.MediaInfos_OttTypes_Rel.Select(o => new OttTypesRelDTO
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
			.ForMember(dest => dest.OttTypes, opt => opt.MapFrom(src => src.MediaInfos_OttTypes_Rel.Select(o => new OttTypesRelDTO
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

			// Genre 轉換成 GenresDTO
			CreateMap<Genre, GenresDTO>()
				.ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
				.ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name));

			// GenreDTO 轉換成 GenresVm
			CreateMap<GenresDTO, GenresVm>()
				.ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
				.ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name));

			// OttType 轉換成 OttTypesDTO
			CreateMap<OttType, OttTypesDTO>()
				.ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
				.ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name)).ReverseMap();

			// OttTypesDTO 轉換成 OttTypesVm
			CreateMap<OttTypesDTO, OttTypesVm>()
				.ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
				.ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name)).ReverseMap();

			// Category 轉換成 CategoryDTO
			CreateMap<Category, CategoryDTO>()
				.ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
				.ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name)).ReverseMap();

			// CategoryDTO 轉換成 CategoryVm
			CreateMap<CategoryDTO, CategoryVm>()
				.ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
				.ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name)).ReverseMap();

            //會員中心的 Member 轉成  MemberVm
            CreateMap<Member, MemberVm>().ReverseMap();

            //會員中心的 Vipitem 轉成  VipitemVm
            CreateMap<Vipitem, VipitemVm>()
                .ForMember(dest => dest.PaytypeId, opt => opt.MapFrom(src => src.PayTypeId))
                .ForMember(dest => dest.Type, opt => opt.MapFrom(src => src.PayType.Type))
                .ForMember(dest => dest.Fee, opt => opt.MapFrom(src => src.PayType.Fee))
                .ForMember(dest => dest.CreditcardId, opt => opt.MapFrom(src => src.CreditcardId))
                .ForMember(dest => dest.CardNumber, opt => opt.MapFrom(src => src.Creditcard.CardNumber));

            //會員中心的 Blacklist 轉成  BlacklistVm
            CreateMap<Blacklist, BlacklistVm>()
                .ForMember(dest => dest.BlacklistReasonId, opt => opt.MapFrom(src => src.BlacklistReasonId))
                .ForMember(dest => dest.BlacklistReason, opt => opt.MapFrom(src => src.BlacklistReason.Reason));

            //會員中心的 VipitemVm 轉成  MemberCenterVm
            CreateMap<List<VipitemVm>, MemberCenterVm>()
                .ForMember(dest => dest.Vipitem, opt => opt.MapFrom(src => src));

            //會員中心的 BlacklistVm 轉成  MemberCenterVm
            CreateMap<BlacklistVm, MemberCenterVm>()
                .ForMember(dest => dest.Blacklist, opt => opt.MapFrom(src => src));

            //會員中心的 MemberVm 轉成  MemberCenterVm
            CreateMap<MemberVm, MemberCenterVm>()
                .ForMember(dest => dest.Member, opt => opt.MapFrom(src => src));

            // Creditcard 轉換成 CreditCardVm
            CreateMap<List<Creditcard>, List<CreditCardVm>>();

			//FAQ轉換成FAQVm
			CreateMap<FAQ, FAQVm>()
				.ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
				.ForMember(dest => dest.Question, opt => opt.MapFrom(src => src.Question))
				.ForMember(dest => dest.Answer, opt => opt.MapFrom(src => src.Answer));

            // Vipitem 轉成  VipitemDto
            CreateMap<Vipitem, VipItemDto>().ReverseMap();

            // VipitemDto 轉成  VipitemVm
            CreateMap<VipItemDto, VipitemVm>().ReverseMap();

            // PayType 轉成  PayTypeDto
            CreateMap<PayType, PayTypeDto>().ReverseMap();

            // News 轉換成 NewsDto
            CreateMap<News, NewsDto>().ReverseMap();

            // NewsDto 轉換成 NewsVm
            CreateMap<NewsDto, NewsVm>().ReverseMap();

            // News 轉換成 NewsVm
            CreateMap<News, NewsVm>().ReverseMap();
        }
	}
}