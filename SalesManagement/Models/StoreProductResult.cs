// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace SalesManagement.Models
{
    public partial class StoreProductResult
    {
        public int product_id { get; set; }
        public string product_name { get; set; }
        public int product_quantity { get; set; }
        public long product_price { get; set; }
        public string category_name { get; set; }
        public int category_id { get; set; }
    }
}
