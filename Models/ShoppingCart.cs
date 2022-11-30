using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace ShopFashion_VA_Store.Models
{
    public class ShoppingCart
    {
        public List<ShoppingCartItem> Items { get; set; }
        public ShoppingCart()
        {
            Items = new List<ShoppingCartItem>();
        }

        public void AddToCart (ShoppingCartItem item,int Quantity)         
        {
            var checkExits = Items.FirstOrDefault(x => x.ProductId == item.ProductId);
            if(checkExits != null)
            {
                checkExits.Quantity +=Quantity;
                checkExits.TotalPrice = checkExits.Price * checkExits.Quantity;
            }
            else
            {
                Items.Add(item);
            }
        }

        public void Remove(int id)
        {
            var checkExits = Items.SingleOrDefault(x => x.ProductId == id);
            if(checkExits != null)
            {
                Items.Remove(checkExits);
            }
        }

        public void UpdateQuantity(int id,int quantity)
        {
            var checkExits = Items.SingleOrDefault(x => x.ProductId == id);
            if(checkExits != null)
            {
                checkExits.Quantity = quantity;
                checkExits.TotalPrice = checkExits.Price * checkExits.Quantity;
            }
        }

        public int GetTotal()
        {
            return Items.Sum(x => x.TotalPrice);
        }

        public int GetTotalQuantity()
        {
            return Items.Sum(x => x.Quantity);
        }

        public void ClearCart()
        {
            Items.Clear();
        }
    }

    public class ShoppingCartItem
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int CategoryName { get; set; }
        public string ProductImg { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }
        
        [DisplayFormat(DataFormatString = "{0:0,0 VNĐ}")]
        public int TotalPrice { get; set; }
    }
}