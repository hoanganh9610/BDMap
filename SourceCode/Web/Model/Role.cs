using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class Role
    {
        private int id;
        private string nameRole;
        private string status;
        private string permission;
        private string userCreate;
        private DateTime createDate;
        private string userEdit;
        private DateTime editDate;

        public int Id { get => id; set => id = value; }
        public string NameRole { get => nameRole; set => nameRole = value; }
        public string Status { get => status; set => status = value; }
        public string Permission { get => permission; set => permission = value; }
        public string UserCreate { get => userCreate; set => userCreate = value; }
        public DateTime CreateDate { get => createDate; set => createDate = value; }
        public string UserEdit { get => userEdit; set => userEdit = value; }
        public DateTime EditDate { get => editDate; set => editDate = value; }
        public Role(int id, string name, string status, string permision, string userCreate, DateTime createDate, string userEdit, DateTime editDate)
        {
            this.Id = id;
            this.NameRole = name;
            this.Status = status;
            this.Permission = permission;
            this.UserCreate = userCreate;
            this.CreateDate = createDate;
            this.UserEdit = userEdit;
            this.EditDate = editDate;
        }
        public Role(DataRow row)
        {
            this.Id = (int)row["Id"];
            this.NameRole = row["NameRole"].ToString();
            this.Status = row["Status"].ToString();
            this.Permission = row["Permission"].ToString();
            this.UserCreate = row["UserCreate"].ToString();
            this.CreateDate = (DateTime)row["CreateDate"];
            this.UserEdit = row["UserEdit"].ToString();
            this.EditDate = (DateTime)row["EditDate"];
        }
    }
}