using Final.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final.Models.Entities
{
	public class OttTypesEntity
	{

		public int Id { get; set; }

		[Required]
		[StringLength(150)]
		public string Name { get; set; }

		public int DisplayOrder { get; set; }

        public DateTime ReleaseDate { get; set; }
        public DateTime? RemovalDate { get; set; }

        //public MediaInfosOttTypesRelEntity MediaInfos_OttTypes_Rel { get; set; }
    }
}