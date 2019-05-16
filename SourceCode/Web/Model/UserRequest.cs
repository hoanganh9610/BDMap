using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace Web.Model
{
    public class UserRequest
    {
        private string userName;
        private string fullName;
        private int roleCurrent;
        private int roleRequest;
        private DateTime dateRequest;

        public string UserName { get => userName; set => userName = value; }
        public string FullName { get => fullName; set => fullName = value; }
        public int RoleCurrent { get => roleCurrent; set => roleCurrent = value; }
        public int RoleRequest { get => roleRequest; set => roleRequest = value; }
        public DateTime DateRequest { get => dateRequest; set => dateRequest = value; }
        public UserRequest(string user, string fullName, int role1, int role2, DateTime date)
        {
            this.UserName = user;
            this.FullName = fullName;
            this.RoleCurrent = role1;
            this.RoleRequest = role2;
            this.DateRequest = date;
        }
        public UserRequest(DataRow row)
        {
            this.UserName = row["UserName"].ToString();
            this.FullName = row["FullName"].ToString();
            this.RoleCurrent = (int)row["CurrentRole"];
            this.RoleRequest = (int)row["RoleRequest"];
            this.DateRequest = (DateTime)row["CreateDate"];
        }
    }
}