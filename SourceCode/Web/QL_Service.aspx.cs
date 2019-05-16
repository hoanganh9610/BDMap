using Infragistics.Web.UI.GridControls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Controller;

namespace Web
{
    public partial class QL_Service : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            
            // TODO: set up data binding
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            this.bindDataPoint();
        }

        private void bindDataPoint()
        {
            this.wdgPoint.Rows.Clear();
            this.wdgPoint.DataSource = PointDAO.Instance.LoadServiceList();
            this.wdgPoint.DataBind();
        }
        protected void whdgService_RowAdding(object sender, RowAddingEventArgs e)
        {
            string userCreate = "";
            ServiceDAO.Instance.InsertService(e.Values["NameService"].ToString(),Convert.ToInt32(e.Values["TypeServiceID"].ToString()),"", false,userCreate );
        }

        protected void whdgService_RowsDeleting(object sender, RowDeletingEventArgs e)
        {
            ServiceDAO.Instance.DeleteService((int)e.Row.DataKey[0]);
        }

        protected void whdgService_RowUpdating(object sender, RowUpdatingEventArgs e)
        {
            string userEdit = "";
            ServiceDAO.Instance.EditService(e.Values["NameService"].ToString(), Convert.ToInt32(e.Values["TypeServiceID"].ToString()),e.Values["IconDisplay"].ToString(),e.Values["Status"].ToString(),userEdit,Convert.ToInt32(e.Values["IdService"].ToString()));
        }

        protected void wdgPoint_RowAdding(object sender, RowAddingEventArgs e)
        {
            string userCreate = "";
            PointDAO.Instance.InsertPoint(e.Values["NamePoint"].ToString(), e.Values["Lat"].ToString(), e.Values["Lng"].ToString(),"", e.Values["AddressPoint"].ToString(),Convert.ToInt32(e.Values["IdService"].ToString()), e.Values["Description"].ToString(),userCreate);
            this.bindDataPoint();
        }

        protected void wdgPoint_RowsDeleting(object sender, RowDeletingEventArgs e)
        {
            PointDAO.Instance.DeletePoint(Convert.ToInt32(e.Row.DataKey[0]));
            this.bindDataPoint();
        }

        protected void wdgPoint_RowUpdating(object sender, RowUpdatingEventArgs e)
        {
            string userEdit = "";
            PointDAO.Instance.EditPoint(e.Values["NamePoint"].ToString(), e.Values["Lat"].ToString(), e.Values["Lng"].ToString(), "", e.Values["AddressPoint"].ToString(), Convert.ToInt32(e.Values["IdService"].ToString()), e.Values["Description"].ToString(),false, userEdit,Convert.ToInt32(e.Row.DataKey[0]));
            this.bindDataPoint();
        }

        protected void wdgPoint_Init(object sender, EventArgs e)
        {
            BoundDataField c1 = new BoundDataField(true);
            c1.Key = "IdPoint";
            c1.Header.Text = "IdPoint";
            this.wdgPoint.Columns.Add(c1);

            BoundDataField c2 = new BoundDataField(true);
            c2.Key = "NamePoint";
            c2.Header.Text = "NamePoint";
            this.wdgPoint.Columns.Add(c2);

            BoundDataField c3 = new BoundDataField(true);
            c3.Key = "Lat";
            c3.Header.Text = "Lat";
            this.wdgPoint.Columns.Add(c3);

            BoundDataField c4 = new BoundDataField(true);
            c4.Key = "Lng";
            c4.Header.Text = "Lng";
            this.wdgPoint.Columns.Add(c4);

            BoundDataField c5 = new BoundDataField(true);
            c5.Key = "AddressPoint";
            c5.Header.Text = "AddressPoint";
            this.wdgPoint.Columns.Add(c5);

            BoundDataField c6 = new BoundDataField(true);
            c6.Key = "IdService";
            c6.Header.Text = "IdService";
            this.wdgPoint.Columns.Add(c6);

            BoundDataField c7 = new BoundDataField(true);
            c7.Key = "Description";
            c7.Header.Text = "Description";
            this.wdgPoint.Columns.Add(c7);
                      
            BoundDataField c8 = new BoundDataField(true);
            c8.Key = "Permission";
            c8.Header.Text = "Permission";
            this.wdgPoint.Columns.Add(c8);

            BoundDataField c9 = new BoundDataField(true);
            c9.Key = "UserCreate";
            c9.Header.Text = "UserCreate";
            this.wdgPoint.Columns.Add(c9);

            BoundDataField c10 = new BoundDataField(true);
            c10.Key = "CreateDate";
            c10.Header.Text = "Create Day";
            this.wdgPoint.Columns.Add(c10);

            BoundDataField c11 = new BoundDataField(true);
            c11.Key = "UserEdit";
            c11.Header.Text = "UserEdit";
            this.wdgPoint.Columns.Add(c11);

            BoundDataField c12 = new BoundDataField(true);
            c12.Key = "EditDate";
            c12.Header.Text = "EditDate";
            this.wdgPoint.Columns.Add(c12);

            RowAddingColumnSetting addingNameService = new RowAddingColumnSetting();
            addingNameService.ColumnKey = "IdService";
            addingNameService.EditorID = ddrService.ID;
            this.wdgPoint.Behaviors.EditingCore.Behaviors.RowAdding.ColumnSettings.Add(addingNameService);
        }
    }
}