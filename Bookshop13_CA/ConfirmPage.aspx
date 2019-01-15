<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmPage.aspx.cs" Inherits="Bookshop13_CA.ConfirmPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="./Content/style_materialpro.css" type="text/css" />
        <div id="top" class="text-center">
            <h1>Your order details </h1>
            <h4>Thank you for shopping at 13ookshop!</h4>
            <h4>Here's what you ordered:</h4>
        </div>
        <div class="text-center">

            <asp:DataGrid ID="GridView1" runat="server" HorizontalAlign ="Center" Width="546px">
            </asp:DataGrid>
            <br />
            <asp:Label ID="Label_TotalPrice" runat="server" style = "font-weight: bold; font-size:16px" Text="Price"></asp:Label>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ></asp:SqlDataSource>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Continue shopping</asp:HyperLink>
</asp:Content>
