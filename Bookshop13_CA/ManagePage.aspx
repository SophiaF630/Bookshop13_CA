<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagePage.aspx.cs" Inherits="Bookshop13_CA.ManagePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
         div.inner{
            white-space:nowrap;
            display: inline-block;
            color:darksalmon;
            font-size:larger;
            font-weight:700
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width = 100%" id ="div1">
            <div style="width: 100%;width:100%;position:fixed;background-color: #367BFC">
                <div class ="inner">
                <asp:Label ID="Label2" runat="server" Text="Title:"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div>
                <div class ="inner">
                <asp:Label ID="Label3" runat="server" Text="Category:"></asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Value="1">Childen</asp:ListItem>
                    <asp:ListItem Value="2">Finance</asp:ListItem>
                    <asp:ListItem Value="3">Non-Fiction</asp:ListItem>
                    <asp:ListItem Value="4">Technical</asp:ListItem>
                    </asp:DropDownList></div>
                <div class ="inner">
                <asp:Label ID="Label4" runat="server" Text="ISBN:"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></div>
                <div class ="inner">
                <asp:Label ID="Label5" runat="server" Text="Author:"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></div>
                <div class ="inner">
                <asp:Label ID="Label6" runat="server" Text="Stock:"></asp:Label>
                <asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList></div>
                <div class ="inner">
                <asp:Label ID="Label7" runat="server" Text="Price:"></asp:Label>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></div>
                <div class ="inner">
                <asp:Label ID="Label1" runat="server" Text="show:"></asp:Label>
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></div>
                <div class ="inner">
                <asp:Label ID="Label14" runat="server" Text="Discount:"></asp:Label>
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></div>
                <div>
                <asp:Button ID="Button3" runat="server" Text="Add" OnClick="Button3_Click" /></div>
            </div>
            <div style="width: 100%;width:100%;background-color: #367BFC;visibility:hidden">
                <div class ="inner">
                <asp:Label ID="Label8" runat="server" Text="Title:"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></div>
                <div class ="inner">
                <asp:Label ID="Label9" runat="server" Text="Category:"></asp:Label>
                <asp:DropDownList ID="DropDownList4" runat="server">
                    <asp:ListItem Value="3">Non-Fiction</asp:ListItem>
                    </asp:DropDownList></div>
                <div class ="inner">
                <asp:Label ID="Label10" runat="server" Text="ISBN:"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></div>
                <div class ="inner">
                <asp:Label ID="Label11" runat="server" Text="Author:"></asp:Label>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></div>
                <div class ="inner">
                <asp:Label ID="Label12" runat="server" Text="Stock:"></asp:Label>
                <asp:DropDownList ID="DropDownList5" runat="server">
                    <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList></div>
                <div class ="inner">
                <asp:Label ID="Label13" runat="server" Text="Price:"></asp:Label>
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></div>
                <div>
                <asp:Button ID="Button4" runat="server" Text="Update" OnClick="Button4_Click" />
                <asp:Button ID="Button5" runat="server" Text="Delete" />
                <asp:Button ID="Button6" runat="server" Text="Add" /></div>
            </div>
            <div id ="div2"></div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BookID" Width="928px" AllowSorting="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <%--<asp:BoundField DataField="BookID" HeaderText="BookID" InsertVisible="False" ReadOnly="True" SortExpression="BookID" />--%>
                    <asp:BoundField DataField="BookID" HeaderText="BookID" InsertVisible="False" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Title">
                        <ItemTemplate>
                            <asp:Label ID="lblTitle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Title") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTitle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Title") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CategoryID">
                        <ItemTemplate>
                            <asp:Label ID="lblCategoryID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"CategoryID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCategoryID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"CategoryID") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ISBN">
                        <ItemTemplate>
                            <asp:Label ID="lblISBN" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ISBN") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtISBN" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ISBN") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Author">
                        <ItemTemplate>
                            <asp:Label ID="lblAuthor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Author") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAuthor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Author") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock">
                        <ItemTemplate>
                            <asp:Label ID="lblStock" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Stock") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtStock" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Stock") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="lblPrice" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Price") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrice" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Price") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="show">
                        <ItemTemplate>
                            <asp:Label ID="lblshow" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"show") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtshow" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"show") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Discount">
                        <ItemTemplate>
                            <asp:Label ID="lblDiscount" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Discount") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDiscount" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Discount") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="New" SelectText="Select" UpdateText="Update"  />
                    
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
