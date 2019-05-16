using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class Properties
    {
        private int id;
        private string nameProperties;
        

        public int Id { get => id; set => id = value; }
        public string NameProperties { get => nameProperties; set => nameProperties = value; }
        
        public Properties(int id, string name, int idPoint)
        {
            this.Id = id;
            this.NameProperties = name;
        }
        public Properties(DataRow row)
        {
            this.Id = (int)row["Id"];
            this.NameProperties = row["NameProperties"].ToString();
        }
    }
}