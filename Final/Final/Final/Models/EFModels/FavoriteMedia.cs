namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class FavoriteMedia
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public int MediaInformId { get; set; }

        public virtual MediaInfo MediaInfo { get; set; }

        public virtual Member Member { get; set; }
    }
}
