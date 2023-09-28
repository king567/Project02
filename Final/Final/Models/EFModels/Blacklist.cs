namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Blacklist
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int? UserId { get; set; }

        public int BlacklistReasonId { get; set; }

        public DateTime BlacklistTime { get; set; }

        public DateTime NextRestorationTime { get; set; }

        public virtual BlacklistReason BlacklistReason { get; set; }

        public virtual Member Member { get; set; }

        public virtual User User { get; set; }
    }
}
