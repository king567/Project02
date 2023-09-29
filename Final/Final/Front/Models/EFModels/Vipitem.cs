namespace Project2.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Vipitem
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public int PayTypeId { get; set; }

        public int CreditcardId { get; set; }

        public DateTime PaymentDate { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime ExpiryDate { get; set; }

        public virtual Creditcard Creditcard { get; set; }

        public virtual Member Member { get; set; }

        public virtual PayType PayType { get; set; }
    }
}
