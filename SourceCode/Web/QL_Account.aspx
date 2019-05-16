<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QL_Account.aspx.cs" Inherits="Web.QL_Account" %>

<%@ Register Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="ig" %>

<%@ Register Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-left: 20px">
        <ul class="nav nav-tabs">
            <li><a data-toggle="tab" href="#role">Roles</a></li>
            <li class="active"><a data-toggle="tab" href="#userrole">User Role</a></li>
            <li><a data-toggle="tab" href="#users">Userss</a></li>
            <li><a data-toggle="tab" href="#request">Requests</a></li>
        </ul>
        <style>
            tbody.igg_Item > tr > td {
                white-space: nowrap !important;
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
                                            <ig:RowAddingColumnSetting ColumnKey="NameRole" />
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
                                            <div style="background-color: white; border: 1px solid black;">
                                                <asp:Button ID="buttonOK" runat="server" OnClientClick="return" Text="OK" UseSubmitBehavior="False" />
                                                <asp:Button ID="buttonCancel" runat="server" CausesValidation="False" OnClientClick="return" Text="Cancel" UseSubmitBehavior="False" />
                                            </div>
                                        </Template>
                                    </ig:RowEditingTemplate>
                                    <ig:CellEditing>
                                        <EditModeActions EnableOnActive="True" EnableOnKeyPress="True" />
                                        <ColumnSettings>
                                            <ig:EditingColumnSetting ColumnKey="Id" ReadOnly="true" />
                                            <ig:EditingColumnSetting ColumnKey="NameRole" />
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
                <ig:WebDataGrid ID="wdgGroupRole" runat="server" Height="100%" Width="100%" DataKeyFields="Id" EnableAjax="False" AutoGenerateColumns="False" OnInit="wdgGroupRole_Init" OnRowAdding="wdgGroupRole_RowAdding" OnRowsDeleting="wdgGroupRole_RowsDeleting" OnRowUpdating="wdgGroupRole_RowUpdating">
                    <EditorProviders>
                        <ig:DropDownProvider ID="ddlRole">
                            <EditorControl
                                ClientIDMode="Predictable"
                                DropDownContainerMaxHeight="200px"
                                EnableAnimations="False"
                                EnableDropDownAsChild="False"
                                ValueField="Id"
                                TextField="NameRole"
                                DataSourceID="loadRoleToDropdown">
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
                                        <ig:EditingColumnSetting ColumnKey="UserName" />
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
                                        <ig:RowAddingColumnSetting ColumnKey="UserName" />
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
                <style type="text/css">
                    tbody.igg_Item > tr > td {
                        white-space: nowrap;
                    }
                </style>

                <ig:WebDataGrid ID="wdgUser" runat="server" Height="100%" Width="100%" EnableAjax="False" AutoGenerateColumns="False" DataKeyFields="UserName" OnInit="wdgUser_Init" OnRowAdding="wdgUser_RowAdding" OnRowsDeleting="wdgUser_RowsDeleting" OnRowUpdating="wdgUser_RowUpdating">
                    <Behaviors>
                        <ig:Activation></ig:Activation>
                        <ig:EditingCore AutoCRUD="False">
                            <Behaviors>
                                <ig:RowAdding></ig:RowAdding>
                                <ig:RowDeleting ShowDeleteButton="True"></ig:RowDeleting>
                                <ig:RowEditingTemplate CancelButton="buttonCancel" OKButton="buttonOK">
                                    <EditModeActions MouseClick="Double" />
                                    <ClientBindings>
                                        <ig:RowEditingClientBinding ColumnKey="UserName" ControlID="control_UserName" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="PassWord" ControlID="control_PassWord" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="FirstName" ControlID="control_FirstName" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="LastName" ControlID="control_LastName" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Address" ControlID="control_Address" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="PathImages" ControlID="control_PathImages" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Status" ControlID="control_Status" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                    </ClientBindings>
                                    <Template>
                                        <div class="row" style="background-color: white; border: 1px solid black; width: 600px; padding: 15px;">
                                            <div class="col-md-7">

                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px;">UserName</span>
                                                    <input type="text" class="form-control" id="control_UserName" runat="server" />
                                                </div>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px;">PassWord</span>
                                                    <asp:TextBox CssClass="form-control" ID="control_PassWord" runat="server"></asp:TextBox>
                                                </div>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px;">FirstName</span>
                                                    <asp:TextBox CssClass="form-control" ID="control_FirstName" runat="server"></asp:TextBox>
                                                </div>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px;">LastName</span>
                                                    <asp:TextBox CssClass="form-control" ID="control_LastName" runat="server"></asp:TextBox>
                                                </div>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px;">Address</span>
                                                    <asp:TextBox CssClass="form-control" ID="control_Address" runat="server"></asp:TextBox>
                                                </div>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px;">Images</span>
                                                    <asp:TextBox CssClass="form-control" ID="control_PathImages" runat="server"></asp:TextBox>
                                                </div>
                                                <br />
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 100px;">Status</span><span>
                                                        <asp:DropDownList ID="ddrOp" CssClass="form-control" runat="server" Width="100px">
                                                            <asp:ListItem>Actived</asp:ListItem>
                                                            <asp:ListItem>Locked</asp:ListItem>
                                                        </asp:DropDownList></span>
                                                    <asp:TextBox CssClass="form-control" ID="control_Status" runat="server" Width="95px"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>

                                            <div class="col-md-5">
                                                <style type="text/css">
                                                    .control-fileupload {
                                                        width: 230px !important;
                                                    }
                                                </style>

                                                <asp:Image ID="Images" runat="server" ImageUrl="~/Images/default-image.jpg" Width="230px" Height="260px" />
                                                <div style="margin-top: 5px;">
                                                    <span class="control-fileupload" style="width: 300px;">
                                                        <label for="file">Choose a file :</label>
                                                        <input type="file" id="file" runat="server" style="width: 80px;" />
                                                    </span>
                                                </div>
                                                <div class="fa-pull-right" style="margin-top: 30px;">
                                                    <asp:Button CssClass="btn btn-success" ID="buttonOK" runat="server" OnClientClick="return" Text="OK" UseSubmitBehavior="False" />
                                                    <asp:Button CssClass="btn btn-default" ID="buttonCancel" runat="server" CausesValidation="False" OnClientClick="return" Text="Cancel" UseSubmitBehavior="False" />
                                                </div>
                                            </div>
                                        </div>
                                    </Template>
                                </ig:RowEditingTemplate>
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

            <div id="request" class="tab-pane fade">
                <h3>Danh sách yêu cầu nâng cấp quyền</h3>
                <ig:WebDataGrid ID="wdgRequest" runat="server" Height="100%" Width="100%" AutoGenerateColumns="False" DataSourceID="loadRequest" OnRowsDeleting="wdgRequest_RowsDeleting" OnRowUpdating="wdgRequest_RowUpdating" DataKeyFields="Id">
                    <Columns>
                        <ig:BoundDataField DataFieldName="Id" Key="Id">
                            <Header Text="Id"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="UserName" Key="UserName">
                            <Header Text="UserName"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="FullName" Key="FullName">
                            <Header Text="FullName"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CurrentRole" Key="CurrentRole">
                            <Header Text="CurrentRole"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="RoleRequest" Key="RoleRequest">
                            <Header Text="RoleRequest"></Header>
                        </ig:BoundDataField>
                        <ig:BoundCheckBoxField DataFieldName="Status" Key="Status">
                            <Header Text="Status"></Header>
                        </ig:BoundCheckBoxField>
                        <ig:BoundDataField DataFieldName="CreateDate" Key="CreateDate">
                            <Header Text="CreateDate"></Header>
                        </ig:BoundDataField>

                    </Columns>
                    <Behaviors>
                        <ig:Paging></ig:Paging>
                        <ig:Sorting></ig:Sorting>
                        <ig:EditingCore AutoCRUD="False">
                            <Behaviors>
                                <ig:RowDeleting ShowDeleteButton="True"></ig:RowDeleting>
                                <ig:CellEditing></ig:CellEditing>
                            </Behaviors>
                        </ig:EditingCore>
                        <ig:Selection CellClickAction="Row" RowSelectType="Single"></ig:Selection>
                        <ig:RowSelectors></ig:RowSelectors>
                    </Behaviors>
                </ig:WebDataGrid>
                <asp:SqlDataSource ID="loadRequest" runat="server" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' SelectCommand="SELECT DISTINCT ur.Id, ur.UserName, u.FirstName + ' ' + u.LastName AS FullName, (SELECT IdRole FROM UserRole WHERE (IdRole = 50) AND (UserName = ur.UserName)) AS CurrentRole, (SELECT IdRole FROM UserRole AS UserRole_1 WHERE (IdRole <> 50) AND (UserName = ur.UserName)) AS RoleRequest, ur.Status, ur.CreateDate FROM UserRole AS ur INNER JOIN Users AS u ON ur.UserName = u.UserName INNER JOIN Role AS r ON ur.IdRole = r.Id WHERE (ur.IdRole <> 50) AND (ur.Status = 0)"></asp:SqlDataSource>
                
            </div>
        </div>
    </div>



</asp:Content>
