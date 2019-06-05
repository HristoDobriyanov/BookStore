using System;
using BookStore.Models;

namespace BookStore.Web.Models
{
    public class BookConciseViewModel
    {
        public int BookId { get; set; }

        public string Title { get; set; }

        public int AuthorId { get; set; }

        public string Author { get; set; }

        public static Func<Book, BookConciseViewModel> FromBook
        {
            get
            {
                return book => new BookConciseViewModel()
                {
                    Title = book.Title,
                    BookId = book.Id,
                    Author = book.Author.Name,
                    AuthorId = book.AuthorId
                };
            }
        }
    }
}
