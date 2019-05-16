using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Controller;
using Web.Models;

namespace Web
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["TenDangNhap"] != null)
            {
                MyProfile.InnerHtml = profile();
                loadControl();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Chua Dang Nhap!');", true);
                Response.Redirect("~/Login.aspx");
            }
            
        }
        public string profile()
        {
            string user = "";
            List<User> u = UserDAO.Instance.getUserByUserName(Session["TenDangNhap"].ToString());
            foreach (User users in u)
            {
                user += "<div class=\"col-md-2\"><div><asp:Image ID=\"Image1\" Width=\"250px\" Height=\"300px\" runat=\"server\" /></div></div>";
                user += "<div class='col-md-7'><p><label>Email :</label><span>" + users.UserName + "</span></p>";
                user += "<p><label>First Name :</label><span>" + users.FirstName + "</span></p>";
                user += "<p><label>Last Name :</label><span>" + users.LastName + "</span></p>";
                user += "<p><label>Address :</label><span>" + users.Address + "</span></p>";
                user += "<p><label>Member since :</label><span>" + users.CreateDate + "</span></p></div>";
            }
            return user;
        }

       

        public void loadControl()
        {
            List<User> u = UserDAO.Instance.getUserByUserName(Session["TenDangNhap"].ToString());
            foreach (User users in u)
            {
                txtUserName.Value = users.UserName;
                Text1.Value = users.UserName;
                
                txtFirst.Value = users.FirstName;
                txtLast.Value = users.LastName;
                txtAddress.Value = users.Address;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            UserDAO.Instance.UpadteInfo(txtFirst.Value, txtLast.Value, txtAddress.Value, Session["TenDangNhap"].ToString(), txtUserName.Value);
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Update Info Success');", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<User> u = UserDAO.Instance.getUserByUserName(Session["TenDangNhap"].ToString());
            foreach (User users in u)
            {
                if(UserDAO.Instance.EndCode(Text2.Value)== users.PassWord)
                {
                    if (Text4.Value== Text3.Value)
                    {
                        UserDAO.Instance.SetPassword(UserDAO.Instance.EndCode(Text4.Value), Text1.Value);
                        System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Update Password Success!');", true);
                    }
                    else
                    {
                        System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Password dont match');", true);

                    }
                }
                else
                {
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Password Incorect');", true);
                }
            }
                

        }
    }
}