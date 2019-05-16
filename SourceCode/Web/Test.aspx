<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Web.Test" %>

<%@ Register Assembly="Infragistics45.WebUI.WebHtmlEditor.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.WebHtmlEditor" TagPrefix="ighedit" %>

<%@ Register Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.EditorControls" TagPrefix="ig" %>

<%@ Register Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>
<%@ Register TagPrefix="ig" Namespace="Infragistics.Web.UI.DataSourceControls" Assembly="Infragistics45.Web.v19.1, Version=19.1.20191.115, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://cloud.tinymce.com/5/tinymce.min.js?apiKey=qagffr3pkuv17a8on1afax661irst1hbr4e6tbv888sz91jc"></script>
    <script>
        tinymce.init({
            selector: '#description'
        });

        
    </script>
    <div class="row">
        <div class="input-group">
            <span class="input-group-addon">Id</span>
            <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
        </div><br />
        <div class="input-group">
            <span class="input-group-addon">Name Point</span>
            <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
        </div><br />
        <div class="input-group">
            <span class="input-group-addon">Lat & Lng</span>
            <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
            <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
        </div><br />
        <div class="input-group">
            <span class="input-group-addon">Address</span>
            <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
        </div><br />
        <div class="input-group">
            <span class="input-group-addon">IdService</span>
            <asp:DropDownList ID="ddrService" runat="server"></asp:DropDownList>
            <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
        </div><br />

        <div>
            <textarea id="description"></textarea>
        </div>

    </div>
</asp:Content>
