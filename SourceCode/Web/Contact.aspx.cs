using Infragistics.Web.UI.GridControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindTableUser();
        }
        private void bindTableUser()
        {
            this.wdgUsers.Rows.Clear();
            this.wdgUsers.DataSource = loadtblUser;
            this.wdgUsers.DataBind();
            
        }
        
        public string image()
        {
            return "Images/admin.jpg";
        }
        
        protected void wdgUsers_Init(object sender, EventArgs e)
        {
            BoundDataField c1 = new BoundDataField(true);
            c1.Key = "UserName";
            c1.Header.Text = "UserName";
            this.wdgUsers.Columns.Add(c1);
            BoundDataField c2 = new BoundDataField(true);
            c2.Key = "PassWord";
            c2.Header.Text = "PassWord";
            this.wdgUsers.Columns.Add(c2);
            BoundDataField c3 = new BoundDataField(true);
            c3.Key = "FirstName";
            c3.Header.Text = "FirstName";
            this.wdgUsers.Columns.Add(c3);
            BoundDataField c4 = new BoundDataField(true);
            c4.Key = "LastName";
            c4.Header.Text = "LastName";
            this.wdgUsers.Columns.Add(c4);
            BoundDataField c5 = new BoundDataField(true);
            c5.Key = "Address";
            c5.Header.Text = "Address";
            this.wdgUsers.Columns.Add(c5);
            BoundDataField c6 = new BoundDataField(true);
            c6.Key = "PathImages";
            c6.Header.Text = "PathImages";
            this.wdgUsers.Columns.Add(c6);
            BoundCheckBoxField c7 = new BoundCheckBoxField(true);
            c7.Key = "Status";
            c7.Header.Text = "Status";
            this.wdgUsers.Columns.Add(c7);
            BoundDataField c8 = new BoundDataField(true);
            c8.Key = "UserCreate";
            c8.Header.Text = "Create By";
            this.wdgUsers.Columns.Add(c8);

            BoundDataField c9 = new BoundDataField(true);
            c9.Key = "CreateDate";
            c9.Header.Text = "Create Date";
            this.wdgUsers.Columns.Add(c9);

            BoundDataField c10 = new BoundDataField(true);
            c10.Key = "UserEdit";
            c10.Header.Text = "Edit By";
            this.wdgUsers.Columns.Add(c10);

            BoundDataField c11 = new BoundDataField(true);
            c11.Key = "EditDate";
            c11.Header.Text = "Edit Date";
            this.wdgUsers.Columns.Add(c11);
        }

        protected void wdgUsers_RowUpdating(object sender, Infragistics.Web.UI.GridControls.RowUpdatingEventArgs e)
        {

        }

        protected void wdgUsers_RowsDeleting(object sender, Infragistics.Web.UI.GridControls.RowDeletingEventArgs e)
        {

        }

        protected void wdgUsers_RowAdding(object sender, Infragistics.Web.UI.GridControls.RowAddingEventArgs e)
        {
            
        }
    }
}