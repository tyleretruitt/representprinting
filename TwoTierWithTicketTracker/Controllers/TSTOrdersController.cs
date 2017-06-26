using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DataLayer;

namespace TwoTierWithTicketTracker.Controllers
{
    
    public class TSTOrdersController : Controller
    {
        private tstEntities db = new tstEntities();


        #region Add Technician Note



        /// <summary>
        /// Notation information:
        /// This is the method that is going to be called by jQuery Ajax
        /// from the edit view to add the note on the fly AND lost it to the
        /// notes section BEFORE submitting the form.
        /// </summary>
        /// <returns>JsonResult</returns>
        /// 
        public JsonResult AddTechNote(int ticketId, string note)
        {
            //get the ticket associated with the record ID (passed to method)
            TSTOrder ticket = db.TSTOrders.Single(x => x.TicketID == ticketId);
            //get the current logged on employee as the technician.  This
            //code ONLY Works because we have our TSTEmployees table tied
            //to our identity Users table.  TstEmployee.Email == ASPUser.Email,
            //TstEmployee.Email == User.Identity.Name, 
            //UserId == TstEmployee UserID
            TSTEmployee tech = db.TSTEmployees.Single(x => x.Email == User.Identity.Name);

            //make sure the TSTEmployee object is not null.
            if (tech != null)
            {
                //create the TSTNote object
                //using initialization syntax assign values
                TSTShopNote newNote = new TSTShopNote()
                {
                    TicketID = ticketId,//passed to the method
                    TechID = tech.EmployeeID,//derived above, need the Employee ID
                    NotationDate = DateTime.Now,//hard-coded
                    Notation = note//passed to the method

                };
                //Send the note to EF
                db.TSTShopNotes.Add(newNote);
                //Save the note to the datastructure
                db.SaveChanges();
                //--------------The Note is added to the DB-----------------
                //--------------Send to the browser for parsing and display
                //This never hits the web server, jQuery has NO IDEA what
                // a TSTNOTE is.  We send over "data" to be parsed by jQuery.

                var data = new
                {
                    //otf (on the fly) variable = newNote.Property
                    TechNotes = newNote.Notation,
                    Tech = newNote.TSTEmployee.FName +" "+newNote.TSTEmployee.LName,

                    Date = string.Format("{0:g}", newNote.NotationDate)
                };
                //send the note stuff back to the browser to be parsed
                return Json(data, JsonRequestBehavior.AllowGet);
            }



            return null;
        }

        #endregion

        // GET: TSTOrders
        public ActionResult Index()
        {
            var tSTOrders = db.TSTOrders.Include(t => t.TSTEmployee).Include(t => t.TSTEmployee1).Include(t => t.TSTOrderPriority).Include(t => t.TSTOrderStatus).Include(t => t.TSTOrderType);
            //return View(tSTOrders.ToList());
            return View(tSTOrders.Where(o => o.TicketStatusID == 2).OrderBy(a =>a.PriorityID).ToList());
            //need to make sure that inactive orders do not show

            
        }
        [Authorize(Roles = "Manager, Owner, Employee")]
        public ActionResult InActiveOrders()
        {
            var tSTOrders = db.TSTOrders.Include(t => t.TSTEmployee).Include(t => t.TSTEmployee1).Include(t => t.TSTOrderPriority).Include(t => t.TSTOrderStatus).Include(t => t.TSTOrderType);
            //return View(tSTOrders.ToList());
            return View(tSTOrders.Where(o => o.TicketStatusID == 4).OrderBy(a => a.PriorityID).ToList());
            //need to make sure that inactive orders do not show
        }
        [Authorize(Roles = "Manager, Owner, Employee")]
        public ActionResult CompletedOrders()
        {
            var tSTOrders = db.TSTOrders.Include(t => t.TSTEmployee).Include(t => t.TSTEmployee1).Include(t => t.TSTOrderPriority).Include(t => t.TSTOrderStatus).Include(t => t.TSTOrderType);
            //return View(tSTOrders.ToList());
            return View(tSTOrders.Where(o => o.TicketStatusID == 1).OrderBy(a =>a.PriorityID).ToList());
            //need to make sure that inactive orders do not show
        }
        [Authorize(Roles = "Manager, Owner, Employee")]
        public ActionResult AssignedOrders()
        {
            var tSTOrders = db.TSTOrders.Include(t => t.TSTEmployee).Include(t => t.TSTEmployee1).Include(t => t.TSTOrderPriority).Include(t => t.TSTOrderStatus).Include(t => t.TSTOrderType);
            //return View(tSTOrders.ToList());
            return View(tSTOrders.Where(o => o.TicketStatusID == 3).OrderBy(a =>a.PriorityID).ToList());
            //need to make sure that inactive orders do not show
        }

        // GET: TSTOrders
        [Authorize(Roles = "Manager, Owner, Employee")]
        public ActionResult IndexTable()
        {
            var tSTOrders = db.TSTOrders.Include(t => t.TSTEmployee).Include(t => t.TSTEmployee1).Include(t => t.TSTOrderPriority).Include(t => t.TSTOrderStatus).Include(t => t.TSTOrderType);
            //return View(tSTOrders.ToList());
            return View(tSTOrders.Where(o => o.TicketStatusID == 2).ToList());
            //need to make sure that inactive orders do not show

            //toggle functionality added here later(more than likely)
        }

        // GET: TSTOrders/Details/5
        //[Authorize(Roles ="Owner, Manager, Employee")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrder tSTOrder = db.TSTOrders.Find(id);
            if (tSTOrder == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrder);
        }

        // GET: TSTOrders/Create
        [Authorize(Roles = "Owner, Manager, Employee")]
        public ActionResult Create()
        {
            //Order has to be submitted by a manager, and a shop worker is assigned the order.

            //ViewBag.SubmittedByID = new SelectList(db.TSTEmployees.Where(a => a.DeptID == 2), "EmployeeID", "FName");
            TSTEmployee e = db.TSTEmployees.Where(x => x.Email == User.Identity.Name).Single();
            ViewBag.TechID = new SelectList(db.TSTEmployees.Where(d => d.DeptID == 3), "EmployeeID", "FName");

            ViewBag.PriorityID = new SelectList(db.TSTOrderPriorities, "PriorityID", "Name");
            ViewBag.TicketStatusID = new SelectList(db.TSTOrderStatuses, "TicketStatusID", "Name");
            ViewBag.OrderTypeID = new SelectList(db.TSTOrderTypes, "OrderTypeID", "Name");
            return View("AssignedOrders");
            //RedirectToAction("AssignedOrders");
        }

        // POST: TSTOrders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TicketID,TroubleDescription,Picture,OrderTypeID,Quantity")]
        TSTOrder tSTOrder, HttpPostedFileBase prodImage)
        {
            TSTEmployee e = db.TSTEmployees.Where(x => x.Email == User.Identity.Name).Single();
            
            tSTOrder.TicketStatusID = 2;
            //priority is set to medium
            tSTOrder.PriorityID = 2;
            if (ModelState.IsValid)
            {
                //tech ID is null
                tSTOrder.TechID = null;
                #region File Upload Create

                string imageName = "NoImage.gif";

                if (prodImage != null)
                {
                    imageName = prodImage.FileName;

                    string ext = imageName.Substring(
                        imageName.LastIndexOf('.')).ToLower();

                    string[] goodExts = new string[]
                    {
                        ".gif", ".jpg", ".png", ".bmp", ".jpeg"
                    };
                    if (goodExts.Contains(ext))
                    {
                        imageName = Guid.NewGuid() + ext;

                        //save it to the webserver 
                        //(website/Content/Images/ProductImages)
                        prodImage.SaveAs(Server.MapPath(
                            "~/Content/img/OrderImages/"
                            + imageName));
                    }
                    else
                    {
                        imageName = "NoImage.gif";
                    }
                }
                tSTOrder.Picture = imageName;

                #endregion
                //#region Automatic Order Status Assignment
                //#endregion
                #region Automatic date assignment
                tSTOrder.StartDate = DateTime.Now;//needs to be parsed i believe
                #endregion
                #region Auto-assign the subject of the order based on OrderTypeID

                if (tSTOrder.OrderTypeID == 1)
                {
                    tSTOrder.Subject = "Silk Screen";
                }
                else
                {
                    tSTOrder.Subject = "Embroidery";
                }


                #endregion

                //Assign the employee id
                tSTOrder.SubmittedByID = e.EmployeeID;

                db.TSTOrders.Add(tSTOrder);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SubmittedByID = e.EmployeeID;
            ViewBag.TechID = new SelectList(db.TSTOrderPriorities, "TechID", "Name", tSTOrder.TechID);
            ViewBag.PriorityID = new SelectList(db.TSTOrderPriorities, "PriorityID", "Name", tSTOrder.PriorityID);
            ViewBag.TicketStatusID = new SelectList(db.TSTOrderStatuses, "TicketStatusID", "Name", tSTOrder.TicketStatusID);
            ViewBag.OrderTypeID = new SelectList(db.TSTOrderTypes, "OrderTypeID", "Name", tSTOrder.OrderTypeID);
            return View(tSTOrder);
        }

        // GET: TSTOrders/Edit/5
        [Authorize(Roles = "Owner, Manager")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrder tSTOrder = db.TSTOrders.Find(id);
            if (tSTOrder == null)
            {
                return HttpNotFound();
            }
            ViewBag.SubmittedByID = new SelectList(db.TSTEmployees.Where(d => d.DeptID == 2), "EmployeeID", "FName", tSTOrder.SubmittedByID);
            ViewBag.TechID = new SelectList(db.TSTEmployees.Where(a => a.DeptID == 3), "EmployeeID", "FName", tSTOrder.TechID);
            ViewBag.PriorityID = new SelectList(db.TSTOrderPriorities, "PriorityID", "Name", tSTOrder.PriorityID);
            ViewBag.TicketStatusID = new SelectList(db.TSTOrderStatuses, "TicketStatusID", "Name", tSTOrder.TicketStatusID);
            ViewBag.OrderTypeID = new SelectList(db.TSTOrderTypes, "OrderTypeID", "Name", tSTOrder.OrderTypeID);
            return View(tSTOrder);
        }

        // POST: TSTOrders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TicketID,TicketStatusID,TroubleDescription,StartDate,SubmittedByID,TechID,Subject,Picture,PriorityID,OrderTypeID,FinshedDate,Quantity")]
        TSTOrder tSTOrder, HttpPostedFileBase prodImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload Edit

                

                if (prodImage != null)
                {

                    string imageName = prodImage.FileName;
                    

                    string ext = imageName.Substring(
                        imageName.LastIndexOf('.')).ToLower();

                    string[] goodExts = new string[]
                    {
                        ".gif", ".jpg", ".png", ".bmp", ".jpeg"
                    };
                    if (goodExts.Contains(ext))
                    {
                        imageName = Guid.NewGuid() + ext;

                        //save it to the webserver 
                        //(website/Content/Images/ProductImages)
                        prodImage.SaveAs(Server.MapPath(
                            "~/Content/img/OrderImages/"
                            + imageName));

                        tSTOrder.Picture = imageName;
                    }
 
                }


                #endregion
                #region Move Order Status to assigned
                tSTOrder.TicketStatusID = 3;

                #endregion
                db.Entry(tSTOrder).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SubmittedByID = new SelectList(db.TSTEmployees, "EmployeeID", "FName", tSTOrder.SubmittedByID);
            ViewBag.TechID = new SelectList(db.TSTEmployees, "EmployeeID", "FName", tSTOrder.TechID);
            ViewBag.PriorityID = new SelectList(db.TSTOrderPriorities, "PriorityID", "Name", tSTOrder.PriorityID);
            ViewBag.TicketStatusID = new SelectList(db.TSTOrderStatuses, "TicketStatusID", "Name", tSTOrder.TicketStatusID);
            ViewBag.OrderTypeID = new SelectList(db.TSTOrderTypes, "OrderTypeID", "Name", tSTOrder.OrderTypeID);
            return View(tSTOrder);
        }

        // GET: TSTOrders/Delete/5
        [Authorize(Roles = "Owner, Manager")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrder tSTOrder = db.TSTOrders.Find(id);
            if (tSTOrder == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrder);
        }

        // POST: TSTOrders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTOrder tSTOrder = db.TSTOrders.Find(id);
            //db.TSTOrders.Remove(tSTOrder);

            //#region soft delete
            //if (tSTOrder.TicketStatusID == 4)
            //{
            //    tSTOrder.TicketStatusID = 2;
            //}
            //else
            //{
            //    tSTOrder.TicketStatusID = 4;
            //}

            //#endregion

            #region Assign Ticket Mark Complete Upon Deletion

            tSTOrder.TicketStatusID = 1;
            #endregion

            #region Mark Date Complete

            tSTOrder.FinshedDate = DateTime.Now;

            #endregion
            db.SaveChanges();
            return RedirectToAction("AssignedOrders");
        }

        // GET: TSTOrders/Delete/5
        [Authorize(Roles = "Owner, Manager")]
        public ActionResult Archive(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrder tSTOrder = db.TSTOrders.Find(id);
            if (tSTOrder == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrder);
        }

        // POST: TSTOrders/Delete/5
        [HttpPost, ActionName("Archive")]
        [ValidateAntiForgeryToken]
        public ActionResult ArchiveConfirmed(int id)
        {
            TSTOrder tSTOrder = db.TSTOrders.Find(id);
            //db.TSTOrders.Remove(tSTOrder);

            //#region soft delete
            //if (tSTOrder.TicketStatusID == 4)
            //{
            //    tSTOrder.TicketStatusID = 2;
            //}
            //else
            //{
            //    tSTOrder.TicketStatusID = 4;
            //}

            //#endregion

            #region Assign Ticket Mark Complete Upon Deletion

            tSTOrder.TicketStatusID = 4;
            #endregion

            #region Mark Date Complete

            tSTOrder.FinshedDate = DateTime.Now;

            #endregion
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
