using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using BookStore.Data;
using BookStore.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BookStore.Web.Pages
{
    public class SearchModel : PageModel
    {
        public SearchModel(BookStoreDbContext context)
        {
            this.Context = context;
            this.SearchResults = new List<SearchViewModel>();
        }

        public BookStoreDbContext Context { get; set; }

        public List<SearchViewModel> SearchResults { get; set; }

        [BindProperty(SupportsGet = true)]
        public string SearchTerm { get; set; }

        public void OnGet()
        {
            if (string.IsNullOrEmpty(this.SearchTerm))
            {
                return;
            }

            var foundAuthors = this.Context.Authors
                .Where(a => a.Name.Contains(this.SearchTerm))
                .OrderBy(a => a.Name)
                .Select(a => new SearchViewModel()
                {
                    SearchResult = a.Name,
                    Id = a.Id,
                    Type = "Author"
                })
                .ToList();

            var foundBooks = this.Context.Books
                .Where(b => b.Title.Contains(this.SearchTerm))
                .OrderBy(b => b.Title)
                .Select(b => new SearchViewModel()
                {
                    Id = b.Id,
                    SearchResult = b.Title,
                    Type = "Book"
                })
                .ToList();

            this.SearchResults.AddRange(foundAuthors);
            this.SearchResults.AddRange(foundBooks);

            foreach (var result in this.SearchResults)
            {
                string markedResult = Regex.Replace(
                    result.SearchResult,
                    $"({Regex.Escape(this.SearchTerm)})",
                    match => $"<strong class=\"text-danger\">{match.Groups[0].Value}</strong>",
                    RegexOptions.IgnoreCase | RegexOptions.Compiled);
                result.SearchResult = markedResult;
            }
        }
    }
}