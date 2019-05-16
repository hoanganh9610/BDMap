using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Web.Model
{
    public class PropertiesPoint
    {
        private int id;
        private int idProperties;
        private int idPoint;

        public int Id { get => id; set => id = value; }
        public int IdProperties { get => idProperties; set => idProperties = value; }
        public int IdPoint { get => idPoint; set => idPoint = value; }

        public PropertiesPoint(int id, int idProperties, int idPoint)
        {
            this.Id = id;
            this.IdProperties = idProperties;
            this.IdPoint = idPoint;
        }
        public PropertiesPoint(DataRow row)
        {
            this.Id = (int)row["Id"];
            this.IdProperties = (int)row["IdProperties"];
            this.IdPoint = (int)row["IdPoint"];
        }
    }
}