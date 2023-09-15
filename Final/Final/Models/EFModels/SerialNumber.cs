namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SerialNumber
    {
        public int Id { get; set; }

        public int? ProductId { get; set; }

        [Column("SerialNumber")]
        [Required]
        [StringLength(50)]
        public string SerialNumber1 { get; set; }

        public DateTime ExpirationDate { get; set; }

        public virtual Members_SerialNumbers_Rel Members_SerialNumbers_Rel { get; set; }
    }
}
