﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class tstEntities : DbContext
    {
        public tstEntities()
            : base("name=tstEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<TSTDepartment> TSTDepartments { get; set; }
        public virtual DbSet<TSTEmployee> TSTEmployees { get; set; }
        public virtual DbSet<TSTEmployeeStatus> TSTEmployeeStatuses { get; set; }
        public virtual DbSet<TSTOrderPriority> TSTOrderPriorities { get; set; }
        public virtual DbSet<TSTOrderStatus> TSTOrderStatuses { get; set; }
        public virtual DbSet<TSTOrderType> TSTOrderTypes { get; set; }
        public virtual DbSet<TSTShopNote> TSTShopNotes { get; set; }
        public virtual DbSet<TSTOrder> TSTOrders { get; set; }
        public virtual DbSet<TSTPortfolioImage> TSTPortfolioImages { get; set; }
    }
}
