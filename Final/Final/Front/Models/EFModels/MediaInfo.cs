namespace Project2.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MediaInfos")]
    public partial class MediaInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MediaInfo()
        {
            FavoriteMedias = new HashSet<FavoriteMedia>();
            Ratings = new HashSet<Rating>();
            MediaInfos_Genres_Rel = new HashSet<MediaInfos_Genres_Rel>();
            MediaInfos_OttTypes_Rel = new HashSet<MediaInfos_OttTypes_Rel>();
        }

        public int Id { get; set; }

        public int? CategoryId { get; set; }

        [StringLength(150)]
        public string Title { get; set; }

        public string OverView { get; set; }

        public bool? Adult { get; set; }

        public int? OriginalLanguageId { get; set; }

        [StringLength(255)]
        public string OriginalTitle { get; set; }

        [StringLength(255)]
        public string BackdropPath { get; set; }

        [StringLength(50)]
        public string PosterPath { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FavoriteMedia> FavoriteMedias { get; set; }

        public virtual LanguageCode LanguageCode { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rating> Ratings { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MediaInfos_Genres_Rel> MediaInfos_Genres_Rel { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MediaInfos_OttTypes_Rel> MediaInfos_OttTypes_Rel { get; set; }
    }
}
