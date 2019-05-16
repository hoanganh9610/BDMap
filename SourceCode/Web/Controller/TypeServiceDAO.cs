using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Web.Models;

namespace Web.Controller
{
    public class TypeServiceDAO
    {
        private static TypeServiceDAO instance;
        public static TypeServiceDAO Instance
        {
            get
            {
                if (instance == null) instance = new TypeServiceDAO();
                return TypeServiceDAO.instance;
            }
            private set { TypeServiceDAO.instance = value; }
        }

        public List<TypeService> LoadTypeServiceList()
        {
            List<TypeService> typeServiceList = new List<TypeService>();
            DataTable data = DataProvider.Instance.ExecuteQuery("USP_GetTypeServiceList");

            foreach (DataRow item in data.Rows)
            {
                TypeService typeService = new TypeService(item);
                typeServiceList.Add(typeService);
            }

            return typeServiceList;
        }
    }
}