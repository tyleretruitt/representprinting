//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class TSTOrder
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TSTOrder()
        {
            this.TSTShopNotes = new HashSet<TSTShopNote>();
        }
    
        public int TicketID { get; set; }
        public int TicketStatusID { get; set; }
        public string TroubleDescription { get; set; }
        public System.DateTime StartDate { get; set; }
        public int SubmittedByID { get; set; }
        public Nullable<int> TechID { get; set; }
        public string Subject { get; set; }
        public string Picture { get; set; }
        public int PriorityID { get; set; }
        public int OrderTypeID { get; set; }
        public Nullable<System.DateTime> FinshedDate { get; set; }
        public int Quantity { get; set; }
    
        public virtual TSTEmployee TSTEmployee { get; set; }
        public virtual TSTEmployee TSTEmployee1 { get; set; }
        public virtual TSTOrderPriority TSTOrderPriority { get; set; }
        public virtual TSTOrderStatus TSTOrderStatus { get; set; }
        public virtual TSTOrderType TSTOrderType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TSTShopNote> TSTShopNotes { get; set; }
    }
}
