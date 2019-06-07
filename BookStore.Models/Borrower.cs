using System.Collections.Generic;

namespace BookStore.Models
{
    public class Borrower
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Address { get; set; }

        public ICollection<BorrowedBooks> BorrowedBooks { get; set; }
    }
}
