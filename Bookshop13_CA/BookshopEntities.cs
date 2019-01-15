namespace Bookshop13_CA
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class BookshopEntities : DbContext
    {
        public BookshopEntities()
            : base("name=Model1")
        {
        }

        public virtual DbSet<Book> Book { get; set; }
        public virtual DbSet<Cart> Cart { get; set; }
        public virtual DbSet<Category> Category { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Book>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<Book>()
                .Property(e => e.ISBN)
                .IsUnicode(false);

            modelBuilder.Entity<Book>()
                .Property(e => e.Author)
                .IsUnicode(false);

            modelBuilder.Entity<Book>()
                .Property(e => e.show)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Cart>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<Cart>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<Cart>()
                .Property(e => e.ISBN)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Book)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Category>()
                .HasOptional(e => e.Category1)
                .WithRequired(e => e.Category2);

            modelBuilder.Entity<Category>()
                .HasOptional(e => e.Category11)
                .WithRequired(e => e.Category3);
        }
    }
}
