using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Controller
{
    public class PropertiesPointDAO
    {
        private static PropertiesPointDAO instance;
        public static PropertiesPointDAO Instance
        {
            get
            {
                if (instance == null) instance = new PropertiesPointDAO();
                return PropertiesPointDAO.instance;
            }
            private set { PropertiesPointDAO.instance = value; }
        }

        public bool InsertPropertiesPoint(int idProp, int idPoint)
        {

            string query = "INSERT INTO PropertiesPoint VALUES('" + idProp + "', '"+idPoint+"')";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool EditPropertiesPoint(int id, int idProp, int idPoint)
        {

            string query = "UPDATE PropertiesPoint SET IdProperties='" + idProp + "', IdPoint='"+idPoint+"' WHERE Id=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool DeletePropertiesPoint(int id)
        {
            string query = "DELETE FROM PropertiesPoint WHERE Id" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }
    }
}