using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final.Models.DTOs
{
	public class GenresDTO
	{
		public int Id { get; set; }

		[Required]
		[StringLength(150)]
		public string Name { get; set; }
	}
}