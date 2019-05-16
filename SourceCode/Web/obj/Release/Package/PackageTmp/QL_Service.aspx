<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QL_Service.aspx.cs" Inherits="Web.QL_Service" %>

<%@ Register Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>
<%@ Register TagPrefix="ig" Namespace="Infragistics.Web.UI.DataSourceControls" Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-left: 20px">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#service">Service</a></li>
            <li><a data-toggle="tab" href="#point">Point</a></li>
            <li><a data-toggle="tab" href="#infopoint">Info Point</a></li>
            <li><a data-toggle="tab" href="#request">Requests</a></li>
        </ul>

        <div class="tab-content">
            <div id="service" class="tab-pane fade in active">
                <h3>Danh sách dịch vụ</h3>
                <ig:WebHierarchicalDataGrid ID="whService" runat="server" Height="100%" Width="100%" AutoGenerateColumns="False" DataKeyFields="IdType" DataMember="loadType_DefaultView" DataSourceID="WebHierarchicalDataSource1" Key="loadType_DefaultView">
                    <Bands>
                        <ig:Band Key="laodService_DefaultView" DataMember="laodService_DefaultView" DataKeyFields="IdService" AutoGenerateColumns="False">
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
                                        <ig:BoundDataField DataFieldName="Icon" Key="Icon">
                                            <Header Text="Icon"></Header>
                                        </ig:BoundDataField>
                                        <ig:BoundDataField DataFieldName="AddressPoint" Key="AddressPoint">
                                            <Header Text="AddressPoint"></Header>
                                        </ig:BoundDataField>
                                        <ig:BoundDataField DataFieldName="IdService" Key="IdService">
                                            <Header Text="IdService"></Header>
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
                        </ig:Band>
                    </Bands>
                    <GroupingSettings EnableColumnGrouping="True"></GroupingSettings>
                    <Columns>
                        <ig:BoundDataField DataFieldName="IdType" Key="IdType">
                            <Header Text="IdType"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="NameType" Key="NameType">
                            <Header Text="NameType"></Header>
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="IconType" Key="IconType">
                            <Header Text="IconType"></Header>
                        </ig:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <ig:EditingCore>
                            <Behaviors>
                                <ig:RowEditing>
                                    <ColumnSettings>
                                        <ig:EditingColumnSetting ReadOnly="True" ColumnKey="IdType"></ig:EditingColumnSetting>
                                        <ig:EditingColumnSetting ColumnKey="NameType"></ig:EditingColumnSetting>
                                        <ig:EditingColumnSetting ColumnKey="IconType"></ig:EditingColumnSetting>
                                    </ColumnSettings>
                                </ig:RowEditing>
                                <ig:RowAdding>
                                    <ColumnSettings>
                                        <ig:RowAddingColumnSetting ReadOnly="True" ColumnKey="IdType"></ig:RowAddingColumnSetting>
                                        <ig:RowAddingColumnSetting ColumnKey="NameType"></ig:RowAddingColumnSetting>
                                        <ig:RowAddingColumnSetting ColumnKey="IconType"></ig:RowAddingColumnSetting>
                                    </ColumnSettings>
                                </ig:RowAdding>
                                <ig:RowDeleting></ig:RowDeleting>
                            </Behaviors>
                        </ig:EditingCore>
                        <ig:Selection CellClickAction="Row" RowSelectType="Single"></ig:Selection>
                        <ig:RowSelectors></ig:RowSelectors>
                        <ig:Paging></ig:Paging>
                        <ig:Filtering></ig:Filtering>
                        <ig:Sorting></ig:Sorting>
                        <ig:Activation></ig:Activation>
                        <ig:ColumnResizing></ig:ColumnResizing>
                    </Behaviors>
                </ig:WebHierarchicalDataGrid>
                <style>
                    .igg_Control {
                        height:1000px !important;
                    }
                </style>
                <%--<table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name Service</th>
                            <th>Status</th>
                            <th>Permission</th>
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
                            <td>
                                <button class="btn btn-warning">Sửa</button>
                                <button class="btn btn-danger">Xoá</button>
                            </td>
                        </tr>
                    </tbody>
                </table>--%>

                <ig:WebHierarchicalDataSource runat="server" ID="WebHierarchicalDataSource1">
                    <DataViews>
                        <ig:DataView DataMember="DefaultView" ID="loadType_DefaultView" DataSourceID="loadType"></ig:DataView>
                        <ig:DataView DataMember="DefaultView" ID="laodService_DefaultView" DataSourceID="laodService"></ig:DataView>
                        <ig:DataView DataMember="DefaultView" ID="loadPoint_DefaultView" DataSourceID="loadPoint"></ig:DataView>
                    </DataViews>
                    <DataRelations>
                        <ig:DataRelation ChildDataViewID="laodService_DefaultView" ChildColumns="TypeServiceID" ParentDataViewID="loadType_DefaultView" ParentColumns="IdType"></ig:DataRelation>
                        <ig:DataRelation ChildDataViewID="loadPoint_DefaultView" ChildColumns="IdService" ParentDataViewID="laodService_DefaultView" ParentColumns="IdService"></ig:DataRelation>
                    </DataRelations>
                </ig:WebHierarchicalDataSource>
                <asp:SqlDataSource runat="server" ID="loadPoint" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' DeleteCommand="DELETE FROM [Point] WHERE [IdPoint] = @IdPoint" InsertCommand="INSERT INTO [Point] ([NamePoint], [Lat], [Lng], [Icon], [AddressPoint], [IdService], [Description], [Status], [Permission], [UserCreate], [CreateDate], [UserEdit], [EditDate]) VALUES (@NamePoint, @Lat, @Lng, @Icon, @AddressPoint, @IdService, @Description, @Status, @Permission, @UserCreate, @CreateDate, @UserEdit, @EditDate)" SelectCommand="SELECT * FROM [Point]" UpdateCommand="UPDATE [Point] SET [NamePoint] = @NamePoint, [Lat] = @Lat, [Lng] = @Lng, [Icon] = @Icon, [AddressPoint] = @AddressPoint, [IdService] = @IdService, [Description] = @Description, [Status] = @Status, [Permission] = @Permission, [UserCreate] = @UserCreate, [CreateDate] = @CreateDate, [UserEdit] = @UserEdit, [EditDate] = @EditDate WHERE [IdPoint] = @IdPoint">
                    <DeleteParameters>
                        <asp:Parameter Name="IdPoint" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="NamePoint" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Lat" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Lng" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Icon" Type="String"></asp:Parameter>
                        <asp:Parameter Name="AddressPoint" Type="String"></asp:Parameter>
                        <asp:Parameter Name="IdService" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Status" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Permission" Type="String"></asp:Parameter>
                        <asp:Parameter Name="UserCreate" Type="String"></asp:Parameter>
                        <asp:Parameter Name="CreateDate" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="UserEdit" Type="String"></asp:Parameter>
                        <asp:Parameter Name="EditDate" Type="DateTime"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="NamePoint" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Lat" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Lng" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Icon" Type="String"></asp:Parameter>
                        <asp:Parameter Name="AddressPoint" Type="String"></asp:Parameter>
                        <asp:Parameter Name="IdService" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Status" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Permission" Type="String"></asp:Parameter>
                        <asp:Parameter Name="UserCreate" Type="String"></asp:Parameter>
                        <asp:Parameter Name="CreateDate" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="UserEdit" Type="String"></asp:Parameter>
                        <asp:Parameter Name="EditDate" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="IdPoint" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="laodService" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' DeleteCommand="DELETE FROM [Service] WHERE [IdService] = @IdService" InsertCommand="INSERT INTO [Service] ([NameService], [TypeServiceID], [IconDisplay], [Status], [Permission], [UserCreate], [CreateDate], [UserEdit], [EditDate]) VALUES (@NameService, @TypeServiceID, @IconDisplay, @Status, @Permission, @UserCreate, @CreateDate, @UserEdit, @EditDate)" SelectCommand="SELECT * FROM [Service]" UpdateCommand="UPDATE [Service] SET [NameService] = @NameService, [TypeServiceID] = @TypeServiceID, [IconDisplay] = @IconDisplay, [Status] = @Status, [Permission] = @Permission, [UserCreate] = @UserCreate, [CreateDate] = @CreateDate, [UserEdit] = @UserEdit, [EditDate] = @EditDate WHERE [IdService] = @IdService">
                    <DeleteParameters>
                        <asp:Parameter Name="IdService" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="NameService" Type="String"></asp:Parameter>
                        <asp:Parameter Name="TypeServiceID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="IconDisplay" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Status" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Permission" Type="String"></asp:Parameter>
                        <asp:Parameter Name="UserCreate" Type="String"></asp:Parameter>
                        <asp:Parameter Name="CreateDate" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="UserEdit" Type="String"></asp:Parameter>
                        <asp:Parameter Name="EditDate" Type="DateTime"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="NameService" Type="String"></asp:Parameter>
                        <asp:Parameter Name="TypeServiceID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="IconDisplay" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Status" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Permission" Type="String"></asp:Parameter>
                        <asp:Parameter Name="UserCreate" Type="String"></asp:Parameter>
                        <asp:Parameter Name="CreateDate" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="UserEdit" Type="String"></asp:Parameter>
                        <asp:Parameter Name="EditDate" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="IdService" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="loadType" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' DeleteCommand="DELETE FROM [TypeService] WHERE [IdType] = @IdType" InsertCommand="INSERT INTO [TypeService] ([NameType], [IconType]) VALUES (@NameType, @IconType)" SelectCommand="SELECT * FROM [TypeService]" UpdateCommand="UPDATE [TypeService] SET [NameType] = @NameType, [IconType] = @IconType WHERE [IdType] = @IdType">
                    <DeleteParameters>
                        <asp:Parameter Name="IdType" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="NameType" Type="String"></asp:Parameter>
                        <asp:Parameter Name="IconType" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="NameType" Type="String"></asp:Parameter>
                        <asp:Parameter Name="IconType" Type="String"></asp:Parameter>
                        <asp:Parameter Name="IdType" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <div id="point" class="tab-pane fade">
                <h3> Danh sách điểm dịch vụ</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name Point</th>
                            <th>Lat</th>
                            <th>Lng</th>
                            <th>Icon</th>
                            <th>Address point</th>
                            <th>ID Service</th>
                            <th>Description</th>
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
                            <td>John</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                            <td>John</td>
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
                            <td>John</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>Mary</td>
                            <td>Moe</td>
                            <td>mary@example.com</td>
                            <td>John</td>
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
                            <td>John</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>July</td>
                            <td>Dooley</td>
                            <td>july@example.com</td>
                            <td>John</td>
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
            <div id="infopoint" class="tab-pane fade">
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
            </div>
        </div>
    </div>

</asp:Content>
