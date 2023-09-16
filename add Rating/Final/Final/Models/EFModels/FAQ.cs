namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class FAQ
    {
        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Question { get; set; }

        [Required]
        public string Answer { get; set; }

        public bool Enabled { get; set; }

        public int DisplayOrder { get; set; }
    }
}
