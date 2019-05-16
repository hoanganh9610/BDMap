using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Controller;

namespace Web
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if(user.Value!="")
            {
                if(re_pass.Value !=pass.Value)
                {
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Password Incorrect');", true);
                }
                else
                {
                    UserDAO.Instance.InsertAcount(user.Value, UserDAO.Instance.EndCode(pass.Value), first.Value, last.Value);
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('Register Successed');", true);
                }
            }
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('User cannot be empty');", true);
        }
    }
}