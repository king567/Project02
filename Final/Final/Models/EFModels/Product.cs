namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Product
    {
        public int Id { get; set; }

        public int ProductCategoryId { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public int Point { get; set; }

        public bool Enabled { get; set; }

        public int? Stock { get; set; }

        [StringLength(70)]
        public string PhotoImage { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }
    }
}
