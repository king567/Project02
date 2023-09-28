using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.DTOs
{
	public class CriteriaDTO
	{
		public int? Id { get; set; }
        public string Title { get; set; }
        public string OverView { get; set; }
        public int? CategoryId { get; set; }
        public List<int> Genres { get; set; }
        public List<int> Otts { get; set; }
        public DateTime? BeginTime { get; set; }
        public DateTime? EndTine { get; set; }
    }
}