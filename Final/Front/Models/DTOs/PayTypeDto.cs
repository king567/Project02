using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Project2.Models.DTOs
{
    public class PayTypeDto
    {
        public int Id { get; set; }
        public string Type { get; set; }

        public int Fee { get; set; }

        public int DisplayOrder { get; set; }
    }
}