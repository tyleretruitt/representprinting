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
    [Authorize(Roles = "Owner, Manager, Employee")]
    public class TSTOrderStatusController : Controller
    {
        private tstEntities db = new tstEntities();

        // GET: TSTOrderStatus
        public ActionResult Index()
        {
            return View(db.TSTOrderStatuses.ToList());
        }

        // GET: TSTOrderStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrderStatus tSTOrderStatus = db.TSTOrderStatuses.Find(id);
            if (tSTOrderStatus == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrderStatus);
        }

        // GET: TSTOrderStatus/Create
        [Authorize(Roles = "Owner, Manager")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: TSTOrderStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TicketStatusID,Name,Description")] TSTOrderStatus tSTOrderStatus)
        {
            if (ModelState.IsValid)
            {
                db.TSTOrderStatuses.Add(tSTOrderStatus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tSTOrderStatus);
        }

        // GET: TSTOrderStatus/Edit/5
        [Authorize(Roles = "Owner, Manager")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrderStatus tSTOrderStatus = db.TSTOrderStatuses.Find(id);
            if (tSTOrderStatus == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrderStatus);
        }

        // POST: TSTOrderStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TicketStatusID,Name,Description")] TSTOrderStatus tSTOrderStatus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tSTOrderStatus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tSTOrderStatus);
        }

        // GET: TSTOrderStatus/Delete/5
        [Authorize(Roles = "Owner, Manager")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrderStatus tSTOrderStatus = db.TSTOrderStatuses.Find(id);
            if (tSTOrderStatus == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrderStatus);
        }

        // POST: TSTOrderStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTOrderStatus tSTOrderStatus = db.TSTOrderStatuses.Find(id);
            db.TSTOrderStatuses.Remove(tSTOrderStatus);
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
