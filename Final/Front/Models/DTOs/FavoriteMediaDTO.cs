using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Project2.Models.DTOs
{
	public class FavoriteMediaDTO
	{
        [Required]
        public int MediaInfoId { get; set; }
		[Required]
		public int MemberId { get; set; }
    }
}