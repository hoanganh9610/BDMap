using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class Point
    {
        private int idPoint;
        private string namePoint;
        private string lat;
        private string lng;
        private string icon;
        private string addressPoint;
        private int idService;
        private string description;
        private string status;
        private string permission;
        private string userCreate;
        private DateTime createDate;
        private string userEdit;
        private DateTime editDate;

        public int IdPoint { get => idPoint; set => idPoint = value; }
        public string NamePoint { get => namePoint; set => namePoint = value; }
        public string Lat { get => lat; set => lat = value; }
        public string Lng { get => lng; set => lng = value; }
        public string Icon { get => icon; set => icon = value; }
        public string AddressPoint { get => addressPoint; set => addressPoint = value; }
        public int IdService { get => idService; set => idService = value; }
        public string Description { get => description; set => description = value; }
        public string Status { get => status; set => status = value; }
        public string Permission { get => permission; set => permission = value; }
        public string UserCreate { get => userCreate; set => userCreate = value; }
        public DateTime CreateDate { get => createDate; set => createDate = value; }
        public string UserEdit { get => userEdit; set => userEdit = value; }
        public DateTime EditDate { get => editDate; set => editDate = value; }
        public Point(int id, string name, string lat, string lng, string icon, string address, 
            int idService, string description, string status, string permission, string userCreate, 
            DateTime createDate,string username, DateTime editDate )
        {
            this.IdPoint = id;
            this.NamePoint = name;
            this.Lat = lat;
            this.Lng = lng;
            this.Icon = icon;
            this.AddressPoint = address;
            this.IdService = idService;
            this.Description = description;
            this.Status = status;
            this.Permission = permission;
            this.UserCreate = userCreate;
            this.CreateDate = createDate;
            this.UserEdit = username;
            this.EditDate = editDate;
        }
        public Point(DataRow row)
        {
            this.IdPoint = (int)row["IdPoint"];
            this.NamePoint = row["NamePoint"].ToString();
            this.Lat = row["Lat"].ToString();
            this.Lng = row["Lng"].ToString();
            this.Icon = row["Icon"].ToString();
            this.AddressPoint = row["AddressPoint"].ToString();
            this.IdService = (int)row["IdService"];
            this.Description = row["Description"].ToString();
            this.Status = row["Status"].ToString();
            this.Permission = row["Permission"].ToString();
            this.UserCreate = row["UserCreate"].ToString();
            this.CreateDate = (DateTime)row["CreateDate"];
            this.UserEdit = row["UserEdit"].ToString();
            this.EditDate = (DateTime)row["EditDate"];
        }
    }
}