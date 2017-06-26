using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer/*.Metadata*/
{
    #region department metadata

    public class DepartmentMetadata
    {
        public int DepartmentID { get; set; }
        [Required(ErrorMessage ="**Required")]
        [StringLength(25,ErrorMessage ="**No more than 25 characters")]
        [Display(Name="Department")]
        public string Name { get; set; }
        [DisplayFormat(NullDisplayText ="[None Provided]")]
        [StringLength(250, ErrorMessage = "**No more than 250 characters")]
        [UIHint("MultilineText")]
        public string Description { get; set; }
        [Required(ErrorMessage = "**Required")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(DepartmentMetadata))]
    public partial class TSTDepartment { }

    #endregion

    #region employee metadata

    public class EmployeeMetadata
    {
        public int EmployeeID { get; set; }
        [Display(Name = "First Name")]
        [StringLength(20, ErrorMessage = "No more than 20 characters please")]
        [Required(ErrorMessage = "**Required Field")]
        [DisplayFormat(NullDisplayText ="(Unassigned)")]
        [RegularExpression("^([a-zA-Z0-9 .&'-]+)$", ErrorMessage = "Invalid First Name")]
        public string FName { get; set; }
        [Display(Name = "Last Name")]
        [StringLength(20, ErrorMessage = "No more than 20 characters please")]
        [Required(ErrorMessage = "**Required Field")]
        [RegularExpression("^([a-zA-Z0-9 .&'-]+)$", ErrorMessage = "Invalid Last Name")]
        public string LName { get; set; }
        [Display(Name = "Date Hired")]
        [Required(ErrorMessage = "**Required Field")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime HireDate { get; set; }
        [Display(Name = "Date Terminated")]
        [DisplayFormat(NullDisplayText = "[Still Active]",DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        
        public Nullable<System.DateTime> SeparationDate { get; set; }
        [Required(ErrorMessage = "**Required Field")]
        [DisplayFormat(DataFormatString = "{0:c}", ApplyFormatInEditMode = true)]
        public decimal Salary { get; set; }
        [Display(Name = "Address")]
        [DisplayFormat(NullDisplayText = "[NoneProvided]")]
        [StringLength(150, ErrorMessage = "Please do not exceed 150 characters")]
        public string Address1 { get; set; }
        [Display(Name = "Address ext.")]
        [StringLength(150, ErrorMessage = "**Please do not exceed 150 characters")]
        [DisplayFormat(NullDisplayText = "[NoneProvided]")]
        public string Address2 { get; set; }

        [DisplayFormat(NullDisplayText = "[NoneProvided]")]
        [StringLength(50, ErrorMessage = "**Please do not excede 50 characters")]
        public string City { get; set; }
        [DisplayFormat(NullDisplayText = "[NoneProvided]")]
        [StringLength(2, ErrorMessage = "**Please do not excede 2 characters")]
        public string State { get; set; }
        [DisplayFormat(NullDisplayText = "[NoneProvided]")]
        [StringLength(10, ErrorMessage = "**Please do not excede 10 characters")]
        //[RegularExpression(@"/(^\d{5}(-\d{4})?$/", ErrorMessage = " Zip code must be 5 characters length")]
        public string Zip { get; set; }
        [DisplayFormat(NullDisplayText = "[NoneProvided]")]
        [StringLength(20, ErrorMessage = "**Please do not excede 20 characters")]
        [Phone]
        //[RegularExpression("^(/+0?1/s)?/(?/d{3}/)?[/s.-]/d{3}[/s.-]/d{4}$", ErrorMessage = "Invalid phone")]
        public string Phone { get; set; }
        [Required(ErrorMessage = "**Required Field")]
        [StringLength(75, ErrorMessage = "**Please do not enter more than 75 characters")]
        [EmailAddress]
        public string Email { get; set; }
        [DisplayFormat(NullDisplayText = "[No photo provided]")]
        [StringLength(100, ErrorMessage = "**Photo name cannot execede 100 please change it.")]
        [Display(Name ="Employee Photo")]
        public string EmpPhoto { get; set; }
        [Display(Name = "Position")]
        [StringLength(20, ErrorMessage = "**Please do not excede 20 characters")]
        //[Required(ErrorMessage = "**Required")]
        public string JobTitle { get; set; }
        [DisplayFormat(NullDisplayText = "None provided")]
        [StringLength(100, ErrorMessage = "**Please do not excede 100 characters")]
        public string UserID { get; set; }
    }
    [MetadataType(typeof(EmployeeMetadata))]
    public partial class TSTEmployee { }

    #endregion

    #region employee status metadata

    public class EmployeeStatusMetadata
    {
        public int EmployeeStatusID { get; set; }
        [Required(ErrorMessage ="**Required Field")]
        [StringLength(25, ErrorMessage ="Please dont enter more than 25 characters")]
        [Display(Name ="Status")]
        public string EmployeeStatusName { get; set; }
        [UIHint("MultilineText")]
        [Display(Name ="Additional Info")]
        [DisplayFormat(NullDisplayText ="[none provided]")]
        [StringLength(250,ErrorMessage ="No more than 250 characters please")]
        public string Description { get; set; }
    }

    [MetadataType(typeof(EmployeeStatusMetadata))]
    public partial class TSTEmployeeStatus { }

    #endregion

    #region order priorities

    public class OrderPrioritiesMetadata
    {
        public int PriorityID { get; set; }
        [StringLength(20,ErrorMessage ="**Please use no more than 20 characters")]
        [Required(ErrorMessage ="**Name is a required field")]
        [Display(Name="Priority")]
        public string Name { get; set; }
        [DisplayFormat(NullDisplayText ="[None Provided]")]
        [StringLength(250,ErrorMessage ="**Please use no more than 250 characters")]
        public string Description { get; set; }
    }
    [MetadataType(typeof(OrderPrioritiesMetadata))]
    public partial class TSTOrderPriority
    {

    }


    #endregion

    #region orders metadata

    public class OrderMetadata
    {
        public int TicketID { get; set; }
        public int TicketStatusID { get; set; }
        public int SubmittedByID { get; set; }
        public Nullable<int> TechID { get; set; }

        [Display(Name = "Order Description")]
        [Required(ErrorMessage = "**This is a required field")]
        [StringLength(4000, ErrorMessage = "Please do not enter more than 4000 characters")]
        [UIHint("MultilineText")]
        public string TroubleDescription { get; set; }
        [Range(20,1000,ErrorMessage ="Please select no less that 20 orders, and no more than 1000")]
        [Display(Name ="QTY")]
        [Required(ErrorMessage ="**This is a required field**")]
        public int Quantity { get; set; }

        [Display(Name = "Start Date")]
        [DisplayFormat(DataFormatString = "{0:d}",ApplyFormatInEditMode = true)]
        //[Required(ErrorMessage = "**This is a required field")]
        public System.DateTime StartDate { get; set; }

        //[Required(ErrorMessage = "**This is a required field")]
        [StringLength(100, ErrorMessage = "Please do not enter more than 100 characters")]
        public string Subject { get; set; }
        
        [StringLength(100, ErrorMessage = "Please upload an image with less than 100 characters")]
        public string Picture { get; set; }

        public int PriorityID { get; set; }

        public int OrderTypeID { get; set; }

        [Display(Name = "Finshed Date")]
        [DisplayFormat(NullDisplayText = "(still active)")]
        public Nullable<System.DateTime> FinshedDate { get; set; }
    
    }

    [MetadataType(typeof(OrderMetadata))]
    public partial class TSTOrder
    {

    }

    #endregion//comeback to this guy possibly

    #region order status metadata

    public class OrderStatusMetadata
    {
        public int TicketStatusID { get; set; }
        [StringLength(20, ErrorMessage ="**No more than 20 characters")]
        [Required(ErrorMessage ="**This is a required field")]
        [Display(Name="Status")]
        public string Name { get; set; }
        [DisplayFormat(NullDisplayText ="[None Provided]")]
        [StringLength(250, ErrorMessage ="**No more than 250 characters")]
        public string Description { get; set; }
    }

    [MetadataType(typeof(OrderStatusMetadata))]
    public partial class TSTOrderStatus
    {

    }

    #endregion

    #region order types metadata

    public class OrderTypeMetadata
    {
        public int OrderTypeID { get; set; }
        [Required(ErrorMessage ="**Required Field")]
        [StringLength(25, ErrorMessage ="**No more than 25 characters")]
        [Display(Name="Type")]
        public string Name { get; set; }
        [StringLength(1000, ErrorMessage ="No more that 1000 characters")]
        public string Description { get; set; }
    }

    [MetadataType(typeof(OrderTypeMetadata))]
    public partial class TSTOrderType
    {

    }


    #endregion

    #region shop notes metadata

    public class ShopNoteMetadata
    {
        public int NotationID { get; set; }
        [Display(Name ="Notes")]
        [Required(ErrorMessage ="**This is a required field")]
        [StringLength(500, ErrorMessage ="**No more than 500 characters")]
        public string Notation { get; set; }
        public int TechID { get; set; }
        public int TicketID { get; set; }
        [Display(Name ="Note date")]
        [Required(ErrorMessage ="**This is a required field")]
        public System.DateTime NotationDate { get; set; }

        
    }

    [MetadataType(typeof(ShopNoteMetadata))]
    public partial class TSTShopNote
    {

    }

    #endregion

    #region portfolio images metadata

    public class imagesmetadata
    {
        public int ImageID { get; set; }
        [StringLength(50, ErrorMessage ="Please make sure that the file name contains less than 50 characters.")]
        //[Required]
        //[DataType(DataType.Upload)]
        public string Image { get; set; }
    }
    [MetadataType(typeof(imagesmetadata))]
    public partial class TSTPortfolioImage { }
    #endregion
}
