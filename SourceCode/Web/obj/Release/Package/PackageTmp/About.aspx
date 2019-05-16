<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Web.About" %>

<%@ Register Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>

<%@ Register Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI" TagPrefix="ig" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>

    <%--<ig:WebDataGrid ID="wdgUser" runat="server" Height="100%" Width="100%" AutoGenerateColumns="False" DataKeyFields="UserName" EnableAjax="False" OnInit="wdgUser_Init" OnRowAdding="wdgUser_RowAdding" OnRowsDeleting="wdgUser_RowsDeleting" OnRowUpdating="wdgUser_RowUpdating">
        <Behaviors>
            <ig:Activation></ig:Activation>
            <ig:ColumnResizing></ig:ColumnResizing>
            <ig:EditingCore AutoCRUD="False">
                <Behaviors>
                    <ig:CellEditing></ig:CellEditing>
                    <ig:RowAdding></ig:RowAdding>
                    <ig:RowDeleting></ig:RowDeleting>
                    <ig:RowEditingTemplate></ig:RowEditingTemplate>
                </Behaviors>
            </ig:EditingCore>
            <ig:Selection CellClickAction="Row" RowSelectType="Single"></ig:Selection>
            <ig:RowSelectors></ig:RowSelectors>
            <ig:Paging></ig:Paging>
            <ig:Filtering></ig:Filtering>
            <ig:VirtualScrolling></ig:VirtualScrolling>
            <ig:Sorting></ig:Sorting>
        </Behaviors>
    </ig:WebDataGrid>--%>
    <asp:SqlDataSource ID="loadtblUsers" runat="server" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>


    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Width="100%" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowAdding="wdgUser_RowAdding">
        <Columns>
            <ig:BoundDataField DataFieldName="UserName" Key="UserName">
                <Header Text="UserName">
                </Header>
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="PassWord" Key="PassWord">
                <Header Text="PassWord">
                </Header>
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="FirstName" Key="FirstName">
                <Header Text="FirstName">
                </Header>
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="LastName" Key="LastName">
                <Header Text="LastName">
                </Header>
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Address" Key="Address">
                <Header Text="Address">
                </Header>
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="PathImages" Key="PathImages">
                <Header Text="PathImages">
                </Header>
            </ig:BoundDataField>
            <ig:BoundCheckBoxField DataFieldName="Status" Key="Status">
                <Header Text="Status">
                </Header>
            </ig:BoundCheckBoxField>
            <ig:BoundDataField DataFieldName="UserCreate" Key="UserCreate">
                <Header Text="UserCreate">
                </Header>
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CreateDate" Key="CreateDate">
                <Header Text="CreateDate">
                </Header>
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="UserEdit" Key="UserEdit">
                <Header Text="UserEdit">
                </Header>
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="EditDate" Key="EditDate">
                <Header Text="EditDate">
                </Header>
            </ig:BoundDataField>
        </Columns>
        <Behaviors>
            <ig:Activation></ig:Activation>
            <ig:EditingCore AutoCRUD="False">
                <Behaviors>
                    <ig:CellEditing></ig:CellEditing>
                    <ig:RowAdding>
                        <EditModeActions EnableOnKeyPress="True" />
                    </ig:RowAdding>
                    <ig:RowDeleting></ig:RowDeleting>
                    <%--<ig:RowEditingTemplate CancelButton="buttonCancel" OKButton="buttonOK">
                        <EditModeActions MouseClick="Double" />
                        <Template>
                            <style>
                                input, select, textarea {
                                    max-width: 300px !important;
                                }
                            </style>

                            <div class="row" style="margin-top: 25px; background: #808080; border-radius:20px;">
                                <div class="col-md-6">
                                    <p style="margin-top: 25px;">
                                        <asp:TextBox ID="username" CssClass="form-control" runat="server" placeholder="UserName" Width="300px"></asp:TextBox>
                                    </p>
                                    <p>
                                        <asp:TextBox ID="pass" CssClass="form-control" runat="server" placeholder="Password" Width="300px"></asp:TextBox>
                                    </p>
                                    <p>
                                        <asp:TextBox ID="first" CssClass="form-control" runat="server" placeholder="First Name" Width="300px"></asp:TextBox>
                                    </p>
                                    <p>
                                        <asp:TextBox ID="last" CssClass="form-control" runat="server" placeholder="Last Name" Width="300px"></asp:TextBox>
                                    </p>
                                    <p>
                                        <asp:TextBox ID="address" CssClass="form-control" runat="server" placeholder="Address" Width="300px"></asp:TextBox>
                                    </p>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>Status:</label>
                                        </div>
                                        <div style="margin-top: -20px;" class="col-md-6">
                                            &nbsp;<asp:DropDownList ID="ddrStatus" CssClass="form-control" Width="100px" runat="server">

                                                <asp:ListItem>Actived</asp:ListItem>
                                                <asp:ListItem>Blocked</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <p style="padding-top: 10px;">
                                        <span class="control-fileupload" style="width: 300px;">
                                            <label for="file">Choose a file :</label>

                                            <input type="file" id="file" runat="server">
                                        </span>
                                    &nbsp;&nbsp;</p>

                                    <p>
                                        <asp:Button ID="buttonOK" CssClass="btn btn-warning" runat="server" OnClientClick="return" Text="OK" UseSubmitBehavior="False" />
                                        <asp:Button ID="buttonCancel" CssClass="btn btn-default" runat="server" CausesValidation="False" OnClientClick="return" Text="Cancel" UseSubmitBehavior="False" />
                                    </p>
                                </div>

                                <div class="col-md-5">
                                    <div style="margin-top:25px;">
                                        <asp:Image ID="imgAvar" runat="server" Width="250px" Height="280px" />
                                    </div>
                                    
                                </div>

                            </div>
                        </Template>
                    </ig:RowEditingTemplate>--%>
                    
                    <ig:RowEditingTemplate CancelButton="buttonCancel" OKButton="buttonOK">
                        <EditModeActions MouseClick="Single" />
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
                            <style>
                                input, select, textarea {
                                    max-width: 300px !important;
                                }
                            </style>

<%--                            <div class="row" style="margin-top: 25px; background: #808080; border-radius: 20px;">
                                <div class="col-md-6">
                                    <p style="margin-top: 25px;">
                                        <asp:TextBox ID="control_UserName" CssClass="form-control" runat="server" placeholder="UserName" Width="300px"></asp:TextBox>
                                    </p>
                                    <p>
                                        <asp:TextBox ID="control_PassWord" CssClass="form-control" runat="server" placeholder="Password" Width="300px"></asp:TextBox>
                                    </p>
                                    <p>
                                        <asp:TextBox ID="control_FirstName" CssClass="form-control" runat="server" placeholder="First Name" Width="300px"></asp:TextBox>
                                    </p>
                                    <p>
                                        <asp:TextBox ID="control_LastName" CssClass="form-control" runat="server" placeholder="Last Name" Width="300px"></asp:TextBox>
                                    </p>
                                    <p>
                                        <asp:TextBox ID="control_Address" CssClass="form-control" runat="server" placeholder="Address" Width="300px"></asp:TextBox>
                                    </p>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>Status:</label>
                                        </div>
                                        <div style="margin-top: -20px;" class="col-md-6">
                                            <asp:TextBox ID="control_Status" runat="server"></asp:TextBox>
                                            &nbsp;<%--<asp:DropDownList ID="control_Status" CssClass="form-control" Width="100px" runat="server">

                                                <asp:ListItem>Actived</asp:ListItem>
                                                <asp:ListItem>Blocked</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        <%--</div>
                                    </div>
                                    <p style="padding-top: 10px;">
                                        <span class="control-fileupload" style="width: 300px;">
                                            <label for="file">Choose a file :</label>

                                            <input type="file" id="file" runat="server">
                                        </span>
                                        &nbsp;&nbsp;
                                    </p>

                                    <p>
                                        <asp:Button ID="buttonOK" CssClass="btn btn-warning" runat="server" OnClientClick="return" Text="OK" UseSubmitBehavior="False" />
                                        <asp:Button ID="buttonCancel" CssClass="btn btn-default" runat="server" CausesValidation="False" OnClientClick="return" Text="Cancel" UseSubmitBehavior="False" />
                                    </p>
                                </div>

                                <div class="col-md-5">
                                    <div style="margin-top: 25px;">
                                        <asp:Image ID="imgAvar" runat="server" Width="250px" Height="280px" />
                                    </div>

                                </div>

                            </div>--%>
                           <div class="row" style="background-color:white;border:1px solid black; width:600px; padding: 15px;">
                               <div class="col-md-7">
                                   <div class="input-group" style="width">
                                       <span class="input-group-addon" style="width: 100px;">UserName</span>
                                       <asp:TextBox CssClass="form-control" ID="control_UserName" runat="server"></asp:TextBox>
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
                                           width:230px !important;
                                       }
                                   </style>
                                   
                                   <asp:Image ID="Image1" runat="server" Width="230px" Height="260px" />
                                   <div style="margin-top:5px;">
                                       <span class="control-fileupload" style="width: 300px;">
                                           <label for="file">Choose a file :</label>

                                           <input type="file" id="file" runat="server" style="width: 80px;"/>
                                       </span>
                                   </div>
                                   <div class="fa-pull-right" style="margin-top:30px;">
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
            <ig:Paging>
                <%--<PagerTemplate>
                    
                    <table>
                        <tr >
                            <td>
                                <div style="margin-left:35px;">
                                    <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="148px"></asp:TextBox></div>
                                </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="148px"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="148px"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server" Height="25px" Width="148px"></asp:TextBox></td>
                        </tr>
                    </table>
                    
                    <asp:Button CssClass="btn btn-success" ID="btnSaveUser" runat="server" Text="Save" />
                </PagerTemplate>--%>
            </ig:Paging>
            <ig:Sorting>
            </ig:Sorting>
        </Behaviors>
        
    </ig:WebDataGrid>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDMapConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
</asp:Content>
