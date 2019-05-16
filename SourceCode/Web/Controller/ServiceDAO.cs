using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Web.Models;

namespace Web.Controller
{
    public class ServiceDAO
    {
        private static ServiceDAO instance;
        public static ServiceDAO Instance
        {
            get
            {
                if (instance == null) instance = new ServiceDAO();
                return ServiceDAO.instance;
            }
            private set { ServiceDAO.instance = value; }
        }

        public List<Service> LoadServiceListByType(int idType)
        {
            List<Service> serviceList = new List<Service>();
            string query = "SELECT * FROM Service s WHERE s.TypeServiceID="+idType;
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Service service = new Service(item);
                serviceList.Add(service);
            }

            return serviceList;
        }

        public List<Service> LoadServiceList()
        {
            List<Service> serviceList = new List<Service>();
            string query = "SELECT * FROM Service ";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Service service = new Service(item);
                serviceList.Add(service);
            }

            return serviceList;
        }

        public bool InsertService(string name, int idType,string icon, bool status, string userCreate)
        {

            string query = "INSERT INTO Service VALUES	   ('"+name+"',"+idType+",'"+icon+"','true','','"+userCreate+"',GETDATE(),'','')";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool EditService(string name,int idType,string icon, string status, string userEdit, int id)
        {
            string query = "UPDATE Service SET NameService='"+name+"', TypeServiceID="+idType+", IconDisplay='"+icon+"', Status="+status+", UserEdit='"+userEdit+"', EditDate=GETDATE() WHERE IdService="+id;
            int result = DataProvider.Instance.ExecuteNonQuery (query);
            return result > 0;
        }

        public bool DeleteService(int id)
        {
            string query = "DELETE FROM Service WHERE IdService='" + id + "'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool UpdatePermission(string per, int id)
        {
            string query = "UPDATE Service SET Permission='" + per + "' WHERE IdService=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }
    }
}