<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QL_Service.aspx.cs" Inherits="Web.QL_Service" %>

<%@ Register Assembly="Infragistics45.WebUI.WebHtmlEditor.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.WebHtmlEditor" TagPrefix="ighedit" %>

<%@ Register Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>
<%@ Register TagPrefix="ig" Namespace="Infragistics.Web.UI.DataSourceControls" Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cloud.tinymce.com/5/tinymce.min.js?apiKey=qagffr3pkuv17a8on1afax661irst1hbr4e6tbv888sz91jc"></script>
    <div style="margin-left: 20px">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#service">Service</a></li>
            <li><a data-toggle="tab" href="#point">Point</a></li>
            <%--<li><a data-toggle="tab" href="#infopoint">Info Point</a></li>
            <li><a data-toggle="tab" href="#request">Requests</a></li>--%>
        </ul>
        
    <script>
        tinymce.init({
            selector: '#Description'
        });        
    </script>
        <div class="tab-content">
            <div id="service" class="tab-pane fade in active">
                <h3>Danh sách dịch vụ</h3>
                <style>
                    tbody.igg_Item > tr > td {
                        white-space: nowrap !important;
                    }
                </style>
                <ig:WebHierarchicalDataGrid ID="whdgService" runat="server" Height="550px" Width="100%" AutoGenerateBands="False" AutoGenerateColumns="False" DataKeyFields="IdService" DataMember="loadService_DefaultView" DataSourceID="ServiceView" Key="loadService_DefaultView" EnableAjax="False" OnRowAdding="whdgService_RowAdding" OnRowsDeleting="whdgService_RowsDeleting" OnRowUpdating="whdgService_RowUpdating">
                    <Bands>
                        <ig:Band Key="loadPoint_DefaultView" DataMember="loadPoint_DefaultView" AutoGenerateColumns="False">
                            <Columns>
                                <ig:BoundDataField DataFieldName="IdPoint" Key="IdPoint">
                                    <Header Text="IdPoint"></Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="NamePoint" Key="NamePoint">
                                    <Header Text="NamePoint"></Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="Lat" Key="Lat">
                                    <Header Text="Lat"></Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="Lng" Key="Lng">
                                    <Header Text="Lng"></Header>
                                </ig:BoundDataField>                                
                                <ig:BoundDataField DataFieldName="AddressPoint" Key="AddressPoint">
                                    <Header Text="AddressPoint"></Header>
                                </ig:BoundDataField>                              
                                <ig:BoundDataField DataFieldName="Description" Key="Description">
                                    <Header Text="Description"></Header>
                                </ig:BoundDataField>
                                <ig:BoundCheckBoxField DataFieldName="Status" Key="Status">
                                    <Header Text="Status"></Header>
                                </ig:BoundCheckBoxField>
                                <ig:BoundDataField DataFieldName="Permission" Key="Permission">
                                    <Header Text="Permission"></Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="UserCreate" Key="UserCreate">
                                    <Header Text="UserCreate"></Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="CreateDate" Key="CreateDate">
                                    <Header Text="CreateDate"></Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="UserEdit" Key="UserEdit">
                                    <Header Text="UserEdit"></Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="EditDate" Key="EditDate">
                                    <Header Text="EditDate"></Header>
                                </ig:BoundDataField>
                            </Columns>
                        </ig:Band>
                    </Bands>
                    <EditorProviders>
                        <ig:DropDownProvider ID="ddrType">
                            <EditorControl 
                                DropDownContainerMaxHeight="200px" 
                                EnableAnimations="False" 
                                EnableDropDownAsChild="False" 
                                ClientIDMode="Predictable"
                                ValueField="IdType"
                                TextField="NameType"
                                DataSourceID="loadTypeToDrop"
                                ></EditorControl>
                        </ig:DropDownProvider>
                    </EditorProviders>
                    <Columns>
                        <ig:BoundDataField DataFieldName="IdService" Key="IdService">
                            <Header Text="IdService"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="NameService" Key="NameService">
                            <Header Text="NameService"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="TypeServiceID" Key="TypeServiceID">
                            <Header Text="TypeServiceID"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="IconDisplay" Key="IconDisplay">
                            <Header Text="IconDisplay"></Header>
                        </ig:BoundDataField>
                        <ig:BoundCheckBoxField DataFieldName="Status" Key="Status">
                            <Header Text="Status"></Header>
                        </ig:BoundCheckBoxField>
                        <ig:BoundDataField DataFieldName="Permission" Key="Permission">
                            <Header Text="Permission"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="UserCreate" Key="UserCreate">
                            <Header Text="UserCreate"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CreateDate" Key="CreateDate">
                            <Header Text="CreateDate"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="UserEdit" Key="UserEdit">
                            <Header Text="UserEdit"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="EditDate" Key="EditDate">
                            <Header Text="EditDate"></Header>
                        </ig:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <ig:Selection CellClickAction="Row" RowSelectType="Single">
                        </ig:Selection>
                        <ig:RowSelectors>
                        </ig:RowSelectors>
                        <ig:Filtering>
                        </ig:Filtering>
                        <ig:Paging>
                        </ig:Paging>
                        <ig:Sorting>
                        </ig:Sorting>
                        <ig:ColumnResizing>
                        </ig:ColumnResizing>
                        <ig:Activation>
                        </ig:Activation>
                        <ig:EditingCore AutoCRUD="False">
                            <Behaviors>
                                <ig:RowEditingTemplate CancelButton="buttonCancel" OKButton="buttonOK">
                                    <ClientBindings>
                                        <ig:RowEditingClientBinding ColumnKey="IdService" ControlID="control_IdService" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="NameService" ControlID="control_NameService" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="TypeServiceID" ControlID="control_TypeServiceID" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="IconDisplay" ControlID="control_IconDisplay" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Status" ControlID="control_Status" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                    </ClientBindings>
                                    <Template>
                                        <div class="row" style="background-color: white; border: 1px solid black; width: 400px; padding: 20px">

                                            <div class="input-group">
                                                <span class="input-group-addon" style="width: 130px;">IdService</span>
                                                <asp:TextBox CssClass="form-control" ID="control_IdService" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group" style="margin-top: 10px;">
                                                <span class="input-group-addon" style="width: 130px;">Name Service</span>
                                                <asp:TextBox CssClass="form-control" ID="control_NameService" runat="server"></asp:TextBox>
                                            </div>

                                            <div class="input-group" style="margin-top: 10px;">
                                                <span class="input-group-addon" style="width: 130px;">TypeServiceID</span>
                                                <asp:TextBox CssClass="form-control" ID="control_TypeServiceID" runat="server"></asp:TextBox>
                                            </div>

                                            <div class="input-group" style="margin-top: 10px;">
                                                <span class="input-group-addon" style="width: 130px;">IconDisplay</span>
                                                <asp:TextBox CssClass="form-control" ID="control_IconDisplay" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="input-group" style="margin-top: 10px;">
                                                <span class="input-group-addon" style="width: 130px;">Status</span>
                                                <asp:TextBox CssClass="form-control" ID="control_Status" runat="server"></asp:TextBox>
                                            </div>

                                            <div style="margin-top: 20px; padding-right: 30px;" class="fa-pull-right">
                                                <asp:Button CssClass="btn btn-warning" ID="buttonOK" runat="server" OnClientClick="return" Text="OK" UseSubmitBehavior="False" />
                                                <asp:Button CssClass="btn btn-defalut" ID="buttonCancel" runat="server" CausesValidation="False" OnClientClick="return" Text="Cancel" UseSubmitBehavior="False" />

                                            </div>
                                        </div>
                                    </Template>
                                </ig:RowEditingTemplate>
                                <ig:RowDeleting ShowDeleteButton="True">
                                </ig:RowDeleting>
                                <ig:CellEditing>
                                </ig:CellEditing>
                                <ig:RowAdding>
                                    <ColumnSettings>
                                        <ig:RowAddingColumnSetting EditorID="ddrType" ColumnKey="TypeServiceID"></ig:RowAddingColumnSetting>
                                    </ColumnSettings>
                                </ig:RowAdding>
                            </Behaviors>
                        </ig:EditingCore>
                    </Behaviors>
                </ig:WebHierarchicalDataGrid>
                <ig:WebHierarchicalDataSource runat="server" ID="ServiceView">
                    <DataViews>
                        <ig:DataView DataMember="DefaultView" ID="loadService_DefaultView" DataSourceID="loadService"></ig:DataView>
                        <ig:DataView DataMember="DefaultView" ID="loadPoint_DefaultView" DataSourceID="loadPoint"></ig:DataView>
                    </DataViews>
                    <DataRelations>
                        <ig:DataRelation ChildDataViewID="loadPoint_DefaultView" ChildColumns="IdService" ParentDataViewID="loadService_DefaultView" ParentColumns="IdService"></ig:DataRelation>
                    </DataRelations>
                </ig:WebHierarchicalDataSource>
                <asp:SqlDataSource runat="server" ID="loadPoint" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' SelectCommand="SELECT * FROM [Point]"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="loadService" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' SelectCommand="SELECT * FROM [Service]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="loadTypeToDrop" runat="server" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' SelectCommand="SELECT * FROM [TypeService]"></asp:SqlDataSource>
            </div>
            <div id="point" class="tab-pane fade">
                <h3> Danh sách điểm dịch vụ</h3>
                <asp:SqlDataSource ID="loadServicetoDrop" runat="server" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' SelectCommand="SELECT * FROM [Service]"></asp:SqlDataSource>
                <ig:WebDataGrid ID="wdgPoint" runat="server" Height="100%" Width="100%" EnableAjax="False" AutoGenerateColumns="False" DataKeyFields="IdPoint" OnInit="wdgPoint_Init" OnRowAdding="wdgPoint_RowAdding" OnRowsDeleting="wdgPoint_RowsDeleting" OnRowUpdating="wdgPoint_RowUpdating">
                    <EditorProviders>
                        <ig:DropDownProvider ID="ddrService">
                            <EditorControl 
                                DropDownContainerMaxHeight="200px" 
                                EnableAnimations="False" 
                                EnableDropDownAsChild="False" 
                                ClientIDMode="Predictable"
                                ValueField="IdService"
                                TextField="NameService"
                                DataSourceID="loadServicetoDrop"></EditorControl>
                        </ig:DropDownProvider>
                    </EditorProviders>
                    <Behaviors>
                        <ig:EditingCore AutoCRUD="False">
                            <Behaviors>
                                <ig:CellEditing></ig:CellEditing>
                                <ig:RowAdding>
                                    <EditModeActions EnableOnKeyPress="True" MouseClick="Single" />
                                    <ColumnSettings>
                                        <ig:RowAddingColumnSetting ColumnKey="IdPoint" ReadOnly="true" />
                                        <ig:RowAddingColumnSetting ColumnKey="Permission" ReadOnly="true"/>
                                        <ig:RowAddingColumnSetting ColumnKey="UserCreate" ReadOnly="true"/>
                                        <ig:RowAddingColumnSetting ColumnKey="CreateDate" ReadOnly="true" />
                                        <ig:RowAddingColumnSetting ColumnKey="UserEdit" ReadOnly="true" />
                                        <ig:RowAddingColumnSetting ColumnKey="EditDate" ReadOnly="true"/>
                                    </ColumnSettings>
                                </ig:RowAdding>
                                <ig:RowDeleting ShowDeleteButton="True"></ig:RowDeleting>
                                <ig:RowEditingTemplate CancelButton="buttonCancel" OKButton="buttonOK">
                                    <EditModeActions MouseClick="Single"></EditModeActions>
                                    <ClientBindings>
                                        <ig:RowEditingClientBinding ColumnKey="IdPoint" ControlID="control_IdPoint" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="NamePoint" ControlID="control_NamePoint" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Lat" ControlID="control_Lat" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Lng" ControlID="control_Lng" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="AddressPoint" ControlID="control_Address" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="IdService" ControlID="control_IdService" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Description" ControlID="control_Description" GetValueJavaScript="$get({ClientID}).value" SetValueJavaScript="$get({ClientID}).value={value} == null ? '' : {value}" />
                                    </ClientBindings>
                                    <Template>
                                        <div class="row" style="background-color: white; border: 1px solid black; width: 600px; padding: 15px;">
                                            
                                            <div style="text-align:center; font-size: 16pt">
                                                <center>
                                                <table>
                                                    <tr>
                                                        <td><label>Mã điểm dịch vụ:</label></td>
                                                        <td><asp:TextBox ID="control_IdPoint" Enabled="false" CssClass="form-control" Width="50px" runat="server"></asp:TextBox></td>
                                                    </tr>
                                                </table>
                                                </center>
                                            </div>
                                            <br />
                                            <div class="input-group">
                                                <span class="input-group-addon" style="width:100px">Name Point</span>
                                                <asp:TextBox ID="control_NamePoint" CssClass="form-control" Width="450px" runat="server"></asp:TextBox>
                                            </div>
                                            <br />
                                            <div class="input-group">
                                                <span class="input-group-addon" style="width:100px">Lat & Lng</span>
                                                <asp:TextBox ID="control_Lat" CssClass="form-control" Width="225px" runat="server"></asp:TextBox>
                                                <asp:TextBox ID="control_Lng" CssClass="form-control" Width="225px" runat="server"></asp:TextBox>
                                            </div>
                                            <br />
                                            <div class="input-group">
                                                <span class="input-group-addon" style="width:100px">Address</span>
                                                <asp:TextBox ID="control_Address" CssClass="form-control" Width="450px" runat="server"></asp:TextBox>
                                            </div>
                                            <br />
                                            <div class="input-group">
                                                <span class="input-group-addon" style="width:100px">IdService</span>
                                                <asp:DropDownList ID="ddrService" Width="200px" CssClass="form-control" runat="server" DataSourceID="loadServiceToDrop" DataTextField="NameService" DataValueField="IdService"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="loadServiceToDrop" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' SelectCommand="SELECT * FROM [Service]"></asp:SqlDataSource>
                                                <asp:TextBox ID="control_IdService" Width="250px" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <br />
                                           <asp:TextBox ID="control_Description" runat="server" Visible="true" TextMode="MultiLine" Width="550px" Height="200px"></asp:TextBox>

                                            <style type="text/css">
                                                input, select, textarea {
                                                    max-width: 800px;
                                                }
                                            </style>
                                            <div style="margin-top:20px; padding-right:30px;" class="fa-pull-right">
                                                <asp:Button CssClass="btn btn-warning" ID="buttonOK" runat="server" OnClientClick="return" Text="OK" UseSubmitBehavior="False" />
                                                <asp:Button CssClass="btn btn-defalut" ID="buttonCancel" runat="server" CausesValidation="False" OnClientClick="return" Text="Cancel" UseSubmitBehavior="False" />

                                            </div>
                                            </div>
                                    </Template>
                                </ig:RowEditingTemplate>
                            </Behaviors>
                        </ig:EditingCore>
                        <ig:Selection CellClickAction="Row" RowSelectType="Single"></ig:Selection>
                        <ig:RowSelectors></ig:RowSelectors>
                        <ig:Activation></ig:Activation>
                        <ig:ColumnResizing></ig:ColumnResizing>
                        <ig:VirtualScrolling></ig:VirtualScrolling>
                        <ig:Filtering></ig:Filtering>
                        <ig:Paging></ig:Paging>
                        <ig:Sorting></ig:Sorting>
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
            <%--<div id="infopoint" class="tab-pane fade">
                <h3>Quản lý thông tin điểm dịch vụ</h3>
                <table style="width: 100%" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Name Point</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Address</th>
                            <th>Image</th>
                            <th>Status</th>
                            <th>Create By</th>
                            <th>Create Day</th>
                            <th>Edit By</th>
                            <th>Edit Day</th>
                            <th>#</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>John</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>
                                <button class="btn btn-warning">Sửa</button>
                                <button class="btn btn-danger">Xoá</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Mary</td>
                            <td>Moe</td>
                            <td>mary@example.com</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>
                                <button class="btn btn-warning">Sửa</button>
                                <button class="btn btn-danger">Xoá</button>
                            </td>
                        </tr>
                        <tr>
                            <td>July</td>
                            <td>Dooley</td>
                            <td>july@example.com</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>
                                <button class="btn btn-warning">Sửa</button>
                                <button class="btn btn-danger">Xoá</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="request" class="tab-pane fade">
                <h3>Danh sách yêu cầu chứng thực</h3>
                <table class="table table-striped">
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
                </table>
            </div>--%>
        </div>
    </div>

</asp:Content>
