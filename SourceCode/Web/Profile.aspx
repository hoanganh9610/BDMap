<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Web.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-left: 20px;">
        <ul class="nav nav-tabs">

            <li class="active"><a  data-toggle="tab" href="#menu1">Thông tin tài khoản</a></li>
            <li><a data-toggle="tab" href="#menu2">Thay đổi hồ sơ</a></li>
            <li><a data-toggle="tab" href="#menu3">Đổi mật khẩu</a></li>
        </ul>

        <div class="tab-content">
            <div id="menu1" class="tab-pane fade in active">
                <br />
                <style>
                    input, select, textarea {
                        max-width: 500px;
                    }
                </style>
                <div class="row" id="MyProfile" runat="server" style="display: block;"></div>
            </div>

            <div id="menu2" class="tab-pane fade">
                <div style="margin-top:20px" class="row" id="changeUser" runat="server">
                    <div style="margin-bottom: 10px" class="input-group">
                        <span class="input-group-addon" style="width: 120px">UserName</span>
                        <input style="width: 500px" id="txtUserName" runat="server" type="text" class="form-control" placeholder="UserName">
                    </div>
                    <div style="margin-bottom: 10px" class="input-group">
                        <span class="input-group-addon" style="width: 120px">First Name</span>
                        <input style="width: 500px" id="txtFirst" type="text" runat="server" class="form-control" placeholder="First Name">
                    </div>
                    <div style="margin-bottom: 10px" class="input-group">
                        <span class="input-group-addon" style="width: 120px">Last Name</span>
                        <input style="width: 500px" id="txtLast" type="text" runat="server" class="form-control" placeholder="Last Name">
                    </div>
                    <div style="margin-bottom: 10px" class="input-group">
                        <span class="input-group-addon" style="width: 120px">Address</span>
                        <input style="width: 500px" id="txtAddress" type="text" runat="server" class="form-control" placeholder="Address">
                    </div>

                    <div>
                        <asp:Button ID="btnSave" CssClass="btn btn-success" Width="100px" runat="server" OnClick="btnSave_Click" Text="Save" />
                    </div>

                </div>
            </div>
            <div id="menu3" class="tab-pane fade">
                <div style="margin-top:20px" class="row" id="Div1" runat="server">
                    <div style="margin-bottom: 10px" class="input-group">
                        <span class="input-group-addon" style="width: 120px">UserName</span>
                        <input style="width: 500px ;" readonly id="Text1" runat="server" type="text" class="form-control" placeholder="UserName">
                    </div>
                    <div style="margin-bottom: 10px" class="input-group">
                        <span class="input-group-addon" style="width: 120px">Old Password</span>
                        <input style="width: 500px" id="Text2"  type="password" runat="server" class="form-control" placeholder="Old Password">
                    </div>
                    <div style="margin-bottom: 10px" class="input-group">
                        <span class="input-group-addon" style="width: 120px">New Password</span>
                        <input style="width: 500px" id="Text3" type="text" runat="server" class="form-control" placeholder="New Password">
                    </div>
                    <div style="margin-bottom: 10px" class="input-group">
                        <span class="input-group-addon" style="width: 120px">Re Password</span>
                        <input style="width: 500px" id="Text4" type="text" runat="server" class="form-control" placeholder="Re Password">
                    </div>

                    <div>
                        <asp:Button ID="Button1" CssClass="btn btn-success" Width="200px" runat="server" OnClick="Button1_Click" Text="Update Password" />
                    </div>

                </div>
            </div>
        </div>

    </div>


</asp:Content>
