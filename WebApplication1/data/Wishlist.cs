using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.data
{
    public class Wishlist
    {
        public Wishlist()
        {

        }

        public string productCode { get; set; }
        public string productName { get; set; }
        public float oldPrice { get; set; }
        public float newPrice { get; set; }
        public string image { get; set; }
        public int sale { get; set; }

        public Wishlist(string productCode, string productName, float oldPrice, float newPrice, string image, int sale)
        {
            this.productCode = productCode;
            this.productName = productName;
            this.oldPrice = oldPrice;
            this.newPrice = newPrice;
            this.image = image;
            this.sale = sale;
        }
    }
}