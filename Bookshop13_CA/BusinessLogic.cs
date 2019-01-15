using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bookshop13_CA
{
    public class BusinessLogic
    {
        //Create a new class to show detailed search results
        public static List<SelectedBooks> ShowBySearch(string catalogue, string text)
        {
            List<SelectedBooks> result = new List<SelectedBooks>();
            using (BookshopEntities entities = new BookshopEntities())
            {
                switch (catalogue)
                {
                    case "Full Catalogue":
                        var fc = from x in entities.Book
                                 join y in entities.Category on x.CategoryID equals y.CategoryID
                                 where x.Title.Contains(text) || x.Author.Contains(text) || y.Name.Contains(text) || x.ISBN.Contains(text)
                                 select new { x.Title, x.Author, x.ISBN, x.Stock, CategoryName = y.Name, x.Price, x.Discount };
                        foreach (var item in fc)
                        {
                            SelectedBooks sb = new SelectedBooks();
                            sb.Title = item.Title;
                            sb.Author = item.Author;
                            sb.ISBN = item.ISBN;
                            sb.Stock = item.Stock;
                            sb.CategoryName = item.CategoryName;
                            sb.Price = item.Price;
                            sb.DiscountPrice = decimal.Round((Decimal)(item.Price * (1 - (Decimal)(item.Discount)/100)), 2);
                            sb.ShowOriginalPrice = (item.Discount != 0);
                            result.Add(sb);
                        }
                        break;

                    case "Book Title":
                        var bt = from x in entities.Book
                                 join y in entities.Category on x.CategoryID equals y.CategoryID
                                 where x.Title.Contains(text)
                                 select new { x.Title, x.Author, x.ISBN, x.Stock, CategoryName = y.Name, x.Price, x.Discount };
                        foreach (var item in bt)
                        {
                            SelectedBooks sb = new SelectedBooks();
                            sb.Title = item.Title;
                            sb.Author = item.Author;
                            sb.ISBN = item.ISBN;
                            sb.Stock = item.Stock;
                            sb.CategoryName = item.CategoryName;
                            sb.Price = item.Price;
                            sb.DiscountPrice = decimal.Round((Decimal)(item.Price * (1 - (Decimal)(item.Discount) / 100)), 2);
                            result.Add(sb);
                        }
                        break;

                    case "Author":
                        var a = from x in entities.Book
                                join y in entities.Category on x.CategoryID equals y.CategoryID
                                where x.Author.Contains(text)
                                select new { x.Title, x.Author, x.ISBN, x.Stock, CategoryName = y.Name, x.Price, x.Discount };
                        foreach (var item in a)
                        {
                            SelectedBooks sb = new SelectedBooks();
                            sb.Title = item.Title;
                            sb.Author = item.Author;
                            sb.ISBN = item.ISBN;
                            sb.Stock = item.Stock;
                            sb.CategoryName = item.CategoryName;
                            sb.Price = item.Price;
                            sb.DiscountPrice = decimal.Round((Decimal)(item.Price * (1 - (Decimal)(item.Discount) / 100)), 2);
                            result.Add(sb);
                        }
                        break;

                    case "Category":
                        var c = from x in entities.Book
                                join y in entities.Category on x.CategoryID equals y.CategoryID
                                where y.Name.Contains(text)
                                select new { x.Title, x.Author, x.ISBN, x.Stock, CategoryName = y.Name, x.Price, x.Discount };
                        foreach (var item in c)
                        {
                            SelectedBooks sb = new SelectedBooks();
                            sb.Title = item.Title;
                            sb.Author = item.Author;
                            sb.ISBN = item.ISBN;
                            sb.Stock = item.Stock;
                            sb.CategoryName = item.CategoryName;
                            sb.Price = item.Price;
                            sb.DiscountPrice = decimal.Round((Decimal)(item.Price * (1 - (Decimal)(item.Discount) / 100)), 2);
                            result.Add(sb);
                        }
                        break;

                    case "ISBN":
                        var isbn = from x in entities.Book
                                   join y in entities.Category on x.CategoryID equals y.CategoryID
                                   where x.ISBN.Contains(text)
                                   select new { x.Title, x.Author, x.ISBN, x.Stock, CategoryName = y.Name, x.Price, x.Discount };
                        foreach (var item in isbn)
                        {
                            SelectedBooks sb = new SelectedBooks();
                            sb.Title = item.Title;
                            sb.Author = item.Author;
                            sb.ISBN = item.ISBN;
                            sb.Stock = item.Stock;
                            sb.CategoryName = item.CategoryName;
                            sb.Price = item.Price;
                            sb.DiscountPrice = decimal.Round((Decimal)(item.Price * (1 - (Decimal)(item.Discount) / 100)), 2);
                            result.Add(sb);
                        }
                        break;
                }
                return result;
            }
        }

        //Create a new class to show items details in cart
        public static List<CartItem> ShowCartItem(string user)
        {
            List<CartItem> result = new List<CartItem>();
            using (BookshopEntities entities = new BookshopEntities())
            {
                var q = from x in entities.Cart
                        join y in entities.Book on x.ISBN equals y.ISBN
                        where x.Status == "Unpaid" && x.Username == user
                        select new { x.Title, y.Author, x.ISBN, y.Price, y.Discount, x.Quantity, x.Username };

                foreach (var item in q)
                {
                    CartItem ci = new CartItem();
                    ci.Username = item.Username;
                    ci.Title = item.Title;
                    ci.Author = item.Author;
                    ci.ISBN = item.ISBN;
                    ci.DiscountPrice = decimal.Round((Decimal)(item.Price * (1 - (Decimal)(item.Discount) / 100)), 2);
                    ci.Quantity = item.Quantity;
                    result.Add(ci);
                }
            }
            return result;
        }


        BookshopEntities booksmodel = new BookshopEntities();
        public int CartItemId { get; set; }

        public List<Book> GetAllBooks()
        {
            return booksmodel.Book.ToList<Book>();
        }

        public Book GetBook(string isbn)
        {

            return booksmodel.Book.Where
                    (b => b.ISBN == isbn).First();
        }

        public decimal GetBookPrice(string isbn)
        {
            Book b = booksmodel.Book.Where(x => x.ISBN == isbn).First();
            decimal discountPrice = decimal.Round((Decimal)(b.Price * (1 - (Decimal)(b.Discount) / 100)), 2);
            return discountPrice;
        }

        public void AddToCart(string user, string isbn)
        {
            // Check if cart order exists in the database.
            var cartItem = booksmodel.Cart.FirstOrDefault(
                c => c.Username == user
                && c.ISBN == isbn && c.Status == "Unpaid");

            if (cartItem == null)
            {
                // Create a new cart item if no cart item exists.                 
                cartItem = new Cart()
                {
                    Username = user,
                    Title = GetBook(isbn).Title,
                    ISBN = isbn,
                    Price = GetBookPrice(isbn),
                    Quantity = 1,
                    Status = "Unpaid",
                };

                booksmodel.Cart.Add(cartItem);
            }

            else
            {
                // If the item does exist in the cart,                  
                // then add one to the quantity.                 
                cartItem.Quantity++;
            }
            booksmodel.SaveChanges();
        }

        public List<Cart> GetCartItems(string user)
        {
            return booksmodel.Cart.Where(c => c.Username == user && c.Status == "Unpaid").ToList();

        }

        public decimal GetTotal(string user)
        {
            // Multiply product price by quantity of that product to get        
            // the current price for each of those products in the cart.  
            // Sum all product price totals to get the cart total.   
            decimal? total = decimal.Zero;
            total = (decimal?)(from cartItems in booksmodel.Cart
                               where cartItems.Username == user && cartItems.Status == "Unpaid"
                               select (int?)cartItems.Quantity *
                               cartItems.Price).Sum();
            return total ?? decimal.Zero;
        }

        public int GetQuantity(string user, string isbn)
        {
            var q = booksmodel.Cart.Where(x => x.ISBN == isbn && x.Username == user && x.Status == "Unpaid").First();
            return q.Quantity;
        }

        public void QuantityDecrease(string user, string isbn)
        {           
            Cart c = booksmodel.Cart.Where(x => x.ISBN == isbn && x.Username == user && x.Status == "Unpaid").First();
            int quan = c.Quantity - 1;
            if (quan > 0)
            {
                c.Quantity = quan;
                booksmodel.SaveChanges();
            }
            else
            {
                RemoveItem(user, isbn);
                booksmodel.SaveChanges();
            }            
        }

        public void QuantityIncrease(string user, string isbn)
        {
            Cart c = booksmodel.Cart.Where(x => x.ISBN == isbn && x.Username == user && x.Status == "Unpaid").First();
            Book b = booksmodel.Book.Where(x => x.ISBN == isbn).First();
            int quan = c.Quantity + 1;
            if (quan <= b.Stock)
            {
                c.Quantity = quan;
                booksmodel.SaveChanges();
            }
            else
            {
                c.Quantity = b.Stock;
            }
        }

        public void RemoveItem(string user, string isbn)
        {
            Cart c = booksmodel.Cart.Where(x => x.ISBN == isbn && x.Username == user && x.Status == "Unpaid").First();
            c.Status = "Removed";
            //booksmodel.Cart.Remove(c);
            booksmodel.SaveChanges();
        }

        public bool HaveDiscount(string isbn)
        {
            Book b = booksmodel.Book.Where(x => x.ISBN == isbn).First();
            if (b.Discount != 0)
            {
                return true;
            }
            else return false;
        }

        public bool ShowOriginalPrice(string isbn)
        {
            Book b = booksmodel.Book.Where(x => x.ISBN == isbn).First();
            if (b.Discount != 0)
                return true;
            else
                return false;              
        }

        public decimal TotalPrice(string user)
        {
            decimal total = 0;
            List<Cart> ls_c = booksmodel.Cart.Where(x => x.Username == user && x.Status == "Unpaid").ToList();
            int itemCount = ls_c.Count();

            for (int i = 0; i < itemCount; i++)
            {
                total = total + ls_c[i].Quantity * GetBookPrice(ls_c[i].ISBN);
                
            }
            return total;
        }
                       

    public bool ChangeStock(Cart c)
        {
            BookshopEntities bs = new BookshopEntities();
            Book temp;
            try
            {
                string isbn = c.ISBN;
                temp = bs.Book.Where(x => x.ISBN == isbn).First();
            }
            catch
            {
                return false;
            }
            if (temp.Stock > 0)
                temp.Stock -= 1;
            else
                return false;
            c.Status = "Removed";
            bs.SaveChanges();
            return true;
        }

        public int CountCart(string username)
        {
            int result=0;
            BookshopEntities bs = new BookshopEntities();
            try
            {
                List<Cart> ls_c = bs.Cart.Where(x => x.Username == username && x.Status == "Unpaid").ToList();
                foreach(Cart c in ls_c)
                {
                    result += c.Quantity;
                }
            }
            catch
            {
                result = 0;
            }
            return result;
        }
    }

}

