using Project2.Models.EFModels;
using Project2.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static Project2.AutoMapperHelper;

namespace Project2.Controllers
{
    public class FAQsController : Controller
    {
		private AppDbContext db = new AppDbContext();

		// GET: FAQs
		public ActionResult Index()
		{
			List<FAQVm> vm = GetFAQ();
			return View(vm);
		}

		private List<FAQVm> GetFAQ()
		{
			var TEST = db.FAQs.ToList();
			return MapperObj.Map<List<FAQ>, List<FAQVm>>(db.FAQs.ToList());
		}

		public ActionResult FAQ()
		{
			var faqData = db.FAQs.ToList();

			var viewModel = faqData.Select(item => new FAQVm
			{
				Question = item.Question,
				Answer = item.Answer
			});

			return View(viewModel);
		}
	}
}