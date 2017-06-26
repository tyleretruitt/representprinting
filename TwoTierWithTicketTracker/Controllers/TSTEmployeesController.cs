using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DataLayer;
//---------ALL FOR CONNECTION TSTEmployee to Identity. - See Create GET/POST
using TwoTierWithTicketTracker.Models;//added
//maybe TST.IdentitySample.Models; - If you didn't rename the IdentitySample Changes
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity.EntityFramework;


namespace TwoTierWithTicketTracker.Controllers
{
    [Authorize(Roles = "HR, Owner, Manager")]
    public class TSTEmployeesController : Controller
    {
        private tstEntities db = new tstEntities();

        // GET: TSTEmployees
        public ActionResult Index()
        {
            var tSTEmployees = db.TSTEmployees.Include(t => t.TSTDepartment).Include(t => t.TSTEmployeeStatus);
            //return View(tSTEmployees.ToList());


            //Below is the code that make only active employees viewed by the user
            #region only return active employees and ordered by Last Name

            return View(tSTEmployees.Where(e => e.EmpStatusID != 4).OrderBy(e => e.LName).ToList());

            #endregion


        }
        [Authorize(Roles = "Owner, HR, Manager")]
        public ActionResult TileIndex()
        {
            #region Ordered By tST Employees by EmpStatusID
            var tSTEmployees = db.TSTEmployees.Include(t => t.TSTDepartment).OrderBy(t => t.EmpStatusID).Include(t => t.TSTEmployeeStatus);
            #endregion

            //return View(tSTEmployees.ToList());


            //Below is the code that make only active employees viewed by the user
            #region return all employees to "HR" or "Owner"
            //if (User.IsInRole("Owner") || User.IsInRole("HR"))
            //{

            //}
            //#endregion
            return View(tSTEmployees.Where(e => e.EmpStatusID != 4).OrderBy(e => e.LName).ToList());

            //#region only return active employees and ordered by Last Name
            //else
            //{
            //    return View(tSTEmployees.Where(e => e.EmpStatusID != 4).ToList());
            //}
            //#endregion
        }

        public ActionResult TileIndexWithAllEmployees()
        {
            var tSTEmployees = db.TSTEmployees.Include(t => t.TSTDepartment).Include(t => t.TSTEmployeeStatus);
            //return View(tSTEmployees.ToList());


            //Below is the code that make only active employees viewed by the user
            #region return all employees

            return View(tSTEmployees.OrderBy(e => e.LName).ToList());

            #endregion

            



        }
        [Authorize(Roles = "Owner, HR")]
        public ActionResult InActiveEmps()
        {
            var tSTEmployees = db.TSTEmployees.Include(t => t.TSTDepartment).Include(t => t.TSTEmployeeStatus);
            //return View(tSTEmployees.ToList());


            //Below is the code that make only active employees viewed by the user

            return View(tSTEmployees.Where(e => e.EmpStatusID == 4).OrderBy(e => e.LName).ToList());

        }

        // GET: TSTEmployees/Details/5
        [Authorize(Roles = "Owner, HR, Manager")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTEmployee tSTEmployee = db.TSTEmployees.Find(id);
            if (tSTEmployee == null)
            {
                return HttpNotFound();
            }
            return View(tSTEmployee);
        }

        // GET: TSTEmployees/Create
        [Authorize(Roles = "HR, Owner")]
        public ActionResult Create()
        {


            #region Identity Roles Cheackbox List
            //Add a viewbag item so that we can display the Identity Roles to be selected when a
            //new user is created.

            //part of the createing a User Object when creating the Employee
            //is to retrieve a list of roles from Identity.

            //OWIN - Open Web Interface for .Net
            var RoleManager = HttpContext.GetOwinContext().Get<ApplicationRoleManager>();

            //create  VIEWBAG OBJECT TO PASS TO THE VIEW TO BE CONSUMED.
            ViewBag.RoleID = new SelectList(RoleManager.Roles.ToList().OrderBy(r => r.Name), "Name", "Name");



            #endregion

            ViewBag.DeptID = new SelectList(db.TSTDepartments, "DepartmentID", "Name");
            ViewBag.EmpStatusID = new SelectList(db.TSTEmployeeStatuses, "EmployeeStatusID", "EmployeeStatusName");
            return View();
        }

        // POST: TSTEmployees/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(
            [Bind(Include = "EmployeeID,FName,LName,DeptID,EmpStatusID,HireDate,SeparationDate,Salary,Address1,Address2,City,State,Zip,Phone,Email,EmpPhoto,JobTitle,UserID")]
        TSTEmployee tSTEmployee, HttpPostedFileBase prodImage,
            string[] selectedRoles)//must match the name value of the input - casing does not matter
        {
            if (ModelState.IsValid)
            {

                #region Add UserID to Employee Object
                //Similar code can be found in the UserAdmin Create()
                //HTTPPost Controller/Action

                //Create a UserManager object
                var userManager = System.Web.HttpContext.Current.GetOwinContext().
                    GetUserManager<ApplicationUserManager>();

                //Create an application User and Assign the UserName and the email properties
                var newUser = new ApplicationUser()
                {
                    UserName = tSTEmployee.Email,
                    Email = tSTEmployee.Email
                };
                //-----------------------------------------------------
                //Create the User object with the default password
                userManager.Create(newUser, "P@ssw0rd");
                //Examples: El3ph@nt  Y3ahR!ght
                //dynamically
                //Fname + "Z1234$"
                //This actually sets the default password
                //You could go to the identityConfig.cs and configure email
                //to send the password to them after registry.  Do not forget
                //to set up email in the web.config if you do this
                //(if you are not going to use the identity.config)

                //add the user to a role - as long as the role value is not null
                if (selectedRoles != null)
                {
                    userManager.AddToRoles(newUser.Id, selectedRoles);
                }
                //if not then add to the default role user/customer/ect.
                else
                {
                    userManager.AddToRole(newUser.Id, "User");
                }
                //assign the tSTEmployee.UserID property and send the data to the data structure
                tSTEmployee.UserID = newUser.Id;
                #endregion

                #region file uploade in create view for employee

                string imageName = "noimage.jpg";
                if (prodImage != null)
                {
                    imageName = prodImage.FileName;

                    string ext = imageName.Substring(
                        imageName.LastIndexOf('.'));

                    string[] goodExts = new string[]
                    {
                    ".gif",".jpg",".bmp",".jpeg", ".png"
                    };

                    if (goodExts.Contains(ext))
                    {
                        imageName = Guid.NewGuid() + ext;

                        prodImage.SaveAs(Server.MapPath("~/Content/img/employeephotos/" + imageName));
                    }
                    else
                    {
                        imageName = "noimage.jpg";
                    }
                }
                tSTEmployee.EmpPhoto = imageName;
                #endregion

                #region AutoGenerate Date of Create

                tSTEmployee.HireDate = DateTime.Now;


                #endregion
                #region Autogenerate Employee Status

                tSTEmployee.EmpStatusID = 1;

                //tSTEmployee.TSTEmployeeStatus.EmployeeStatusID = 1;

                #endregion
                #region Autogenerate Salary Based on Department chosen

                if (tSTEmployee.DeptID == 1)
                {
                    tSTEmployee.Salary = 55000m;
                }
                else if (tSTEmployee.DeptID == 2)
                {
                    tSTEmployee.Salary = 65000m;
                }
                else if (tSTEmployee.DeptID == 3)
                {
                    tSTEmployee.Salary = 30000m;
                }
                else
                {
                    tSTEmployee.Salary = 100000m;
                }

                #endregion

                #region Autogenerate Position based on department

                if (tSTEmployee.DeptID == 1)
                {
                    tSTEmployee.JobTitle = "Shop Worker";

                }
                else if (tSTEmployee.DeptID == 2)
                {
                    tSTEmployee.JobTitle = "Shop Manager";
                }
                else if (tSTEmployee.DeptID == 3)
                {
                    tSTEmployee.JobTitle = "HR Representative";
                }
                else
                {
                    tSTEmployee.JobTitle = "Owner";
                }

                #endregion


                //#region Disable any selection of an inactive department
                //tSTEmployee.TSTDepartment.IsActive = true;
                //#endregion//this one does not seem to work (return later

                db.TSTEmployees.Add(tSTEmployee);
                db.SaveChanges();
                return RedirectToAction("Index");



            }
            #region Identity Roles Cheackbox List
            //Add a viewbag item so that we can display the Identity Roles to be selected when a
            //new user is created.

            //part of the createing a User Object when creating the Employee
            //is to retrieve a list of roles from Identity.

            //OWIN - Open Web Interface for .Net
            var RoleManager = HttpContext.GetOwinContext().Get<ApplicationRoleManager>();

            //create  VIEWBAG OBJECT TO PASS TO THE VIEW TO BE CONSUMED.
            ViewBag.RoleID = new SelectList(RoleManager.Roles.ToList().OrderBy(r => r.Name), "Name", "Name");



            #endregion
            ViewBag.DeptID = new SelectList(db.TSTDepartments, "DepartmentID", "Name", tSTEmployee.DeptID);
            ViewBag.EmpStatusID = new SelectList(db.TSTEmployeeStatuses, "EmployeeStatusID", "EmployeeStatusName", tSTEmployee.EmpStatusID);
            return View(tSTEmployee);
        }

        // GET: TSTEmployees/Edit/5
        [Authorize(Roles = "HR, Owner")]
        public ActionResult Edit(int? id)
        {


            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTEmployee tSTEmployee = db.TSTEmployees.Find(id);
            if (tSTEmployee == null)
            {
                return HttpNotFound();
            }
            ViewBag.DeptID = new SelectList(db.TSTDepartments, "DepartmentID", "Name", tSTEmployee.DeptID);
            ViewBag.EmpStatusID = new SelectList(db.TSTEmployeeStatuses, "EmployeeStatusID", "EmployeeStatusName", tSTEmployee.EmpStatusID);
            return View(tSTEmployee);
        }

        // POST: TSTEmployees/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "EmployeeID,FName,LName,DeptID,EmpStatusID,HireDate,SeparationDate,Salary,Address1,Address2,City,State,Zip,Phone,Email,EmpPhoto,JobTitle,UserID")]
        TSTEmployee tSTEmployee, HttpPostedFileBase prodImage)
        {
            if (ModelState.IsValid)
            {

                #region File Upload Edit Processing


                if (prodImage != null)
                {
                    string imageName = prodImage.FileName;
                    string ext = imageName.Substring(
                        imageName.LastIndexOf('.'));

                    string[] goodExts = new String[]
                    {
                        ".gif", ".jpg", ".jpeg", ".bmp", ".png"
                    };
                    if (goodExts.Contains(ext))
                    {
                        imageName = Guid.NewGuid() + ext;

                        prodImage.SaveAs(Server.MapPath("~/Content/img/employeephotos/"
                            + imageName));

                        tSTEmployee.EmpPhoto = imageName;
                    }
                    //else
                    //{
                    //    //reassign imagename variable to be the ORIGINAL VALUE
                    //    //db-->Products Table where OUR Object.ID
                    //    //is the same as the EXISTING Product.ID
                    //    //Getting only the Image Name value
                    //    //the .Single() tells .NET that only 1
                    //    //item is being returned - By default
                    //    //linq returns an IQueryable
                    //    imageName = db.TSTEmployees.Where(wgp => wgp.EmployeeID
                    //    == tSTEmployee.EmployeeID).Select(wgp => wgp.EmpPhoto).Single();


                    //    //we could send them back to the create view
                    //    //and populate the create and use a viewbag
                    //    //message as an error

                    //    //ViewBag.Err = "Please supply a valid file type.";
                    //    ////then only display this if the viewbag item is NOT null
                    //    ////in the view.
                    //    //return View(tSTEmployee);
                    //}
                }


                #endregion
                db.Entry(tSTEmployee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
                
            }
            ViewBag.DeptID = new SelectList(db.TSTDepartments, "DepartmentID", "Name", tSTEmployee.DeptID);
            ViewBag.EmpStatusID = new SelectList(db.TSTEmployeeStatuses, "EmployeeStatusID", "EmployeeStatusName", tSTEmployee.EmpStatusID);
            return View(tSTEmployee);
        }

        // GET: TSTEmployees/Delete/5
        [Authorize(Roles = "HR, Owner")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTEmployee tSTEmployee = db.TSTEmployees.Find(id);
            if (tSTEmployee == null)
            {
                return HttpNotFound();
            }
            return View(tSTEmployee);
        }
        // POST: TSTEmployees/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTEmployee tSTEmployee = db.TSTEmployees.Find(id);
            #region soft delete

            if (tSTEmployee.EmpStatusID == 4)
            {
                tSTEmployee.EmpStatusID = 1;
            }
            else
            {
                tSTEmployee.EmpStatusID = 4;
            }

            #endregion
            #region Autogenerate separation date on delete(and toggle back if they are already deleted)
            if (tSTEmployee.EmpStatusID != 4)
            {
                tSTEmployee.SeparationDate = null;
                tSTEmployee.HireDate = DateTime.Now;
                //db.Entry(tSTEmployee).State = EntityState.Modified;
                //db.SaveChanges();
                //return RedirectToAction("Index");

            }
            else
            {
                tSTEmployee.SeparationDate = DateTime.Now;
                //db.Entry(tSTEmployee).State = EntityState.Modified;
                //db.SaveChanges();
                //return RedirectToAction("Index");
            }


            #endregion
            //commented out hard delete
            //db.TSTEmployees.Remove(tSTEmployee);
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
#endregion