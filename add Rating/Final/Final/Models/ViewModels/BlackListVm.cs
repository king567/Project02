using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
    public class BlackListVm
    {
        public int Id { get; set; }

        public int UserId { get; set; }

        public int? BlacklistReasonId { get; set; }

        public DateTime BlacklistTime { get; set; }

        public DateTime NextRestorationTime { get; set; }

        public virtual BlacklistReason BlacklistReason { get; set; }

        public virtual User User { get; set; }
    }
}