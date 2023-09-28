namespace Project2.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Rating
    {
        public int Id { get; set; }

        public int MediaInfoId { get; set; }

        public int? MemberId { get; set; }

        [StringLength(500)]
        public string Comment { get; set; }

        public int? Rate { get; set; }

        public DateTime? CreatedTime { get; set; }

        public virtual MediaInfo MediaInfo { get; set; }

        public virtual Member Member { get; set; }
    }
}
