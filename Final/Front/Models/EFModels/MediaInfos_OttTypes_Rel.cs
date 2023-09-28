namespace Project2.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MediaInfos_OttTypes_Rel
    {
        public int Id { get; set; }

        public int MediaInfoId { get; set; }

        public int OttTypeId { get; set; }

        public DateTime Release_Date { get; set; }

        public DateTime? Removal_Date { get; set; }

        public virtual MediaInfo MediaInfo { get; set; }

        public virtual OttType OttType { get; set; }
    }
}
