using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class User
    {
        private string userName;
        private string passWord;
        private string firstName;
        private string lastName;
        private string address;
        private string pathImages;
        private string status;
        private string userCreate;
        private DateTime createDate;
        private string userEdit;
        private DateTime editDate;

        public string UserName { get => userName; set => userName = value; }
        public string PassWord { get => passWord; set => passWord = value; }
        public string FirstName { get => firstName; set => firstName = value; }
        public string LastName { get => lastName; set => lastName = value; }
        public string Address { get => address; set => address = value; }
        public string PathImages { get => pathImages; set => pathImages = value; }
        public string Status { get => status; set => status = value; }
        public string UserCreate { get => userCreate; set => userCreate = value; }
        public DateTime CreateDate { get => createDate; set => createDate = value; }
        public string UserEdit { get => userEdit; set => userEdit = value; }
        public DateTime EditDate { get => editDate; set => editDate = value; }
        public User(string user, string pass, string first, string last, string address, string path, string status, string userCreate, DateTime createDate, string userEdit, DateTime editDate)
        {
            this.UserName = user;
            this.PassWord = pass;
            this.FirstName = first;
            this.LastName = last;
            this.Address = address;
            this.PathImages = path;
            this.Status = status;
            this.UserCreate = userCreate;
            this.CreateDate = createDate;
            this.UserEdit = userEdit;
            this.EditDate = editDate;
        }   
        public User(DataRow row)
        {
            this.UserName = row["UserName"].ToString();
            this.PassWord = row["PassWord"].ToString();
            this.FirstName = row["FirstName"].ToString();
            this.LastName = row["LastName"].ToString();
            this.Address = row["Address"].ToString();
            this.PathImages= row["PathImages"].ToString();
            this.Status = row["Status"].ToString();
            this.UserCreate = row["UserCreate"].ToString();
            this.CreateDate = (DateTime)row["CreateDate"];
            this.UserEdit = row["UserEdit"].ToString();
            this.EditDate = (DateTime)row["EditDate"];
        }
    }
}