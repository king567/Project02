namespace Final.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ActivityPermission
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public int VipPrizeId { get; set; }

        public DateTime JoinDate { get; set; }

        public virtual Member Member { get; set; }

        public virtual VipPrize VipPrize { get; set; }
    }
}
