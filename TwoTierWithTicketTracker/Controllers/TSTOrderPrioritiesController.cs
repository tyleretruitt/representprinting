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
    public class TSTOrderPrioritiesController : Controller
    {
        private tstEntities db = new tstEntities();

        // GET: TSTOrderPriorities
        public ActionResult Index()
        {
            return View(db.TSTOrderPriorities.ToList());
        }

        // GET: TSTOrderPriorities/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrderPriority tSTOrderPriority = db.TSTOrderPriorities.Find(id);
            if (tSTOrderPriority == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrderPriority);
        }

        // GET: TSTOrderPriorities/Create
        [Authorize(Roles = "Owner")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: TSTOrderPriorities/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PriorityID,Name,Description")] TSTOrderPriority tSTOrderPriority)
        {
            if (ModelState.IsValid)
            {
                db.TSTOrderPriorities.Add(tSTOrderPriority);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tSTOrderPriority);
        }

        // GET: TSTOrderPriorities/Edit/5
        [Authorize(Roles = "Owner")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrderPriority tSTOrderPriority = db.TSTOrderPriorities.Find(id);
            if (tSTOrderPriority == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrderPriority);
        }

        // POST: TSTOrderPriorities/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PriorityID,Name,Description")] TSTOrderPriority tSTOrderPriority)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tSTOrderPriority).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tSTOrderPriority);
        }

        // GET: TSTOrderPriorities/Delete/5
        [Authorize(Roles = "Owner")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrderPriority tSTOrderPriority = db.TSTOrderPriorities.Find(id);
            if (tSTOrderPriority == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrderPriority);
        }

        // POST: TSTOrderPriorities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTOrderPriority tSTOrderPriority = db.TSTOrderPriorities.Find(id);
            db.TSTOrderPriorities.Remove(tSTOrderPriority);
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
