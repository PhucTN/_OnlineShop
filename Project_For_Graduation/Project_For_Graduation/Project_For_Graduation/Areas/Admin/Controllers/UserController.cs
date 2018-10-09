using Common;
using Model.Down;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_For_Graduation.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        // GET: Admin/User
        public ActionResult Index(string searchString, int page = 1, int pageSize = 4)
        {
            var Down = new UserDown();
            var model = Down.ListAllPaging(searchString, page, pageSize);
            // Search paging 
            ViewBag.SearchString = searchString;
            return View(model);
        }

        // GET: UserDetails/Create
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        // POST: UserDetails/Create
        // To Protect from overposting attacks 
        [HttpPost]
        public ActionResult Create(User user)
        {
            if (ModelState.IsValid)
            {
                var down = new UserDown();


                var encryptedMd5Pas = Encryptor.MD5Hash(user.Password);
                user.Password = encryptedMd5Pas;

                long id = down.Insert(user);
                if (id > 0)
                {
                    SetAlert("Thêm User thành công", "success");
                    return RedirectToAction("Index", "User"); // Method // Controller 
                }
                else
                {
                    ModelState.AddModelError("", "Can't Insert User");
                }
            }
            return View("Index");
        }

        //GET: User/Edit
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var user = new UserDown().ViewDetail(id);
            return View(user);
        }

        //POST: User/Edit
        [HttpPost]
        public ActionResult Edit(User user)
        {
            if (ModelState.IsValid)
            {
                var down = new UserDown();

                var result = down.Update(user);
                if (result)
                {
                    SetAlert("Sửa User thành công", "success");
                    return RedirectToAction("Index", "User"); // Method // Controller 
                }
                else
                {
                    ModelState.AddModelError("", "Can't Insert User");
                }
            }
            return View("Index");
        }

      
        // Delete
        // GET: User/delete/
        public ActionResult Delete(int id)
        {
            if (ModelState.IsValid)
            {
                var down = new UserDown();

                var result = down.Delete(id);
                if (result)
                {
                    return RedirectToAction("Index", "User"); // Method // Controller 
                }
                else
                {
                    ModelState.AddModelError("", "Can't Delete User");
                }
            }
            return View("Index");
        }
        // Change Status with ajax
        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new UserDown().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}