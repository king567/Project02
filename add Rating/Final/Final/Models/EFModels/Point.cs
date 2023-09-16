namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Point
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        [Column("Point")]
        public int Point1 { get; set; }

        public int Usedpoint { get; set; }

        public DateTime UsedDate { get; set; }

        public DateTime ExpiredDate { get; set; }

        public virtual Member Member { get; set; }
    }
}
