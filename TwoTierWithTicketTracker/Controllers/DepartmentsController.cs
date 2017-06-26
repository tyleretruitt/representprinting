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
    [Authorize(Roles = "Owner, HR")]
    public class DepartmentsController : Controller
    {
        private tstEntities db = new tstEntities();

        // GET: Departments

        public ActionResult Index()
        {
            return View(db.TSTDepartments.ToList());
        }

        // GET: Departments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTDepartment tSTDepartment = db.TSTDepartments.Find(id);
            if (tSTDepartment == null)
            {
                return HttpNotFound();
            }
            return View(tSTDepartment);
        }

        // GET: Departments/Create
        [Authorize(Roles ="Owner, HR")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Departments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DepartmentID,Name,Description,IsActive")] TSTDepartment tSTDepartment)
        {
            if (ModelState.IsValid)
            {
                db.TSTDepartments.Add(tSTDepartment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tSTDepartment);
        }

        // GET: Departments/Edit/5
        [Authorize(Roles = "Owner, HR")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTDepartment tSTDepartment = db.TSTDepartments.Find(id);
            if (tSTDepartment == null)
            {
                return HttpNotFound();
            }
            return View(tSTDepartment);
        }

        // POST: Departments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DepartmentID,Name,Description,IsActive")] TSTDepartment tSTDepartment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tSTDepartment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tSTDepartment);
        }

        // GET: Departments/Delete/5
        [Authorize(Roles = "Owner, HR")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTDepartment tSTDepartment = db.TSTDepartments.Find(id);
            if (tSTDepartment == null)
            {
                return HttpNotFound();
            }
            return View(tSTDepartment);
        }

        // POST: Departments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTDepartment tSTDepartment = db.TSTDepartments.Find(id);
            //Converting this hard delete into a soft delete in the Departments Controller

            //bool flip soft delete
            #region soft delete
            tSTDepartment.IsActive = !tSTDepartment.IsActive;
            #endregion


            //db.TSTDepartments.Remove(tSTDepartment);
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
