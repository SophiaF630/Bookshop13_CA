<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="Bookshop13_CA.SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="./Content/style_materialpro.css" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 171px;
        }

        .auto-style2 {
            width: 304px;
        }

        .auto-style3 {
            width: 199px;
        }

        .auto-style4 {
            height: 24px;
        }

        .auto-style6 {
            height: 24px;
            width: 92px;
            text-align: left;
        }

        .auto-style8 {
            width: 92px;
            text-align: left;
        }

        .auto-style9 {
            text-align: right;
        }

        .auto-style10 {
            width: 100%;
        }

        .auto-style11 {
            width: 218px;
            height: 218px;
        }
    </style>

    <div>
        <table>
            <tr>
                <td class="auto-style1">
                    <p>
                        <div class="form-group col-xs-4 col-lg-6">
                            <asp:DropDownList ID="DropDownList_SearchCatalogue" CssClass="form-control" runat="server" Width="157px">
                                <asp:ListItem>Full Catalogue</asp:ListItem>
                                <asp:ListItem>Book Title</asp:ListItem>
                                <asp:ListItem>Author</asp:ListItem>
                                <asp:ListItem>Category</asp:ListItem>
                                <asp:ListItem>ISBN</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </p>
                </td>
                <td class="auto-style2">
                    <p>
                        <div class="form-group col-xs-4 col-lg-6">
                            <asp:TextBox ID="TextBox_Search" runat="server" CssClass="form-control" Width="277px"></asp:TextBox>
                        </div>
                    </p>
                </td>
                <td>

                    <p>
                        <asp:Button ID="Button_Search" runat="server" Text="Search" CssClass="btn btn-default" OnClick="Button_Search_Click" />

                    </p>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <div class="container">
                        <div class="row">
                            <asp:Repeater ID="Repeater_SearchResult" runat="server" OnItemCommand="Repeater_SearchResult_ItemCommand">
                                <ItemTemplate>
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="padding-bottom: 10px;">
                                        <div class="card">
                                            <table style="width: 100%; padding-bottom: 10%; height: 290px">
                                                <tr>
                                                    <td class="auto-style3">
                                                        <%--<asp:Image ID="Image1" ImageUrl="Image/<%# Eval("ISBN") %>.jpg" runat="server" Height="261px" Width="188px" />--%>
                                                        <image src="Images/<%# Eval("ISBN") %>.jpg" width="200" height="220"></image>
                                                    </td>
                                                    <td>
                                                        <table class="auto-style10">
                                                            <tr>
                                                                <td class="auto-style8" style="vertical-align: top;">Title:</td>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title")%>' Style="vertical-align: top;"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style6">Author:</td>
                                                                <td class="auto-style4">
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Author")%>'></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style8">Category:</td>
                                                                <td class="auto-style4">
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("CategoryName")%>'></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style8">ISBN</td>
                                                                <td class="auto-style4">
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("ISBN")%>'></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style8">Price</td>
                                                                <td class="auto-style4">
                                                                    <asp:Label ID="Label7" runat="server" Style="color: red; font-weight: bold; font-size: 16px" Text='<%# "S$" + Convert.ToString(Eval("DiscountPrice")) %>'></asp:Label>
                                                                    <asp:Label ID="Label6" runat="server" Style="text-decoration: line-through" Text='<%# " (Original Price: S$" + Convert.ToString(Eval("Price")) + ")"%>'></asp:Label></td>
                                                                <%--<asp:Label ID="Label6" runat="server" Text='<%# "S$" + Convert.ToString(Eval("DiscountPrice")) + " (Original Price: S$" + Convert.ToString(Eval("Price")) + ")"%>'></asp:Label></td>--%>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style8">Stock</td>
                                                                <td class="auto-style4">
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Stock")%>'></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style8">&nbsp;</td>
                                                                <td class="auto-style9">
                                                                    <%-- <asp:Button ID="Button_AddToCart" runat="server" Text="Add to Cart" OnClick="Button_AddToCart_Click" />--%>
                                                                    <div style="padding-right: 10px;">
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-default" CommandName="Add to Cart">Add to Cart</asp:LinkButton>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>


                    </div>


                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                </td>

            </tr>

        </table>

    </div>

</asp:Content>
