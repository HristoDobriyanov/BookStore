using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using BookStore.Data;
using BookStore.Models;
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
            this.Borrowers = new List<SelectListItem>();
            this.StartDate= DateTime.Now;
        }



        public BookStoreDbContext Context { get; set; }

        public IEnumerable<SelectListItem> Borrowers { get; set; }

        [BindProperty]
        [Required]
        [Display(Name = "Borrower")]
        public int BorrowerId { get; set; }

        [BindProperty]
        [DataType(DataType.Date)]
        [Required]
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

        public void OnPost()
        {
            if (!ModelState.IsValid)
            {
                return;
            }

            var borrower = this.Context.Borrowers.Find(this.BorrowerId);
            var bookId = Convert.ToInt32(this.RouteData.Values["Id"]);
            var book = this.Context.Books.Find(bookId);

            if (borrower ==null || book == null)
            {
                return;
            }

            var borrowedBook = new BorrowedBooks()
            {
                BookId = book.Id,
                BorrowerId = borrower.Id,
                StartDate = this.StartDate,
                EndDate = this.EndDate
            };

            this.Context.BorrowedBooks.Add(borrowedBook);
            this.Context.SaveChanges();
        }
    }
}