using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class TypeService
    {
        private int idType;
        private string nameType;
        private string iconType;

        public int IdType { get => idType; set => idType = value; }
        public string NameType { get => nameType; set => nameType = value; }
        public string IconType { get => iconType; set => iconType = value; }
        public TypeService(int idType, string nameType, string iconType)
        {
            this.IdType = idType;
            this.NameType = nameType;
            this.IconType = iconType;
        }
        public TypeService(DataRow row)
        {
            this.IdType = (int)row["IdType"];
            this.NameType = row["NameType"].ToString();
            this.IconType = row["IconType"].ToString();

        }
    }
}