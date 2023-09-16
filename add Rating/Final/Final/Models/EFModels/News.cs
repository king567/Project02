namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class News
    {
        public int Id { get; set; }

        [Required]
        [StringLength(30)]
        public string Title { get; set; }

        [Required]
        public string Description { get; set; }

        [Column(TypeName = "date")]
        public DateTime Publishdate { get; set; }

        public int UsersId { get; set; }

        public virtual User User { get; set; }
    }
}
