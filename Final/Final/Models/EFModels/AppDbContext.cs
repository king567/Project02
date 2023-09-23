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
        public virtual DbSet<News> News { get; set; }
        public virtual DbSet<OttType> OttTypes { get; set; }
        public virtual DbSet<PayType> PayTypes { get; set; }
        public virtual DbSet<Rating> Ratings { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Vipitem> Vipitems { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BlacklistReason>()
                .HasMany(e => e.Blacklists)
                .WithOptional(e => e.BlacklistReason)
                .WillCascadeOnDelete();

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

            modelBuilder.Entity<Member>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Member>()
                .HasOptional(e => e.Blacklist)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Member>()
                .HasMany(e => e.FavoriteMedias)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<OttType>()
                .HasMany(e => e.MediaInfos_OttTypes_Rel)
                .WithRequired(e => e.OttType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);
        }
    }
}
