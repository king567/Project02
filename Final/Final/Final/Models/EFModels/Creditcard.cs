namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Creditcard
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Creditcard()
        {
            Vipitems = new HashSet<Vipitem>();
        }

        public int Id { get; set; }

        public int MemberId { get; set; }

        [Required]
        [StringLength(16)]
        public string CardNumber { get; set; }

        [Required]
        [StringLength(3)]
        public string ThreeNumber { get; set; }

        [Required]
        [StringLength(7)]
        public string ExpireDate { get; set; }

        [Required]
        [StringLength(20)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(20)]
        public string LastName { get; set; }

        public virtual Member Member { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Vipitem> Vipitems { get; set; }
    }
}
