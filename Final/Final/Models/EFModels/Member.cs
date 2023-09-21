namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Member
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Member()
        {
            ActivityPermissions = new HashSet<ActivityPermission>();
            FavoriteMedias = new HashSet<FavoriteMedia>();
            Members_SerialNumbers_Rel = new HashSet<Members_SerialNumbers_Rel>();
            Points = new HashSet<Point>();
            Ratings = new HashSet<Rating>();
            Vipitems = new HashSet<Vipitem>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Account { get; set; }

        [Required]
        [StringLength(50)]
        public string Password { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public DateTime BirthOfDate { get; set; }

        [Required]
        [StringLength(254)]
        public string Email { get; set; }

        public DateTime? VipEnddate { get; set; }

        public DateTime? BlacklistEnddate { get; set; }

        public bool? IsConfirmed { get; set; }

        [StringLength(50)]
        public string ConfirmedCode { get; set; }

        public DateTime CreatedTime { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ActivityPermission> ActivityPermissions { get; set; }

        public virtual Blacklist Blacklist { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FavoriteMedia> FavoriteMedias { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Members_SerialNumbers_Rel> Members_SerialNumbers_Rel { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Point> Points { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rating> Ratings { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Vipitem> Vipitems { get; set; }
    }
}
