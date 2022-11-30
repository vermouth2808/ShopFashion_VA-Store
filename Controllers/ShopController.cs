using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;             
using ShopFashion_VA_Store.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace ShopFashion_VA_Store.Controllers
{
    public class ShopController : Controller
    {
        // GET: Shop
        VA_STOREEntities db = new VA_STOREEntities();
        public ActionResult Index()
        {          
            if (Session["idUser"] != null)
            {          
                    List<tbl_SanPham> sanPhams = db.tbl_SanPham.ToList();
                    ViewData["Slide"] = new List<tb_Slider>(db.tb_Slider);
                    return View(sanPhams);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        public ActionResult _MainLayOut()
        {       
            List<tbl_SanPham> sanPhams = db.tbl_SanPham.ToList();
            ViewData["user"] = new List<tb_User>(db.tb_User);
            return View(sanPhams);
        }
      
        //private ActionResult View(List<tbl_SanPham> sanPhams, IView sliders)
        //{
        //    throw new NotImplementedException();
        //}

        public ActionResult Shopping()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                return View(cart.Items);
            }
            return View();
        }

        public ActionResult ShowCount()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                return Json(new { Count = cart.Items.Count }, JsonRequestBehavior.AllowGet);

            }
            return Json(new { Count = 0 }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult deleteAll()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                cart.ClearCart();
                return Json(new { Success=true});

            }
            return Json(new { Success = false });
        }
        [HttpPost]
        public ActionResult DeteleCart(int id)
        {
            var code = new { Success = false, msg = "", code = -1, count = 0 };

            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                var checkProduct = cart.Items.FirstOrDefault(x => x.ProductId == id);
                if(checkProduct != null)
                {
                    cart.Remove(id);
                    code = new { Success = true, msg = "", code = 1, count = cart.Items.Count };

                }
            }
            return Json(code);
        }
        [HttpPost]
        public ActionResult AddToCart(int id, int quantity)
        {
            var code = new { Success = false, msg = "", code = -1, count = 0 };
            var db = new VA_STOREEntities();
            var checkProduct = db.tbl_SanPham.FirstOrDefault(x => x.IDSanPham == id);
            if (checkProduct != null)
            {
                ShoppingCart cart = (ShoppingCart)Session["Cart"];
                if (cart == null)
                {
                    cart = new ShoppingCart();
                }
                ShoppingCartItem item = new ShoppingCartItem
                {
                    ProductId = checkProduct.IDSanPham,
                    ProductName = checkProduct.TenSanPham,
                    CategoryName = (int)checkProduct.IDLoaiSP,
                    ProductImg = checkProduct.HinhChinh,
                    Quantity = quantity
                };
                item.Price = (int)checkProduct.Gia;
                item.TotalPrice = item.Quantity * item.Price;
                cart.AddToCart(item, quantity);
                Session["Cart"] = cart;
                code = new { Success = true, msg = "Thêm sản phẩm thành công", code = 1, count = cart.Items.Count  };
            }
            return Json(code, JsonRequestBehavior.AllowGet);
        }
        public ActionResult ListProducts(int idLoaiSP, int? page1,int? pageSize)
        {
            if(page1 == null)
            {
                page1 = 1;
            }
            if(pageSize == null)
            {
                pageSize = 12;
            }
            List<tbl_SanPham> sanPhams = db.tbl_SanPham.Where(n => n.IDLoaiSP == idLoaiSP).ToList();
            return View(sanPhams.ToPagedList((int)page1 ,(int)pageSize));           
        }   
        public ActionResult sortProducts(string sort = "")
        {
            if(sort == "AZ")
            {
            List<tbl_SanPham> sanPhams = db.tbl_SanPham.OrderBy(n => n.Gia).ToList();
            return View(sanPhams);
            }
            else 
            {
                List<tbl_SanPham> sanPhams = db.tbl_SanPham.OrderByDescending(n => n.Gia).ToList();
                return View(sanPhams);
            }
        }
        public ActionResult searchProduct(string search = "")
        {
            List<tbl_SanPham> sanPhams = db.tbl_SanPham.Where(n => n.TenSanPham.Contains(search)).ToList();
            return View(sanPhams);
        }

        public ActionResult Detail(int id)
        {
            List<tbl_SanPham> sanPhams = db.tbl_SanPham.Where(n => n.IDSanPham == id).ToList();
            return View(sanPhams);
        }
        public ActionResult Admin(string name,string sdt)
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(tb_User _user)
        {
            if (ModelState.IsValid)
            {
                var check = db.tb_User.FirstOrDefault(s => s.Email == _user.Email);
                if (check == null)
                {
                    _user.Password = GetMD5(_user.Password);
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.tb_User.Add(_user);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return View();
                }
            }
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {
            if (ModelState.IsValid)
            {
                var f_password = GetMD5(password);
                var data = db.tb_User.Where(s => s.Email.Equals(email) && s.Password.Equals(f_password)).ToList();
                
                if (data.Count() > 0)
                {                 
                    //add session
                    Session["FullName"] = data.FirstOrDefault().FirstName + " " + data.FirstOrDefault().LastName;
                    Session["Email"] = data.FirstOrDefault().Email;
                    Session["idUser"] = data.FirstOrDefault().IDUser;
                    if (email.ToLower() == "admin2808@gmail.com" && password == "2808")
                    {
                        Session["idUser"] = "admin";
                        return Redirect("/Admin/MainAdmin/Index");                      
                    }
                        return RedirectToAction("Index");
                }
                else
                {
                    //tempData["error"] = "Tài khoản đăng nhập không đúng";
                    ViewBag.error = "Tài khoản đăng nhập không đúng";
                    return RedirectToAction("Login");
                }
            }
            return View();
        }
        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }
        //create a string MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }

    }
}
