using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using ShopFashion_VA_Store.Models;
using PagedList;
using System.IO;

namespace ShopFashion_VA_Store.Areas.Admin.Controllers
{
    public class MainAdminController : Controller
    {
        // GET: Admin/MainAdmin
        VA_STOREEntities db = new VA_STOREEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult NhaSanXuat()
        {
            return View();
        }

        public ActionResult QLUser(int? page)
        {
            List<tb_User> users = db.tb_User.ToList();

            if (page == null) page = 1;
            var links = (from l in db.tb_User select l).OrderBy(x => x.IDUser);
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(links.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult DeleteUser(int id)
        {
            tb_User _User = db.tb_User.Where(c => c.IDUser == id).FirstOrDefault();


            return View(_User);
        }
        [HttpPost]
        public ActionResult DeleteUser(int id, tb_User user)
        {
            tb_User _User = db.tb_User.Where(c => c.IDUser == id).FirstOrDefault();
            if (_User == null)
            {

                return Redirect("/Admin/MainAdmin/Index");
            }
            else
            {
                db.tb_User.Remove(_User);
                db.SaveChanges();
                return Redirect("/Admin/MainAdmin/QLUser");
            }
        }


        public ActionResult QLSanPham(int? page)
        {
            
            List<tbl_SanPham> sanPhams = db.tbl_SanPham.ToList();
            if (page == null) page = 1;
            var links = (from l in db.tbl_SanPham select l).OrderBy(x => x.IDSanPham);
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(links.ToPagedList(pageNumber, pageSize));
        }

        
        public ActionResult AddProductAdmin()
        {
            return View();
        }

        [HttpPost]

        public ActionResult AddProductAdmin(tbl_SanPham p, HttpPostedFileBase uploadImage,
            HttpPostedFileBase uploadImage1, HttpPostedFileBase uploadImage2, HttpPostedFileBase uploadImage3)
        {     
            db.tbl_SanPham.Add(p);
            db.SaveChanges();
           
            if (uploadImage != null && uploadImage.ContentLength > 0 ||
                uploadImage1 != null && uploadImage1.ContentLength > 0||
                uploadImage2 != null && uploadImage2.ContentLength > 0||
                uploadImage3 != null && uploadImage3.ContentLength > 0)
            {
                int id = int.Parse(db.tbl_SanPham.ToList().Last().IDSanPham.ToString());
                //string fileName = "";
                
                //int index = uploadImage.FileName.IndexOf('.');
                
                string fileName = uploadImage.FileName.ToString();
                string fileName1 = uploadImage1.FileName.ToString();
                string fileName2 = uploadImage2.FileName.ToString();
                string fileName3 = uploadImage3.FileName.ToString();
                
                string path = Path.Combine(Server.MapPath("~/tool/image/favorite products"), fileName);
                string path1 = Path.Combine(Server.MapPath("~/tool/image/infor_products"), fileName1);
                string path2 = Path.Combine(Server.MapPath("~/tool/image/infor_products"), fileName2);
                string path3 = Path.Combine(Server.MapPath("~/tool/image/infor_products"), fileName3);
               
                uploadImage.SaveAs(path);
                uploadImage1.SaveAs(path1);
                uploadImage2.SaveAs(path2);
                uploadImage3.SaveAs(path3);
                
                tbl_SanPham sp = db.tbl_SanPham.FirstOrDefault(x => x.IDSanPham == id);
                sp.HinhChinh = fileName;
                sp.Hinh1 = fileName1;
                sp.Hinh2 = fileName2;
                sp.Hinh3 = fileName3;
                db.SaveChanges();
            }
        
            return Redirect("/Admin/MainAdmin/QLSanPham");
        }

        public ActionResult DeleteProductAdmin(int id)
        {
            tbl_SanPham sanPham = db.tbl_SanPham.Where(c => c.IDSanPham == id).FirstOrDefault();

            return View(sanPham);
        }
        [HttpPost]
        public ActionResult DeleteProductAdmin(int id, tbl_SanPham p)
        {
            tbl_SanPham sanPham = db.tbl_SanPham.Where(c => c.IDSanPham == id).FirstOrDefault();
            if(sanPham == null)
            {
                
                return Redirect("/Admin/MainAdmin/Index");
            }
            else
            {
                db.tbl_SanPham.Remove(sanPham);
                db.SaveChanges();
                return Redirect("/Admin/MainAdmin/QLSanPham");
            }
        }


        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return Redirect("/Shop/Login");
        }
        }
   
}
