using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class UserRole
    {
        private int id;
        private string userName;
        private int idRole;
        private string status;
        private string userCreate;
        private DateTime createDate;
        private string userEdit;
        private DateTime editDate;

        public int Id { get => id; set => id = value; }
        public string UserName { get => userName; set => userName = value; }
        public int IdRole { get => idRole; set => idRole = value; }
        public string Status { get => status; set => status = value; }
        public string UserCreate { get => userCreate; set => userCreate = value; }
        public DateTime CreateDate { get => createDate; set => createDate = value; }
        public string UserEdit { get => userEdit; set => userEdit = value; }
        public DateTime EditDate { get => editDate; set => editDate = value; }
        public UserRole(int id, string username, int idRole, string status, string user, DateTime createDate, string userEdit, DateTime editDate)
        {
            this.Id = id;
            this.UserName = username;
            this.IdRole = idRole;
            this.Status = status;
            this.UserCreate = user;
            this.CreateDate = createDate;
            this.UserEdit = userEdit;
            this.EditDate = editDate;
        }
        public UserRole(DataRow row)
        {
            this.Id = (int)row["Id"];
            this.UserName = row["UserName"].ToString();
            this.IdRole = (int)row["IdRole"];
            this.Status = row["Status"].ToString();
            this.UserCreate = row["UserCreate"].ToString();            
            this.CreateDate = (DateTime)row["CreateDate"];
            this.UserEdit = row["UserEdit"].ToString();
            this.EditDate = (DateTime)row["EditDate"];
        }
    }
}