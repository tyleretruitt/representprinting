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
    public class TSTOrderTypesController : Controller
    {
        private tstEntities db = new tstEntities();

        // GET: TSTOrderTypes
        public ActionResult Index()
        {
            return View(db.TSTOrderTypes.ToList());
        }

        // GET: TSTOrderTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrderType tSTOrderType = db.TSTOrderTypes.Find(id);
            if (tSTOrderType == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrderType);
        }

        // GET: TSTOrderTypes/Create
        [Authorize(Roles = "Owner")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: TSTOrderTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OrderTypeID,Name,Description")] TSTOrderType tSTOrderType)
        {
            if (ModelState.IsValid)
            {
                db.TSTOrderTypes.Add(tSTOrderType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tSTOrderType);
        }

        // GET: TSTOrderTypes/Edit/5
        [Authorize(Roles = "Owner")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrderType tSTOrderType = db.TSTOrderTypes.Find(id);
            if (tSTOrderType == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrderType);
        }

        // POST: TSTOrderTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OrderTypeID,Name,Description")] TSTOrderType tSTOrderType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tSTOrderType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tSTOrderType);
        }

        // GET: TSTOrderTypes/Delete/5
        [Authorize(Roles = "Owner")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTOrderType tSTOrderType = db.TSTOrderTypes.Find(id);
            if (tSTOrderType == null)
            {
                return HttpNotFound();
            }
            return View(tSTOrderType);
        }

        // POST: TSTOrderTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTOrderType tSTOrderType = db.TSTOrderTypes.Find(id);
            db.TSTOrderTypes.Remove(tSTOrderType);
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
