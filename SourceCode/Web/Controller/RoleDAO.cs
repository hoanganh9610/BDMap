using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Web.Models;

namespace Web.Controller
{
    public class RoleDAO
    {
        private static RoleDAO instance;
        public static RoleDAO Instance
        {
            get
            {
                if (instance == null) instance = new RoleDAO();
                return RoleDAO.instance;
            }
            private set { RoleDAO.instance = value; }
        }

        public List<Role> LoadListRoles()
        {
            List<Role> roleList = new List<Role>();
            string query = "SELECT * FROM Role";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Role role = new Role(item);
                roleList.Add(role);
            }

            return roleList;
        }

        public bool InsertRole(string name, bool status, string userCreate)
        {

            string query = "INSERT INTO ROLE VALUES('" + name + "','" + status + "',N'','" + userCreate + "',GETDATE(),'','');";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool EditRole(string name, bool status, string userEdit, int id)
        {

            string query = "UPDATE Role SET NameRole='" + name + "', Status='" + status + "', UserEdit='" + userEdit + "',EditDate=GETDATE() WHERE Id=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool UpdatePermission(string per,  int id)
        {
            string query = "UPDATE Role SET Permission='" + per + "' WHERE Id=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }
        public bool DeleteRole(int id)
        {
            string query = "DELETE FROM Role WHERE Id='" + id+"'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

    }
}