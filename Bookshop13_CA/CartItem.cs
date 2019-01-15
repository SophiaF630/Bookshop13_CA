using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bookshop13_CA
{
    public class CartItem
    {
        public string Username { get; set; }

        public string Title { get; set; }

        public string ISBN { get; set; }

        public string Author { get; set; }

        public decimal DiscountPrice { get; set; }

        public int Quantity { get; set; }

    }
}