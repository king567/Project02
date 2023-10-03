using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Final.Models.DTOs
{
    public class RatingsRelDTO
    {
        public int Id { get; set; }
        public int CategoryId { get; set; }
        //public int MediaInfoId { get; set; }
        public string MediaInfoTitle { get; set; }

        public string MemberAccount { get; set; }
        public int Rate { get; set; }

        public string Comment { get; set; }

        public DateTime CreatedTime { get; set; }
    }

}