using System.Collections.Generic;
using System.Linq;
using BookStore.Data;
using BookStore.Web.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace BookStore.Web.Pages
{
    public class IndexModel : PageModel
    {
        public IndexModel(BookStoreDbContext context)
        {
            this.Context = context;
        }

        public BookStoreDbContext Context { get; set; }

        public IEnumerable<BookConciseViewModel> Books { get; set; }

        public void OnGet()
        {
            this.Books = this.Context.Books
                .Include(b => b.Author)
                .OrderBy(b => b.Title)
                .Select(BookConciseViewModel.FromBook)
                .ToList();
        }
    }
}
