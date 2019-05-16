using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Web.Models;

namespace Web.Controller
{
    public class PointDAO
    {
        private static PointDAO instance;
        public static PointDAO Instance
        {
            get
            {
                if (instance == null) instance = new PointDAO();
                return PointDAO.instance;
            }
            private set { PointDAO.instance = value; }
        }
        public List<Point> LoadServiceList()
        {
            List<Point> pointlist = new List<Point>();
            string query = "SELECT * FROM Point ";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Point p = new Point(item);
                pointlist.Add(p);
            }

            return pointlist;
        }

        public List<Point> LoadPointByService(int idService)
        {
            List<Point> points = new List<Point>();
            string query = "select * from POINT where IdService='" + idService + "'";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow dr in data.Rows)
            {
                Point point = new Point(dr);
                points.Add(point);
            }
            return points;
        }

        public bool InsertPoint(string name,string lat, string lng,string icon, string address, int idService, string description, string userCreate)
        {

            string query = "INSERT INTO Point VALUES(N'"+name+"','"+lat+"','"+lng+"','"+icon+"',N'"+address+"',"+idService+",N'"+description+"',0,'','"+userCreate+"',GETDATE(),'','')";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool EditPoint(string name,string lat, string lng,string icon, string address, int idService, string description,  bool status, string userEdit, int id)
        {

            string query = "UPDATE Point SET NamePoint=N'"+name+"', Lat='"+lat+"', Lng='"+lng+"', Icon='"+icon+"', AddressPoint=N'"+address+"', IdService="+idService+", Description=N'"+description+"', Status='"+status+"',UserEdit='', EditDate=GETDATE() WHERE IdPoint=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool DeletePoint(int id)
        {
            string query = "DELETE FROM Point WHERE IdPoint=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool UpdatePermission(string per, int id)
        {
            string query = "UPDATE Point SET Permission='"+per+"' WHERE IdPoint=" + id;
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }
    }
}