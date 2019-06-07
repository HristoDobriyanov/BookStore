using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using BookStore.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace BookStore.Web.Pages.Books
{
    public class BorrowModel : PageModel
    {
        public BorrowModel(BookStoreDbContext context)
        {
            this.Context = context;
        }



        public BookStoreDbContext Context { get; set; }

        public IEnumerable<SelectListItem> Borrowers { get; set; }

        [BindProperty]
        public int BorrowerId { get; set; }

        [BindProperty]
        [DataType(DataType.Date)]
        public DateTime StartDate { get; set; }

        [BindProperty]
        [DataType(DataType.Date)]
        public DateTime? EndDate { get; set; }


        public void OnGet()
        {
            this.Borrowers = this.Context.Borrowers
                .Select(b => new SelectListItem()
                {
                    Text = b.Name,
                    Value = b.Id.ToString()
                })
                .ToList();
        }
    }
}