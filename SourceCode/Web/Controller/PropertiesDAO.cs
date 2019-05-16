using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Controller
{
    public class PropertiesDAO
    {

        private static PropertiesDAO instance;
        public static PropertiesDAO Instance
        {
            get
            {
                if (instance == null) instance = new PropertiesDAO();
                return PropertiesDAO.instance;
            }
            private set { PropertiesDAO.instance = value; }
        }
        public bool InsertProperties(string name)
        {

            string query = "INSERT INTO Properties VALUES('" + name + "')";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool EditProperties(string name, int id)
        {

            string query = "UPDATE Properties SET NameProperties='" + name + "' WHERE IdProperties=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool DeleteProperties(int id)
        {
            string query = "DELETE FROM Properties WHERE Id" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

    }
}