namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class LanguageCode
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LanguageCode()
        {
            MediaInfos = new HashSet<MediaInfo>();
        }

        public int Id { get; set; }

        [StringLength(10)]
        public string ISOCode { get; set; }

        [StringLength(50)]
        public string LanguageName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MediaInfo> MediaInfos { get; set; }
    }
}
