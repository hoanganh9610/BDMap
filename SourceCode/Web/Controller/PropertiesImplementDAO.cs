using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Controller
{
    public class ImplementDAO
    {
        private static ImplementDAO instance;
        public static ImplementDAO Instance
        {
            get
            {
                if (instance == null) instance = new ImplementDAO();
                return ImplementDAO.instance;
            }
            private set { ImplementDAO.instance = value; }
        }
        public bool Insert(string name, string description,int idPP)
        {

            string query = "INSERT INTO PropertiesImplement VALUES(N'"+name+"',N'"+description+"',"+idPP+")";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool Edit(string name,string description, int idPP, int id)
        {
            string query = "UPDATE PropertiesImplement SET NamePropIm='" + name + "', Descripton='"+ description + "', IdPropertiesPoint="+idPP+" WHERE Id=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool Delete(int id)
        {
            string query = "DELETE FROM PropertiesImplement  WHERE Id" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }
    }
}