using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class Rate
    {
        private int id;
        private int idPont;
        private string userName;
        private int numRate;

        public int Id { get => id; set => id = value; }
        public int IdPont { get => idPont; set => idPont = value; }
        public string UserName { get => userName; set => userName = value; }
        public int NumRate { get => numRate; set => numRate = value; }
        public Rate(int id, int idPoint, string user, int num)
        {
            this.Id = id;
            this.IdPont = idPoint;
            this.UserName = user;
            this.NumRate = num;
        }
        public Rate(DataRow row)
        {
            this.Id = (int)row["Id"];
            this.IdPont = (int)row["IdPont"];
            this.UserName = row["UserName"].ToString();
            this.NumRate = (int)row["NumRate"];
        }
    }
}