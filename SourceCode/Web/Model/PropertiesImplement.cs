using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class PropertiesImplement
    {
        private int id;
        private string namePropIm;
        private string descripton;
        private int idProperties;

        public int Id { get => id; set => id = value; }
        public string NamePropIm { get => namePropIm; set => namePropIm = value; }
        public string Descripton { get => descripton; set => descripton = value; }
        public int IdProperties { get => idProperties; set => idProperties = value; }
        public PropertiesImplement(int id, string name, string description, int idProp)
        {
            this.Id = id;
            this.NamePropIm = name;
            this.Descripton = description;
            this.IdProperties = idProp;
        }
        public PropertiesImplement(DataRow row)
        {
            this.Id = (int)row["Id"];
            this.NamePropIm = row["NamePropIm"].ToString();
            this.Descripton = row["Descripton"].ToString();
            this.IdProperties = (int)row["IdProperties"];
        }
    }
}