using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Controller;
using Web.Models;

namespace Web
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userSignIn.InnerHtml = LoadInfoSignIn();
            iService.InnerHtml = LoadServiceMenu();
        }
        public string LoadInfoSignIn()
        {
            string dropImage = "";
            
            if(Session["TenDangNhap"] != null)
            {
                dropImage += "<p style='padding-top: 5px' class='dropdown-toggle' data-toggle='dropdown'>";
                dropImage += "<label style='color: deeppink; margin-top: 5px; margin-right: 5px;'>Xin chào "+ Session["FullName"].ToString()+"</label>";
                dropImage += "<img src='Images/"+ Session["Images"].ToString() + "' width='40' height='40' style='border-radius: 20px; margin-top: 5px; margin-right: 30px' />";
                dropImage += "</p>";
                dropImage += "<ul style='margin-left:10px;' class='dropdown-menu'>";
                dropImage += "<li><a href='Profile.aspx'><i class='fas fa-user'></i>&nbsp; Thông tin cá nhân</a></li>";
                dropImage += "<li><a data-toggle='modal' data-target='#logoutModal'><i class='fas fa-sign-out-alt'></i>&nbsp; Đăng Xuất</a></li>";
                dropImage += "</ul>";
            }
            else
            {
                dropImage += "<p style='padding-top: 5px' class='dropdown-toggle' data-toggle='dropdown'>";
                dropImage += "<label style='color: deeppink; margin-top: 5px; margin-right: 5px;'>Bạn chưa đăng nhập!</label>";
                dropImage += "<img src='Images/default-image.jpg' width='40' height='40' style='border-radius: 20px; margin-top: 5px; margin-right: 30px' />";
                dropImage += "</p>";
                dropImage += "<ul style='margin-left:10px;' class='dropdown-menu'>";
                dropImage += "<li><a href='Login.aspx'><i class='fas fa-sign-out-alt'></i>&nbsp; Đăng Nhập</a></li>";
                dropImage += "</ul>";
            }
           
            return dropImage;
        }
        public string LoadServiceMenu()
        {
            string serviceMenu = "";
            List<TypeService> typeServiceList = TypeServiceDAO.Instance.LoadTypeServiceList();
            foreach (TypeService type in typeServiceList)
            {
                serviceMenu += "<a class='nav-link collapsed' href='#' data-toggle='collapse' data-target='#type" + type.IdType + "' aria-expanded='true'>";
                serviceMenu += "" + type.IconType + "";
                serviceMenu += "<span> &nbsp;" + type.NameType + "</span>";
                serviceMenu += "</a>";
                serviceMenu += "<div id='type" + type.IdType + "' class='collapse'>";
                serviceMenu += "<div style='margin-left: 25px;'>";
                List<Service> serviceList = ServiceDAO.Instance.LoadServiceListByType(type.IdType);
                
                foreach (Service service in serviceList)
                {
                    serviceMenu += "<a href='#service" + service.IdService + "' style='color:white !important' onclick=\"loadmaker" + service.IdService + "()\" class='collapse-item'>" + service.NameService + "</a>";
                    serviceMenu += "<script type='text/javascript'>";
                    serviceMenu += "function loadmaker" + service.IdService + "() {";
                    serviceMenu += "var locations = [";
                    List<Point> pointList = PointDAO.Instance.LoadPointByService(service.IdService);
                    int i = 1;

                    foreach (Point pt in pointList)
                    {
                        int j = pointList.Count;
                        if (i < j)
                        {
                            serviceMenu += "['" + pt.NamePoint + "'," + pt.Lat + "," + pt.Lng + ",'"+pt.AddressPoint+"','"+pt.Description+"','"+pt.Permission+"'," + i + "],";
                        }
                        else if (i == j)
                        {
                            serviceMenu += "['" + pt.NamePoint + "'," + pt.Lat + "," + pt.Lng + ",'" + pt.AddressPoint + "','" + pt.Description + "','" + pt.Permission + "'," + i + "]";
                        }

                        i++;
                    }
                    serviceMenu += "];";
                    serviceMenu += "var map = new google.maps.Map(document.getElementById('map'), {";
                    serviceMenu += "zoom: 12,";
                    serviceMenu += "center: new google.maps.LatLng(10.980304, 106.674457),";
                    serviceMenu += "mapTypeId: google.maps.MapTypeId.ROADMAP";
                    serviceMenu += "});";
                    serviceMenu += "var infowindow = new google.maps.InfoWindow;";
                    serviceMenu += "var marker, i;";
                    serviceMenu += "for (i = 0; i < locations.length; i++) {";
                    serviceMenu += "marker = new google.maps.Marker({";
                    serviceMenu += "position: new google.maps.LatLng(locations[i][1], locations[i][2]),";
                    serviceMenu += "map: map";
                    serviceMenu += "});" +
                        "google.maps.event.addListener(marker, 'click', (function(marker, i) {" +
                        "return function() {" +
                        "infowindow.setContent('<p style=\"text-align:center\"><strong>'+locations[i][0]+'</strong></p>'+'<p>'+locations[i][3]+'</p>'+" +
                        "'<p><a href=\"'+locations[i][4]+'\">'+locations[i][4]+'</a></p>'+" +
                        "'<p><i style=\"background:#3C88EB\" class=\"fas fa-check-square fa-lg\"></i>&nbsp;Được chứng thực bởi: '+locations[i][5]+'</p>');" +
                        "infowindow.open(map, marker);" +
                        "}" +
                        "})(marker, i));" +
                        "}}" +
                        "</script>";
                    //serviceMenu += "marker.setVisible(true);";
                    //serviceMenu += "marker.addListener('click', function () {";
                    ////"infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +'Place ID: ' + place.place_id + '<br>' +place.formatted_address + '</div>'); ";
                    //serviceMenu += "infowindow.open(map, marker);";
                    //serviceMenu += "});";
                    //serviceMenu += "}}</script>";
                    roleComponent.InnerHtml = LoadComponentByRole(service.NameService);
                }

                serviceMenu += "</div>";
                serviceMenu += "</div>";

            }

            return serviceMenu;
        }

        //public string LoadServiceMenu()
        //{
        //    string serviceMenu = "";
        //    List<TypeService> typeServiceList = TypeServiceDAO.Instance.LoadTypeServiceList();
        //    foreach (TypeService type in typeServiceList)
        //    {
        //        serviceMenu += "<a class='nav-link collapsed' href='#' data-toggle='collapse' data-target='#type"+type.IdType+"' aria-expanded='true'>";
        //        serviceMenu += ""+type.IconType+"";
        //        serviceMenu += "<span> &nbsp;"+type.NameType+"</span>";
        //        serviceMenu += "</a>";
        //        serviceMenu += "<div id='type" + type.IdType+"' class='collapse'>";
        //        serviceMenu += "<div style='margin-left: 25px;'>";
        //        List<Service> serviceList = ServiceDAO.Instance.LoadServiceListByType(type.IdType);
        //        foreach (Service service in serviceList)
        //        {
        //            serviceMenu += "<a href='#service"+service.IdService+ "' style='color:white !important' onclick=\"loadmaker" + service.IdService + "()\" class='collapse-item'>" + service.NameService+"</a>";
        //            serviceMenu += "<script type='text/javascript'>";
        //            serviceMenu += "function loadmaker" + service.IdService + "() {";
        //            serviceMenu += "var locations = [";
        //            List<Point> pointList = PointDAO.Instance.LoadPointByService(service.IdService);
        //            int i = 1;

        //            foreach (Point pt in pointList)
        //            {
        //                int j = pointList.Count;
        //                if (i < j)
        //                {
        //                    serviceMenu += "['" + pt.NamePoint + "'," + pt.Lat + "," + pt.Lng + "," + i + "],";
        //                }
        //                else if (i == j)
        //                {
        //                    serviceMenu += "['" + pt.NamePoint + "'," + pt.Lat + "," + pt.Lng + "," + i + "]";
        //                }

        //                i++;
        //            }
        //            serviceMenu += "];";
        //            serviceMenu += "var map = new google.maps.Map(document.getElementById('map'), {";
        //            serviceMenu += "zoom: 12,";
        //            serviceMenu += "center: new google.maps.LatLng(10.980304, 106.674457),";
        //            serviceMenu += "mapTypeId: google.maps.MapTypeId.ROADMAP";
        //            serviceMenu += "});";
        //            serviceMenu += "var infowindow = new google.maps.InfoWindow;";
        //            serviceMenu += "var marker, i;";
        //            serviceMenu += "for (i = 0; i < locations.length; i++) {";
        //            serviceMenu += "marker = new google.maps.Marker({";
        //            serviceMenu += "position: new google.maps.LatLng(locations[i][1], locations[i][2]),";
        //            serviceMenu += "map: map";
        //            serviceMenu += "});";
        //            serviceMenu += "marker.setVisible(true);";
        //            serviceMenu += "marker.addListener('click', function () {";
        //                //"infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +'Place ID: ' + place.place_id + '<br>' +place.formatted_address + '</div>'); ";
        //            serviceMenu += "infowindow.open(map, marker);";
        //            serviceMenu += "});";
        //            serviceMenu += "}}</script>";
        //            roleComponent.InnerHtml = LoadComponentByRole(service.NameService);
        //        }
                
        //        serviceMenu += "</div>";
        //        serviceMenu += "</div>";
                
        //    }
            
        //    return serviceMenu;
        //}

        public string LoadComponentByRole(string name)
        {
            string cbrole = "";
            if (Session["Role"] != null)
            {
                if (Session["Role"].ToString() == "Admin")
                {
                    cbrole += "<div style='margin-top: 10px' class='headerMenu'>MANAGEMENT</div>";
                    cbrole += "<div class='childTitle'>";
                    cbrole += "<a href='QL_Account.aspx'><i class='fas fa-map-marked-alt'></i>&nbsp; Accounts</a>";
                    cbrole += "<a href='QL_Serivce.aspx'><i class='fas fa-satellite'></i>&nbsp; Services</a>";
                    cbrole += "</div>";
                }
                else if(Session["Role"].ToString() == "Client")
                {
                    cbrole += "<div style='margin-top: 10px' class='headerMenu'>SAVE POINT</div>";
                    cbrole += "<div class='childTitle'>";
                    cbrole += "<a href='#clients'><i class='fas fa-map-marked-alt'></i>&nbsp; My Point</a>";
                    cbrole += "</div>";
                }
                else
                {
                    cbrole += "<div style='margin-top: 10px' class='headerMenu'>MY SERVICE</div>";
                    cbrole += "<div class='childTitle'>";
                    cbrole += "<a href='#clients'><i class='fas fa-map-marked-alt'></i>&nbsp;" + name + "</a>";
                    cbrole += "<a href='#clients'><i class='fas fa-satellite'></i>&nbsp; Info Service Point</a>";
                    cbrole += "</div>";
                }

            }
            
            return cbrole;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("Default.aspx");
        }
        
        protected void btnImport_Click(object sender, EventArgs e)
        {
            
        }
        
    }
}