namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Members_SerialNumbers_Rel
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public int SerialNumberId { get; set; }

        public virtual Member Member { get; set; }

        public virtual SerialNumber SerialNumber { get; set; }
    }
}
