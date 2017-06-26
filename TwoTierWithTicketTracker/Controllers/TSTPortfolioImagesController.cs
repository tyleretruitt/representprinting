using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DataLayer;
using System.ComponentModel.DataAnnotations;
using System.IO;//added Path property

namespace TwoTierWithTicketTracker.Controllers
{
    public class TSTPortfolioImagesController : Controller
    {
        private tstEntities db = new tstEntities();

        // GET: TSTPortfolioImages
        public ActionResult Index()
        {
            return View(db.TSTPortfolioImages.ToList());
        }

        // GET: TSTPortfolioImages/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTPortfolioImage tSTPortfolioImage = db.TSTPortfolioImages.Find(id);
            if (tSTPortfolioImage == null)
            {
                return HttpNotFound();
            }
            return View(tSTPortfolioImage);
        }

        // GET: TSTPortfolioImages/Create
        public ActionResult Create()
        {
            

            return View();
        }
        //Validation for image
        //public class MyValidationFileAttribute: ValidationAttribute
        //{
        //    public override bool IsValid(object value)
        //    {
        //        int MaxContentLength = 1024 * 1024 * 2;
        //        string[] AllowedFileExtensions = new string[] { ".jpg", ".gif", ".png", ".pdf", ".jpeg" };
        //        var file = value as HttpPostedFileBase;

        //        if (file ==null)
        //        {
        //            return false;
        //        }
        //        else if (!AllowedFileExtensions.Contains(file.FileName.Substring(file.FileName.LastIndexOf('.'))))
        //        {
        //            ErrorMessage = "Please upload your photo of type: " + string.Join(", ", AllowedFileExtensions);
        //            return false;
        //        }
        //        else if (file.ContentLength > MaxContentLength)
        //        {
        //            ErrorMessage = "File is too large, maximum size is : " + (MaxContentLength / 1024).ToString() + "MB";
        //            return false;
        //        }
        //        else
        //        {
        //            return true;
        //        }
                
        //    }
        //}

        // POST: TSTPortfolioImages/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ImageID,Image")] TSTPortfolioImage tSTPortfolioImage, HttpPostedFileBase uploadImage)
        {
            ////validation for file upload
            //int permittedSizeInBytes = 40000;//4mb

            //string permittedType = "image/jpeg, image/gif";

            //if (Request.Files.Count > 0)
            //{
            //    var file = Request.Files[0];

            //    if (file != null && file.ContentLength > 0)
            //    {
            //        if (file.ContentLength < permittedSizeInBytes)
            //        {
            //            ViewBag.Message = "File cannot be more than 4MB";
            //        }
            //        else
            //        {
            //            if (!permittedType.Split(",".ToCharArray()).Contains(file.ContentType))
            //            {
            //                ViewBag.Message = "Invalid file type";
            //            }
            //            else
            //            {
            //                var fileName = Path.GetFileName(file.FileName);
            //                var path = Path.Combine(Server.MapPath("~/Content/img/UploadedImages/"), fileName);
            //                file.SaveAs(path);
            //                ViewBag.Message = "File uploaded successfully";
            //            }
            //        }
            //    }
            //    else
            //    {
            //        ViewBag.Message = "File does not have any content";
            //    }

            //    ViewBag.Message = "No files uploaded";

            //    return View();

            //}




            if (ModelState.IsValid)
            {
                #region file upload create

                string imageName = "NoImage.png";

                if (uploadImage != null)
                {

                
                    imageName = uploadImage.FileName;
                    //extract the extension and store it
                    string ext = imageName.Substring(imageName.LastIndexOf('.'));

                    //check the file ext against valid file types
                    string[] goodExts = new string[]
                    {
                        ".gif",".jpg",".png",".jpeg"
                    };

                    //as long as it is a valid
                    if (goodExts.Contains(ext))
                    {
                        imageName = Guid.NewGuid() + ext;
                        uploadImage.SaveAs(Server.MapPath("~/Content/img/UploadedImages/" + imageName));


                    }
                    else
                    {
                        imageName = "NoImage.png";
                    }


                }
                tSTPortfolioImage.Image = imageName;

                #endregion
                db.TSTPortfolioImages.Add(tSTPortfolioImage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tSTPortfolioImage);
        }

        // GET: TSTPortfolioImages/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTPortfolioImage tSTPortfolioImage = db.TSTPortfolioImages.Find(id);
            if (tSTPortfolioImage == null)
            {
                return HttpNotFound();
            }
            return View(tSTPortfolioImage);
        }

        // POST: TSTPortfolioImages/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ImageID,Image")] TSTPortfolioImage tSTPortfolioImage, HttpPostedFileBase uploadImage)
        {
            if (ModelState.IsValid)
            {
                #region file upload edit

                if (uploadImage != null)
                {
                    //got the file name
                    string imageName = uploadImage.FileName;

                    //extract the extension and store it
                    string ext = imageName.Substring(imageName.LastIndexOf('.'));

                    //check the file ext against valid file types
                    string[] goodExts = new string[]
                    {
                        ".gif",".jpg",".png",".jpeg"
                    };

                    //as long as it is a valid
                    if (goodExts.Contains(ext))
                    {
                        imageName = Guid.NewGuid() + ext;
                        uploadImage.SaveAs(Server.MapPath("~/Content/img/UploadedImages/" + imageName));

                        tSTPortfolioImage.Image = imageName;
                    }


                }


                #endregion

                db.Entry(tSTPortfolioImage).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tSTPortfolioImage);
        }

        // GET: TSTPortfolioImages/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTPortfolioImage tSTPortfolioImage = db.TSTPortfolioImages.Find(id);
            if (tSTPortfolioImage == null)
            {
                return HttpNotFound();
            }
            return View(tSTPortfolioImage);
        }

        // POST: TSTPortfolioImages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTPortfolioImage tSTPortfolioImage = db.TSTPortfolioImages.Find(id);
            db.TSTPortfolioImages.Remove(tSTPortfolioImage);
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
