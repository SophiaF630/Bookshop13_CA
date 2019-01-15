using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bookshop13_CA
{
    public class SelectedBooks
    {

        public string Title { get; set; }

        public string CategoryName { get; set; }

        public string ISBN { get; set; }

        public string Author { get; set; }

        public decimal Price { get; set; }

        public decimal DiscountPrice { get; set; }

        public int Stock { get; set; }

        public string AO1 { get; set; }

        public string AO2 { get; set; }

        public decimal PriceL { get; set; }

        public decimal PriceU { get; set; }

        public int Discount { get; set; }

        public bool CheckInStock { get; set; }

        public bool ShowOriginalPrice { get; set; }

    }
}