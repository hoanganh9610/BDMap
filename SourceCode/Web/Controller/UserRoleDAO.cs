using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Web.Models;

namespace Web.Controller
{
    public class UserRoleDAO
    {
        private static UserRoleDAO instance;
        public static UserRoleDAO Instance
        {
            get
            {
                if (instance == null) instance = new UserRoleDAO();
                return UserRoleDAO.instance;
            }
            private set { UserRoleDAO.instance = value; }
        }

        public bool InsertUserRole(string username, int idRole, bool status, string userCreate)
        {
            string query = "INSERT INTO UserRole VALUES('"+username+"','"+idRole+"','"+status+"','"+userCreate+"',GETDATE(),'','')";            
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool EditUserRole(string name, int idRole, bool status, string userEdit, int id)
        {
            string query = "UPDATE UserRole SET UserName='" + name + "',IdRole='"+idRole+"', Status='" + status + "', UserEdit='" + userEdit + "',EditDate=GETDATE() WHERE Id=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool DeleteUserRole(int id)
        {
            string query = "DELETE FROM UserRole WHERE Id=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool UpdatePermission(bool status,int id)
        {
            string query = "UPDATE UserRole SET Status='"+status+"' WHERE Id=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }
    }
}