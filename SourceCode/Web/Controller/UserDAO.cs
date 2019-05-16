using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using Web.Models;

namespace Web.Controller
{
    public class UserDAO
    {
        private static UserDAO instance;
        public static UserDAO Instance
        {
            get
            {
                if (instance == null) instance = new UserDAO();
                return UserDAO.instance;
            }
            private set { UserDAO.instance = value; }
        }

        public List<User> getUserByUserName(string user)
        {
            List<User> roleList = new List<User>();
            string query = "SELECT * FROM Users where UserName='" + user + "'";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                User role = new User(item);
                roleList.Add(role);
            }

            return roleList;
        }
        //public bool getUserByUserName(string user)
        //{
        //    string query = "SELECT * FROM Users where UserName='" + user + "'";
        //    int result = DataProvider.Instance.ExecuteNonQuery(query);
        //    return result > 0;
        //}



        public List<User> LoadListUser()
        {
            List<User> roleList = new List<User>();
            string query = "SELECT * FROM Users";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                User role = new User(item);
                roleList.Add(role);
            }

            return roleList;
        }
        public bool InsertAcount(string user, string passWord, string fName, string lName)
        {
            string query = "INSERT INTO Users VALUES('"+user+"','"+passWord+"',N'"+fName+"',N'"+lName+"',N'Bình Dương','default.jpg',1,'"+user+"',GETDATE(),'','');";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool SetPassword(string pass, string user)
        {
            string query = "UPDATE Users SET PassWord='"+pass+"' WHERE UserName='"+user+"'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public string EndCode(string password)
        {
            UnicodeEncoding encoding = new UnicodeEncoding();
            Byte[] hashBytes = encoding.GetBytes(password);
            // Compute the SHA-1 hash
            SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();
            Byte[] cryptPassword = sha1.ComputeHash(hashBytes);
            return BitConverter.ToString(cryptPassword);
        }

        public string LoadTableAccount(int index, int pageSize)
        {
            string rowAccount = "";
            List<Role> listRole = RoleDAO.Instance.LoadListRoles();
            rowAccount += "<script type='text/javascript'>";
            rowAccount += "function bindDataFromTableAccount(val, val2) {";

            rowAccount += "var Id = document.getElementById('txtId');";
            rowAccount += "var NameRole = document.getElementById('txtNameRole');";
                       
            rowAccount += "Id.value=val;";
            rowAccount += "NameRole.value= val2";
            rowAccount += "}";
            rowAccount += "function binIdDeleteModal(val,val2){";
            rowAccount += "var idRole = document.getElementById('idRole');";
            rowAccount += "var nameRole=document.getElementById('lbRoleName'); ";
            rowAccount += "idRole.value =val;nameRole.innerText =val2";
            rowAccount += "}";
            rowAccount += "</script>";
            int totalPage = listRole.Count();
            int numPage = (int)Math.Ceiling((double)totalPage / pageSize);
            foreach (Role r in listRole)
            {
                
                rowAccount += "<tr>";
                rowAccount += "<td>" + r.Id + "</td>";
                rowAccount += "<td>" + r.NameRole + "</td>";
                rowAccount += "<td>" + r.Status + "</td>";
                rowAccount += "<td>" + r.Permission + "</td>";
                rowAccount += "<td>" + r.UserCreate + "</td>";
                rowAccount += "<td>" + r.CreateDate + "</td>";
                rowAccount += "<td>" + r.UserEdit + "</td>";
                rowAccount += "<td>" + r.EditDate + "</td>";
                rowAccount += "<td><p id='btnEdit" + r.Id + "' data-toggle='modal' data-target='#AddAccountModal' onclick=\"bindDataFromTableAccount("+r.Id+",'"+r.NameRole +"')\" class='btn btn-warning'>Sửa</p> &nbsp;&nbsp;";
                rowAccount += "<p id='btnDelete" + r.Id + "' data-toggle='modal' data-target='#roleDelteModal' onclick=\"binIdDeleteModal(" + r.Id + ",'" + r.NameRole + "')\" class='btn btn-danger'>Xoá</p>";
                rowAccount += "</td>";
                rowAccount += "</tr>";
            }
            //string pagingPage = "";
            rowAccount += "<style>#page1{background-color: #4CAF50;color: white;border: 1px solid #4CAF50;}" +
                ".isAct{background-color: #4CAF50;color: white;border: 1px solid #4CAF50;}</style>";
            rowAccount += "<center><div class='pagination'><a href='#pagePrev'>&laquo;</a>";
            for (int i=0; i<numPage;i++)
            {
                int x = i + 1;
                rowAccount += "<a id='page"+x+"' onclick='subPage()' href='#page"+i+"'>"+x+"</a>";
                rowAccount += "<script>function subPage(){var idPage=document.getElementById('page" + x+ "');idPage.className='isAct';}</script>";
            }
            rowAccount += "<a href='#pageNext'>&raquo;</a></div></center>";
            
            return rowAccount;
        }

        public bool InsertUser(string user, string pass, string first, string last, string address, string userCreate)
        {
            string query = "INSERT INTO Users VALUES('" + user + "','" + pass + "',N'" + first + "','" + last + "',N'" + address + "','',0,'" + userCreate + "',GETDATE(),'','');";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool UpadteUser(string first, string last, string address,string path,bool status ,string userEdit, string user)
        {
            string query = "UPDATE Users SET FirstName=N'"+first+"', LastName=N'"+last+"', Address=N'"+address+"', PathImages='"+path+"', Status='"+status+"', UserEdit='"+userEdit+"', EditDate=GETDATE() WHERE UserName='"+user+"'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }
        public bool UpadteInfo(string first, string last, string address, string userEdit, string user)
        {
            string query = "UPDATE Users SET FirstName=N'" + first + "', LastName=N'" + last + "', Address=N'" + address + "', UserEdit='" + userEdit + "', EditDate=GETDATE() WHERE UserName='" + user + "'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool DeleteUser(string user)
        {
            string query = "DELETE FROM Users WHERE UserNAME='"+user+"'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public List<Model.UserRequest> LoadListRequest()
        {
            List<Model.UserRequest> roleList = new List<Model.UserRequest>();
            string query =  "SELECT distinct  ur.UserName, u.FirstName+' '+LastName as FullName,(Select IdRole from UserRole where IdRole=50 and UserName=ur.UserName) as CurrentRole,(SELECT IdRole FROM UserRole WHERE IdRole!=50 and UserName=ur.UserName)  as RoleRequest, ur.CreateDate" +
                            "FROM UserRole ur, Role r, Users u" +
                            "WHERE ur.UserName=u.UserName and r.Id=ur.IdRole and  IdRole != 50 AND ur.Status=0;";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Model.UserRequest role = new Model.UserRequest(item);
                roleList.Add(role);
            }

            return roleList;
        }

        public string TextToHtml(string text)
        {
            text = HttpUtility.HtmlEncode(text);
            text = text.Replace("\r\n", "\r");
            text = text.Replace("\n", "\r");
            text = text.Replace("\r", "<br>\r\n");
            text = text.Replace("  ", " &nbsp;");
            return text;
        }
    }
}