<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Web.Contact" %>

<%@ Register Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <style type="text/css">
        tbody.igg_Item > tr > td {
            white-space:nowrap;
        }
    </style>
    <ig:WebDataGrid ID="wdgUsers" runat="server" Height="100%" Width="100%" AutoGenerateColumns="False" DataKeyFields="UserName" EnableAjax="False" OnInit="wdgUsers_Init" OnRowAdding="wdgUsers_RowAdding" OnRowsDeleting="wdgUsers_RowsDeleting" OnRowUpdating="wdgUsers_RowUpdating">
        <Behaviors>
            <ig:Activation>
            </ig:Activation>
            <ig:ColumnResizing>
            </ig:ColumnResizing>
            <ig:EditingCore>
                <Behaviors>
                    <ig:CellEditing>
                    </ig:CellEditing>
                    <ig:RowAdding>
                    </ig:RowAdding>
                    <ig:RowDeleting>
                    </ig:RowDeleting>
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
                                        <input type="text" class="form-control" id="control_UserName" runat="server"  />
<%--                                        <asp:TextBox CssClass="form-control" ID="control_UserName" runat="server"></asp:TextBox>--%>
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
                                    
<%--                                    <img style="width:230px; height:300px" src="$get({ClientID}).value"/>--%>
                                    <asp:Image ID="Images" runat="server" ImageUrl="<%#image() %>" Width="230px" Height="260px" />
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
    <asp:SqlDataSource ID="loadtblUser" runat="server" ConnectionString='<%$ ConnectionStrings:BDMapConnectionString %>' SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
</asp:Content>

