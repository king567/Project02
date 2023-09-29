using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.DTOs
{
    public class VipItemDto
    {
        public int Id { get; set; }

        public int MemberId { get; set; }
        public string MemberName { get; set; }
        public string MemberAccount { get; set; } 
        public int PayTypeId { get; set; }
        public string Type { get; set; }
        public int Fee { get; set; }

        public DateTime PaymentDate { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime ExpiryDate { get; set; }

        public bool Status { get; set; }
    }
}