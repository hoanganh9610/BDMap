using Infragistics.Documents.Excel;
using Infragistics.Web.UI.GridControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Controller;
using Web.Models;

namespace Web
{
    public partial class QL_Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('You are not logged in!');", true);
                Response.Redirect("~/Default.aspx");
            }
            else if(Session["Role"].ToString()!="Admin")
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Access Denied!');", true);
                //Response.Redirect("~/Default.aspx");
            }
            else
            {
                this.bindDataRole();
                this.bindDataUserRole();
                this.bindDataUsers();
            }
            
           // listRequest.InnerHtml = loadAllRequest();
        }
        private void bindDataRole()
        {
            this.wdgRole.Rows.Clear();
            this.wdgRole.DataSource = RoleDAO.Instance.LoadListRoles();
            this.wdgRole.DataBind();
        }
        private void bindDataUserRole()
        {
            this.wdgGroupRole.Rows.Clear();
            this.wdgGroupRole.DataSource = loadUserRole;
            this.wdgGroupRole.DataBind();
        }
        public string image()
        {
            return "Images/admin.jpg";
        }
        private void bindDataUsers()
        {
            this.wdgUser.Rows.Clear();
            this.wdgUser.DataSource = UserDAO.Instance.LoadListUser();
            this.wdgUser.DataBind();
        }

        protected void wdgRole_RowsDeleting(object sender, Infragistics.Web.UI.GridControls.RowDeletingEventArgs e)
        {
            RoleDAO.Instance.DeleteRole(Convert.ToInt32(e.Row.DataKey[0]));
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Delete Role Successed');", true);
            this.bindDataRole();
        }

        protected void wdgRole_RowUpdating(object sender, Infragistics.Web.UI.GridControls.RowUpdatingEventArgs e)
        {
            if (Session["TenDangNhap"] != null)
            {
                string userEdit = Session["TenDangNhap"].ToString();
                RoleDAO.Instance.EditRole(e.Values["NameRole"].ToString(), Convert.ToBoolean(e.Values["Status"].ToString()), Session["TenDangNhap"].ToString(), Convert.ToInt32(e.Row.DataKey[0].ToString()));
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Edit Role Succses');", true);
                this.bindDataRole();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Create Role Failed');", true);
            }
        }

        protected void wdgRole_RowAdding(object sender, Infragistics.Web.UI.GridControls.RowAddingEventArgs e)
        {
            if (Session["TenDangNhap"] != null)
            {
                string userCrete = Session["TenDangNhap"].ToString();
                RoleDAO.Instance.InsertRole(e.Values["NameRole"].ToString(), false, userCrete);
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Create Role Successed!');", true);
                this.bindDataRole();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Create Role Failed');", true);
            }
        }



        protected void wdgRole_Init(object sender, EventArgs e)
        {
            BoundDataField c1 = new BoundDataField(true);
            c1.Key = "Id";
            c1.Header.Text = "Id";
            this.wdgRole.Columns.Add(c1);

            BoundDataField c2 = new BoundDataField(true);
            c2.Key = "NameRole";
            c2.Header.Text = "NameRole";
            this.wdgRole.Columns.Add(c2);

            BoundCheckBoxField c3 = new BoundCheckBoxField(true);
            c3.Key = "Status";
            c3.Header.Text = "Status";
            this.wdgRole.Columns.Add(c3);

            BoundDataField c4 = new BoundDataField(true);
            c4.Key = "Permission";
            c4.Header.Text = "Permission";
            this.wdgRole.Columns.Add(c4);

            BoundDataField c5 = new BoundDataField(true);
            c5.Key = "UserCreate";
            c5.Header.Text = "Create By";
            this.wdgRole.Columns.Add(c5);

            BoundDataField c6 = new BoundDataField(true);
            c6.Key = "CreateDate";
            c6.Header.Text = "Create Date";
            this.wdgRole.Columns.Add(c6);

            BoundDataField c7 = new BoundDataField(true);
            c7.Key = "UserEdit";
            c7.Header.Text = "Edit By";
            this.wdgRole.Columns.Add(c7);

            BoundDataField c8 = new BoundDataField(true);
            c8.Key = "EditDate";
            c8.Header.Text = "Edit Date";
            this.wdgRole.Columns.Add(c8);


        }
        protected void btnSaveRole_Click(object sender, EventArgs e)
        {
            // wdgRole_RowUpdating();
        }
        protected void btnExportRole_Click(object sender, EventArgs e)
        {
            this.weRole.DataExportMode = new DataExportMode();
            this.weRole.DownloadName = "List Role" + DateTime.Now.ToString().Replace(" ", "");
            this.weRole.WorkbookFormat = WorkbookFormat.Excel2007;
            this.weRole.Export(this.wdgRole);
        }
        protected void wdgGroupRole_RowAdding(object sender, RowAddingEventArgs e)
        {
            if (Session["TenDangNhap"] != null)
            {
                string userCrete = Session["TenDangNhap"].ToString();
                UserRoleDAO.Instance.InsertUserRole(e.Values["UserName"].ToString(), Int32.Parse(e.Values["NameRole"].ToString()), false, userCrete);
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Add Role Successed!');", true);
                this.bindDataUserRole();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Add Role Failed');", true);
            }
        }

        protected void wdgGroupRole_RowsDeleting(object sender, RowDeletingEventArgs e)
        {
            UserRoleDAO.Instance.DeleteUserRole(Convert.ToInt32(e.Row.DataKey[0]));
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Delete Role Successed');", true);
            this.bindDataRole();
        }

        protected void wdgGroupRole_RowUpdating(object sender, RowUpdatingEventArgs e)
        {
            if (Session["TenDangNhap"] != null)
            {
                string userEdit = Session["TenDangNhap"].ToString();
                UserRoleDAO.Instance.EditUserRole(e.Values["UserName"].ToString(), Convert.ToInt32(e.Values["NameRole"].ToString()), Convert.ToBoolean(e.Values["Status"].ToString()), Session["TenDangNhap"].ToString(), Convert.ToInt32(e.Row.DataKey[0].ToString()));
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Edit Role Succses');", true);
                this.bindDataUserRole();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Create Role Failed');", true);
            }
        }

        protected void wdgGroupRole_Init(object sender, EventArgs e)
        {
            BoundDataField col1 = new BoundDataField(true);
            col1.Key = "Id";
            col1.Header.Text = "Id";
            this.wdgGroupRole.Columns.Add(col1);

            BoundDataField col2 = new BoundDataField(true);
            col2.Key = "UserName";
            col2.Header.Text = "UserName";
            this.wdgGroupRole.Columns.Add(col2);

            BoundDataField col3 = new BoundDataField(true);
            col3.Key = "NameRole";
            col3.Header.Text = "NameRole";
            this.wdgGroupRole.Columns.Add(col3);

            BoundCheckBoxField col4 = new BoundCheckBoxField(true);
            col4.Key = "Status";
            col4.Header.Text = "Status";
            this.wdgGroupRole.Columns.Add(col4);

            BoundDataField col5 = new BoundDataField(true);
            col5.Key = "UserCreate";
            col5.Header.Text = "Create By";
            this.wdgGroupRole.Columns.Add(col5);

            BoundDataField col6 = new BoundDataField(true);
            col6.Key = "CreateDate";
            col6.Header.Text = "Create Date";
            this.wdgGroupRole.Columns.Add(col6);

            BoundDataField col7 = new BoundDataField(true);
            col7.Key = "UserEdit";
            col7.Header.Text = "Edit By";
            this.wdgGroupRole.Columns.Add(col7);

            BoundDataField col8 = new BoundDataField(true);
            col8.Key = "EditDate";
            col8.Header.Text = "Edit Date";
            this.wdgGroupRole.Columns.Add(col8);


            EditingColumnSetting columnSetting = new EditingColumnSetting();
            columnSetting.ColumnKey = "NameRole";
            columnSetting.EditorID = ddlRole.ID;

            RowAddingColumnSetting addingNameRole = new RowAddingColumnSetting();
            addingNameRole.ColumnKey = "NameRole";
            addingNameRole.EditorID = ddlRole.ID;

            RowAddingColumnSetting addingUserName = new RowAddingColumnSetting();
            addingUserName.ColumnKey = "UserName";
            addingUserName.EditorID = ddrUser.ID;

            this.wdgGroupRole.Behaviors.EditingCore.Behaviors.CellEditing.ColumnSettings.Add(columnSetting);
            this.wdgGroupRole.Behaviors.EditingCore.Behaviors.RowAdding.ColumnSettings.Add(addingNameRole);
            this.wdgGroupRole.Behaviors.EditingCore.Behaviors.RowAdding.ColumnSettings.Add(addingUserName);

        }
        protected void wdgUser_Init(object sender, EventArgs e)
        {
            BoundDataField c1 = new BoundDataField(true);
            c1.Key = "UserName";
            c1.Header.Text = "UserName";
            this.wdgUser.Columns.Add(c1);
            BoundDataField c2 = new BoundDataField(true);
            c2.Key = "PassWord";
            c2.Header.Text = "PassWord";
            this.wdgUser.Columns.Add(c2);
            BoundDataField c3 = new BoundDataField(true);
            c3.Key = "FirstName";
            c3.Header.Text = "FirstName";
            this.wdgUser.Columns.Add(c3);
            BoundDataField c4 = new BoundDataField(true);
            c4.Key = "LastName";
            c4.Header.Text = "LastName";
            this.wdgUser.Columns.Add(c4);
            BoundDataField c5 = new BoundDataField(true);
            c5.Key = "Address";
            c5.Header.Text = "Address";
            this.wdgUser.Columns.Add(c5);
            BoundDataField c6 = new BoundDataField(true);
            c6.Key = "PathImages";
            c6.Header.Text = "PathImages";
            this.wdgUser.Columns.Add(c6);
            BoundCheckBoxField c7 = new BoundCheckBoxField(true);
            c7.Key = "Status";
            c7.Header.Text = "Status";
            this.wdgUser.Columns.Add(c7);
            BoundDataField c8 = new BoundDataField(true);
            c8.Key = "UserCreate";
            c8.Header.Text = "Create By";
            this.wdgUser.Columns.Add(c8);

            BoundDataField c9 = new BoundDataField(true);
            c9.Key = "CreateDate";
            c9.Header.Text = "Create Date";
            this.wdgUser.Columns.Add(c9);

            BoundDataField c10 = new BoundDataField(true);
            c10.Key = "UserEdit";
            c10.Header.Text = "Edit By";
            this.wdgUser.Columns.Add(c10);

            BoundDataField c11 = new BoundDataField(true);
            c11.Key = "EditDate";
            c11.Header.Text = "Edit Date";
            this.wdgUser.Columns.Add(c11);
        }

        protected void wdgUser_RowsDeleting(object sender, Infragistics.Web.UI.GridControls.RowDeletingEventArgs e)
        {
            UserDAO.Instance.DeleteUser(e.Row.DataKey[0].ToString());
            bindDataUsers();
        }

        protected void wdgUser_RowAdding(object sender, Infragistics.Web.UI.GridControls.RowAddingEventArgs e)
        {
            string userCreate = "";
            UserDAO.Instance.InsertUser(e.Values["UserName"].ToString(),UserDAO.Instance.EndCode(e.Values["PassWord"].ToString()), e.Values["FirstName"].ToString(), e.Values["LastName"].ToString(), e.Values["Address"].ToString(), "admin");
            UserRoleDAO.Instance.InsertUserRole(e.Values["UserName"].ToString(), 50,true, userCreate);
            bindDataUsers();
        }

        protected void wdgUser_RowUpdating(object sender, RowUpdatingEventArgs e)
        {
            UserDAO.Instance.UpadteUser(e.Values["FirstName"].ToString(), e.Values["LastName"].ToString(), e.Values["Address"].ToString(), e.Values["PathImages"].ToString(), Convert.ToBoolean(e.Values["Status"].ToString()), "admin", e.Values["UserName"].ToString());
            bindDataUsers();
        }
        

        protected void wdgRequest_RowsDeleting(object sender, RowDeletingEventArgs e)
        {
            UserRoleDAO.Instance.DeleteUserRole(Convert.ToInt32(e.Row.DataKey[0]));
        }

        protected void wdgRequest_RowUpdating(object sender, RowUpdatingEventArgs e)
        {
            UserRoleDAO.Instance.UpdatePermission(true, Convert.ToInt32(e.Row.DataKey[0]));
        }
    }
}