using System.Security.Principal;
using BookStore.Models;
using Microsoft.EntityFrameworkCore;

namespace BookStore.Data
{
    public class BookStoreDbContext : DbContext
    {
        public BookStoreDbContext(DbContextOptions options) : base(options)
        {
            
        }

        public DbSet<Author> Authors { get; set; }

        public DbSet<Book> Books { get; set; }

        public DbSet<Borrower> Borrowers { get; set; }

        public DbSet<BorrowedBooks> BorrowedBooks { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Book>()
                .HasMany(book => book.Borrowers)
                .WithOne(borrower => borrower.Book)
                .HasForeignKey(b => b.BookId);

            modelBuilder.Entity<Borrower>()
                .HasMany(borrower => borrower.BorrowedBooks)
                .WithOne(book => book.Borrower)
                .HasForeignKey(b => b.BorrowerId);

            modelBuilder.Entity<BorrowedBooks>()
                .HasKey(b => new {b.BookId, b.BorrowerId});

            base.OnModelCreating(modelBuilder);
        }
    }
}
