using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Controller
{
    public class RateDAO
    {
        private static RateDAO instance;
        public static RateDAO Instance
        {
            get
            {
                if (instance == null) instance = new RateDAO();
                return RateDAO.instance;
            }
            private set { RateDAO.instance = value; }
        }
        public bool Insert(int idPoint, string username, int numRate)
        {

            string query = "INSERT INTO Rate VALUES(" + idPoint + ", '"+username+"', "+numRate+")";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }
    }
}