<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QL_Account.aspx.cs" Inherits="Web.QL_Account" %>

<%@ Register Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="ig" %>

<%@ Register Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-left: 20px">
        <ul class="nav nav-tabs">
            <li ><a data-toggle="tab" href="#role">Roles</a></li>
            <li class="active"><a data-toggle="tab" href="#userrole">User Role</a></li>
            <li><a data-toggle="tab" href="#users">Userss</a></li>
            <li><a data-toggle="tab" href="#request">Requests</a></li>
        </ul>
        <style>
            tbody.igg_Item>tr>td  {
                white-space:nowrap !important;
            }
        </style>
        <div class="tab-content">
            <div id="role" class="tab-pane fade in active">
                <h3>Danh sách quyền truy cập</h3>
                
                <div style="margin-bottom: 10px;" class="fa-pull-right">
                    <p class="btn btn-success" data-toggle="modal" data-target="#ModalImportFile">Import File</p>
                    <asp:Button ID="btnExportRole" CssClass="btn btn-success" runat="server" Text="Export File Excel" OnClick="btnExportRole_Click" />
                    <ig:WebExcelExporter ID="weRole" runat="server"></ig:WebExcelExporter>

                </div>
                <div>
                    <ig:WebDataGrid ID="wdgRole" runat="server" Height="350px" Width="100%" DataKeyFields="Id" EnableAjax="False" OnRowAdding="wdgRole_RowAdding" OnRowsDeleting="wdgRole_RowsDeleting" OnRowUpdating="wdgRole_RowUpdating" OnInit="wdgRole_Init" AutoGenerateColumns="False">
                        
                        <Behaviors>
                            <ig:Activation>
                            </ig:Activation>
                            <ig:EditingCore AutoCRUD="False">
                                <Behaviors>
                                    <ig:RowAdding>
                                        
                                        <EditModeActions EnableOnKeyPress="True" MouseClick="Single" />
                                         <ColumnSettings>
                                            <ig:RowAddingColumnSetting ColumnKey="Id" ReadOnly="true" />
                                            <ig:RowAddingColumnSetting ColumnKey="NameRole"  />
                                            <ig:RowAddingColumnSetting ColumnKey="Status" />
                                            <ig:RowAddingColumnSetting ColumnKey="Permission" ReadOnly="true" />
                                            <ig:RowAddingColumnSetting ColumnKey="UserCreate" ReadOnly="true" />
                                            <ig:RowAddingColumnSetting ColumnKey="CreateDate" ReadOnly="true" />
                                            <ig:RowAddingColumnSetting ColumnKey="UserEdit" ReadOnly="true" />
                                            <ig:RowAddingColumnSetting ColumnKey="EditDate" ReadOnly="true" />
                                        </ColumnSettings>
                                    </ig:RowAdding>
                                    <ig:RowDeleting ShowDeleteButton="True" EnableInheritance="True">
                                    </ig:RowDeleting>
                                    <ig:RowEditingTemplate CancelButton="buttonCancel" OKButton="buttonOK">
                                        <EditModeActions MouseClick="Double" />
                                        <Template>
                                            <div style="background-color:white;border:1px solid black;">
                                                <asp:Button ID="buttonOK" runat="server" OnClientClick="return" Text="OK" UseSubmitBehavior="False" />
                                                <asp:Button ID="buttonCancel" runat="server" CausesValidation="False" OnClientClick="return" Text="Cancel" UseSubmitBehavior="False" />
                                            </div>
                                        </Template>
                                    </ig:RowEditingTemplate>
                                    <ig:CellEditing>
                                        <EditModeActions EnableOnActive="True" EnableOnKeyPress="True" />
                                        <ColumnSettings>
                                            <ig:EditingColumnSetting ColumnKey="Id" ReadOnly="true" />
                                            <ig:EditingColumnSetting ColumnKey="NameRole"  />
                                            <ig:EditingColumnSetting ColumnKey="Status" />
                                            <ig:EditingColumnSetting ColumnKey="Permission" ReadOnly="true" />
                                            <ig:EditingColumnSetting ColumnKey="UserCreate" ReadOnly="true" />
                                            <ig:EditingColumnSetting ColumnKey="CreateDate" ReadOnly="true" />
                                            <ig:EditingColumnSetting ColumnKey="UserEdit" ReadOnly="true" />
                                            <ig:EditingColumnSetting ColumnKey="EditDate" ReadOnly="true" />
                                        </ColumnSettings>
                                        
                                    </ig:CellEditing>
                                </Behaviors>
                            </ig:EditingCore>
                            <ig:ColumnResizing>
                            </ig:ColumnResizing>
                            <ig:Selection CellClickAction="Row" RowSelectType="Single">
                                
                            </ig:Selection>
                            <ig:RowSelectors>
                                
                            </ig:RowSelectors>
                            <ig:VirtualScrolling>
                            </ig:VirtualScrolling>
                            <ig:Filtering>
                            </ig:Filtering>
                            <ig:Paging>
                               
                            </ig:Paging>
                            <ig:Sorting>
                            </ig:Sorting>
                        </Behaviors>
                    </ig:WebDataGrid>
                    
                    <asp:SqlDataSource ID="loadUserToDropDown" runat="server" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="loadRoleToDropdown" runat="server" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' SelectCommand="SELECT * FROM [Role]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="loadUserRole" runat="server" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' SelectCommand="SELECT UserRole.Id, UserRole.UserName, Role.NameRole, UserRole.Status, UserRole.UserCreate, UserRole.CreateDate, UserRole.UserEdit, UserRole.EditDate, UserRole.IdRole FROM UserRole INNER JOIN Users ON UserRole.UserName = Users.UserName INNER JOIN Role ON UserRole.IdRole = Role.Id"></asp:SqlDataSource>
                </div>
                

            </div>
            <div id="userrole" class="tab-pane fade">
                <h3>Nhóm quyền</h3>
                <ig:WebDataGrid ID="wdgGroupRole" runat="server" Height="100%" Width="100%" DataKeyFields="Id" EnableAjax="False"  AutoGenerateColumns="False" OnInit="wdgGroupRole_Init" OnRowAdding="wdgGroupRole_RowAdding" OnRowsDeleting="wdgGroupRole_RowsDeleting" OnRowUpdating="wdgGroupRole_RowUpdating">
                        <EditorProviders>
                            <ig:DropDownProvider ID="ddlRole">
                                <EditorControl 
                                    ClientIDMode="Predictable" 
                                    DropDownContainerMaxHeight="200px" 
                                    EnableAnimations="False" 
                                    EnableDropDownAsChild="False" 
                                    ValueField="Id"
                                    TextField="NameRole"
                                    DataSourceID="loadRoleToDropdown"
                                    >
                            <DropDownItemBinding TextField="NameRole" ValueField="Id"></DropDownItemBinding>
                                </EditorControl>
                            </ig:DropDownProvider>
                            <ig:DropDownProvider ID="ddrUser">
                                <EditorControl ClientIDMode="Predictable" DropDownContainerMaxHeight="200px" EnableAnimations="False" EnableDropDownAsChild="False" DataSourceID="loadUserToDropdown" TextField="UserName" ValueField="UserName">
                                    <DropDownItemBinding TextField="UserName" ValueField="UserName" />
                                </EditorControl>
                            </ig:DropDownProvider>
                        </EditorProviders>
                    <Behaviors>
                        <ig:Activation></ig:Activation>
                        <ig:ColumnResizing></ig:ColumnResizing>
                        <ig:EditingCore AutoCRUD="False">
                            <Behaviors>
                                <ig:CellEditing>
                                    <EditModeActions EnableOnKeyPress="True"></EditModeActions>
                                    <ColumnSettings>
                                        <ig:EditingColumnSetting ColumnKey="Id" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="UserName"  />
                                        <ig:EditingColumnSetting ColumnKey="IdRole" />
                                        <ig:EditingColumnSetting ColumnKey="Permission" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="UserCreate" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="CreateDate" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="UserEdit" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="EditDate" ReadOnly="true" />
                                    </ColumnSettings>
                                </ig:CellEditing>
                                <ig:RowAdding>
                                    <EditModeActions MouseClick="Single" EnableOnKeyPress="True"></EditModeActions>
                                    <ColumnSettings>
                                        <ig:RowAddingColumnSetting ColumnKey="Id" ReadOnly="true" />
                                        <ig:RowAddingColumnSetting ColumnKey="UserName"  />
                                        <ig:RowAddingColumnSetting ColumnKey="IdRole" />
                                        <ig:RowAddingColumnSetting ColumnKey="Permission" ReadOnly="true" />
                                        <ig:RowAddingColumnSetting ColumnKey="UserCreate" ReadOnly="true" />
                                        <ig:RowAddingColumnSetting ColumnKey="CreateDate" ReadOnly="true" />
                                        <ig:RowAddingColumnSetting ColumnKey="UserEdit" ReadOnly="true" />
                                        <ig:RowAddingColumnSetting ColumnKey="EditDate" ReadOnly="true" />
                                    </ColumnSettings>
                                </ig:RowAdding>
                                <ig:RowDeleting ShowDeleteButton="True"></ig:RowDeleting>
                            </Behaviors>
                        </ig:EditingCore>
                        <ig:Selection CellClickAction="Row" RowSelectType="Single"></ig:Selection>
                        <ig:RowSelectors></ig:RowSelectors>
                        <ig:VirtualScrolling></ig:VirtualScrolling>
                        <ig:Filtering></ig:Filtering>
                        <ig:Paging></ig:Paging>
                        <ig:Sorting></ig:Sorting>
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
            <div id="users" class="tab-pane fade">
                <h3>Quản lý tài khoản</h3>
                
            </div>

            <div id="request" class="tab-pane fade">
                <h3>Danh sách yêu cầu nâng cấp quyền</h3>

<%--                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>User Name</th>
                            <th>Full Name</th>
                            <th>Role Curently</th>
                            <th>Role Request</th>
                            <th>Positon</th>
                            <th>Day Request</th>
                            <th>#</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>nhanh</td>
                            <td>Nguyễn Hoàng Anh</td>
                            <td>Người dùng</td>
                            <td>University</td>
                            <td>Hiệu trưởng</td>
                            <td>12/05/2019</td>
                            <td>
                                <button class="btn btn-success">Chấp Nhận</button>
                                <button class="btn btn-danger">Từ chối</button>
                            </td>
                        </tr>

                    </tbody>
                </table>--%>
            </div>
        </div>
    </div>



</asp:Content>
