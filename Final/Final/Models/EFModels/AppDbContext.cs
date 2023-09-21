using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Final.Models.EFModels
{
	public partial class AppDbContext : DbContext
	{
		public AppDbContext()
			: base("name=AppDbContext")
		{
		}

		public virtual DbSet<ActivityPermission> ActivityPermissions { get; set; }
		public virtual DbSet<BlacklistReason> BlacklistReasons { get; set; }
		public virtual DbSet<Blacklist> Blacklists { get; set; }
		public virtual DbSet<Category> Categories { get; set; }
		public virtual DbSet<Creditcard> Creditcards { get; set; }
		public virtual DbSet<FAQ> FAQs { get; set; }
		public virtual DbSet<FavoriteMedia> FavoriteMedias { get; set; }
		public virtual DbSet<Genre> Genres { get; set; }
		public virtual DbSet<GuestBook> GuestBooks { get; set; }
		public virtual DbSet<MediaInfo> MediaInfos { get; set; }
		public virtual DbSet<MediaInfos_Genres_Rel> MediaInfos_Genres_Rel { get; set; }
		public virtual DbSet<MediaInfos_OttTypes_Rel> MediaInfos_OttTypes_Rel { get; set; }
		public virtual DbSet<Member> Members { get; set; }
		public virtual DbSet<Members_SerialNumbers_Rel> Members_SerialNumbers_Rel { get; set; }
		public virtual DbSet<News> News { get; set; }
		public virtual DbSet<OttType> OttTypes { get; set; }
		public virtual DbSet<PayType> PayTypes { get; set; }
		public virtual DbSet<Point> Points { get; set; }
		public virtual DbSet<ProductCategory> ProductCategories { get; set; }
		public virtual DbSet<Product> Products { get; set; }
		public virtual DbSet<Rating> Ratings { get; set; }
		public virtual DbSet<SerialNumber> SerialNumbers { get; set; }
		public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
		public virtual DbSet<User> Users { get; set; }
		public virtual DbSet<Vipitem> Vipitems { get; set; }
		public virtual DbSet<VipPrize> VipPrizes { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<Category>()
				.HasOptional(e => e.Categories1)
				.WithRequired(e => e.Category1);

			modelBuilder.Entity<Creditcard>()
				.Property(e => e.CardNumber)
				.IsFixedLength();

			modelBuilder.Entity<Creditcard>()
				.Property(e => e.ThreeNumber)
				.IsFixedLength();

			modelBuilder.Entity<Genre>()
				.HasMany(e => e.MediaInfos_Genres_Rel)
				.WithRequired(e => e.Genre)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<MediaInfo>()
				.HasMany(e => e.FavoriteMedias)
				.WithRequired(e => e.MediaInfo)
				.HasForeignKey(e => e.MediaInformId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<MediaInfo>()
				.HasMany(e => e.Ratings)
				.WithRequired(e => e.MediaInfo)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<MediaInfo>()
				.HasMany(e => e.MediaInfos_Genres_Rel)
				.WithRequired(e => e.MediaInfo)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<MediaInfo>()
				.HasMany(e => e.MediaInfos_OttTypes_Rel)
				.WithRequired(e => e.MediaInfo)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.Password)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.ActivityPermissions)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasOptional(e => e.Blacklist)
				.WithRequired(e => e.Member);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.FavoriteMedias)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.Members_SerialNumbers_Rel)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.Points)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.Vipitems)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<OttType>()
				.HasMany(e => e.MediaInfos_OttTypes_Rel)
				.WithRequired(e => e.OttType)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<ProductCategory>()
				.HasMany(e => e.Products)
				.WithRequired(e => e.ProductCategory)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<SerialNumber>()
				.HasOptional(e => e.Members_SerialNumbers_Rel)
				.WithRequired(e => e.SerialNumber);

			modelBuilder.Entity<User>()
				.Property(e => e.Password)
				.IsUnicode(false);

			modelBuilder.Entity<User>()
				.HasMany(e => e.News)
				.WithRequired(e => e.User)
				.HasForeignKey(e => e.UsersId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<VipPrize>()
				.HasMany(e => e.ActivityPermissions)
				.WithRequired(e => e.VipPrize)
				.WillCascadeOnDelete(false);
		}
	}
}
