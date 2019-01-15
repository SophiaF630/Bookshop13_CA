namespace Bookshop13_CA
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Cart")]
    public partial class Cart
    {
        [Key]
        public int indexID { get; set; }

        [Required]
        [StringLength(80)]
        public string Username { get; set; }

        [Required]
        [StringLength(120)]
        public string Title { get; set; }

        [Required]
        [StringLength(22)]
        public string ISBN { get; set; }

        public decimal Price { get; set; }

        public int Quantity { get; set; }

        [Required]
        [StringLength(15)]
        public string Status { get; set; }
    }
}
