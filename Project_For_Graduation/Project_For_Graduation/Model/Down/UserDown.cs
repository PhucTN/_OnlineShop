using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.Down
{
    public class UserDown
    {
        OnlineShopDbContext db = null;
        public UserDown()
        {
            db = new OnlineShopDbContext();
        }
        // Insert function
        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        // Update Function
        public bool Update(User entity)
        {
            try
            {
                var user = db.Users.Find(entity.ID);
                user.Name = entity.Name;
                /* 
                 * If you want allow edit PassWord Field
                     if(string.IsNullOrEmpty(entity.Password))
                     {
                         user.Password = entity.Password;
                     } */
                user.Address = entity.Address;
                user.Email = entity.Email;
                user.Phone = entity.Phone;
                user.ModifiedBy = entity.ModifiedBy;
                user.ModifiedDate = DateTime.Now;
                user.Status = entity.Status;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                // Ghi logging 
                return false;
            }
        }
        // Delete Function
        public bool Delete(int id)
        {
            try
            {
                var user = db.Users.Find(id);
                db.Users.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                // Ghi logging 
                return false;
            }
        }

        // Phan trang 
        public IEnumerable<User> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<User> model = db.Users;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString) || x.Name.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

        // Get byId
        public User GetById(string userName)
        {
            return db.Users.SingleOrDefault(x => x.UserName == userName);
        }
        // View Detail
        public User ViewDetail(int id)
        {
            return db.Users.Find(id); // Method tim kiem theo khoa chinh 
            // neu la string thi la SingleOrDefault 
        }
        public int Login(string userName, string passWord)
        {
            var result = db.Users.Single(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.Status == false)
                {
                    return -1;
                }
                else
                {
                    if (result.Password == passWord)
                    {
                        return 1;
                    }
                    else
                    {
                        return -2;
                    }
                }
            }
        }

        // Change Status UserDown with ajax 
        public bool ChangeStatus(long id)
        {
            var user = db.Users.Find(id);
            user.Status = !user.Status; // Swap true value true false
            db.SaveChanges();
            return user.Status;
        }
    }
}
