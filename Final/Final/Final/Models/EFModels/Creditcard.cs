namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Creditcard
    {
        public int Id { get; set; }

        public int? MemberId { get; set; }

        [Required]
        [StringLength(16)]
        public string CardNumber { get; set; }

        [Required]
        [StringLength(3)]
        public string ThreeNumber { get; set; }

        [Required]
        [StringLength(20)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(20)]
        public string LastName { get; set; }
    }
}
