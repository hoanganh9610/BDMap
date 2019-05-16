using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class Service
    {
        private int idService;
        private string nameService;
        private int typeServiceID;
        private string iconDisplay;
        private string status;
        private string permission;
        private string userCreate;
        private DateTime createDate;
        private string userEdit;
        private DateTime editDate;

        public int IdService { get => idService; set => idService = value; }
        public string NameService { get => nameService; set => nameService = value; }
        public int TypeServiceID { get => typeServiceID; set => typeServiceID = value; }
        public string IconDisplay { get => iconDisplay; set => iconDisplay = value; }
        public string Status { get => status; set => status = value; }
        public string Permission { get => permission; set => permission = value; }
        public string UserCreate { get => userCreate; set => userCreate = value; }
        public DateTime CreateDate { get => createDate; set => createDate = value; }
        public string UserEdit { get => userEdit; set => userEdit = value; }
        public DateTime EditDate { get => editDate; set => editDate = value; }

        public Service(int idService, string nameService, int idType, string icon, string status,
            string permission, string userCreate, DateTime createDate, string userEdit, DateTime editDate)
        {
            this.IdService = idService;
            this.NameService = nameService;
            this.TypeServiceID = idType;
            this.IconDisplay = icon;
            this.Status = status;
            this.Permission = permission;
            this.UserCreate = userCreate;
            this.CreateDate = createDate;
            this.UserEdit = userEdit;
            this.EditDate = editDate;
        }
        public Service(DataRow row)
        {
            this.IdService = (int)row["IdService"];
            this.NameService = row["NameService"].ToString();
            this.TypeServiceID = (int)row["TypeServiceID"];
            this.IconDisplay = row["IconDisplay"].ToString();
            this.Status = row["Status"].ToString();
            this.Permission = row["Permission"].ToString();
            this.UserCreate = row["UserCreate"].ToString();
            this.CreateDate = (DateTime)row["CreateDate"];
            this.UserEdit = row["UserEdit"].ToString();
            this.EditDate = (DateTime)row["EditDate"];
        }
    }
}