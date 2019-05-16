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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDangNhap"] != null || Session["MatKhau"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }
        private static DataSet ThucThiStore_DataSet(string StoredProcedure, params SqlParameter[] Parameters)
        {
            string ConnectionString = @"Data Source=ASUS-PC;Initial Catalog=BinhDuongMap;Integrated Security=True";
            //string ConnectionString = @"Data Source=ASUS-PC;Initial Catalog=BinhDuongMap;Integrated Security=True";
            SqlConnection Conn = new SqlConnection(ConnectionString);
            SqlCommand Command = new SqlCommand(StoredProcedure, Conn);
            if (Parameters != null)
            {
                Command.Parameters.Clear();
                Command.Parameters.AddRange(Parameters);
            }
            DataSet ds = new DataSet(); SqlDataAdapter da = new SqlDataAdapter(StoredProcedure, Conn);
            Command.CommandType = CommandType.StoredProcedure;
            da.SelectCommand = Command;
            try
            {
                Conn.Open();
                da.Fill(ds);
            }
            finally
            {
                if (Conn.State == ConnectionState.Open)
                    Conn.Close();
                Conn.Dispose();
            }
            return ds;
        }
        private DataTable StoreToDataTable(string TenDangNhap, string MatKhau)
        {
            SqlParameter[] arrParam = {
            new SqlParameter("@TenDangNhap", SqlDbType.NVarChar),
            new SqlParameter("@MatKhau", SqlDbType.NVarChar)
            };
            arrParam[0].Value = TenDangNhap;
            arrParam[1].Value = MatKhau;
            return ThucThiStore_DataSet("spUsers_KiemTraDangNhap", arrParam).Tables[0];
        }

        private void KiemTraNhap(string TenDangNhap, string MatKhau)
        {
            DataTable dtb = StoreToDataTable(TenDangNhap, MatKhau);
            int num = 0;
            if (dtb.Rows.Count > 0)
            {
                num = int.Parse("0" + dtb.Rows[0][0]);
                switch (num)
                {
                    case 3: // Khai báo Session cho phép đăng nhập
                        Session["TenDangNhap"] = txtUserName.Value.ToString().ToLower();
                        Session["MatKhau"] = UserDAO.Instance.EndCode(txtPass.Value);
                        Session["FullName"] = dtb.Rows[0][1].ToString()+" "+ dtb.Rows[0][2].ToString(); 
                        Session["Role"] = dtb.Rows[0][3].ToString();
                        Session["Images"] = dtb.Rows[0][4].ToString();
                        Response.Redirect("Default.aspx");
                        break;
                    case 1: //Thông báo tên đăng nhập không tồn tại
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Tên đăng nhập không tồn tại');", true);
                        break;
                    case 2: // thông báo sai mật khẩu
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi; Mật khẩu đăng nhập không đúng!');", true);
                        break;

                }
            }
            dtb.Dispose();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            KiemTraNhap(txtUserName.Value + "", UserDAO.Instance.EndCode(txtPass.Value).Trim());
        }
    }
}