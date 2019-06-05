using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BookStore.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace BookStore.Web.Pages.Books
{
    public class DetailsModel : PageModel
    {
        public DetailsModel(BookStoreDbContext context)
        {
            this.Context = context;
        }

        public BookStoreDbContext Context { get; set; }

        public string Title { get; set; }

        public string Author { get; set; }

        public string ImageUrl { get; set; }

        public string Description { get; set; }


        public IActionResult OnGet(int id)
        {
            var book = this.Context.Books
                .Include(b => b.Author)
                .FirstOrDefault(b => b.Id == id);
            if (book == null)
            {
                return this.NotFound();
            }

            this.Title = book.Title;
            this.Description = book.Description;
            this.ImageUrl = book.CoverImage;
            this.Author = book.Author.Name;

            return this.Page();
        }
    }
}