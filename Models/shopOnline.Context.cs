﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShopFashion_VA_Store.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class VA_STOREEntities : DbContext
    {
        public VA_STOREEntities(string v)
            : base("name=VA_STOREEntities")
        {
        }

        public VA_STOREEntities()
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tb_ChiTietHoaDon> tb_ChiTietHoaDon { get; set; }
        public virtual DbSet<tb_HoaDon> tb_HoaDon { get; set; }
        public virtual DbSet<tb_KhachHang> tb_KhachHang { get; set; }
        public virtual DbSet<tb_User> tb_User { get; set; }
        public virtual DbSet<tbl_Menu> tbl_Menu { get; set; }
        public virtual DbSet<tbl_SanPham> tbl_SanPham { get; set; }
        public virtual DbSet<tb_Slider> tb_Slider { get; set; }
    }
}