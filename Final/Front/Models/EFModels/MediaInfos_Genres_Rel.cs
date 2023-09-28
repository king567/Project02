namespace Project2.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MediaInfos_Genres_Rel
    {
        public int Id { get; set; }

        public int MediaInfoId { get; set; }

        public int GenreId { get; set; }

        public virtual Genre Genre { get; set; }

        public virtual MediaInfo MediaInfo { get; set; }
    }
}
