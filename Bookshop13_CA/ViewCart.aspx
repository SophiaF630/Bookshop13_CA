<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="Bookshop13_CA.ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="./Content/style_materialpro.css" type="text/css" />
    <h1>Orders:</h1>
    <div class="container">
        <div class="row">
            <div class="col-xs-12" style="padding-bottom: 0px;">
                <div class="card" style="padding-bottom: 2px; margin-bottom: 2px;">
                    <table style="width: 100%; padding-bottom: 10%;">
                        <tr style="text-align: center; padding: 10px;">
                            <td class="auto-style3" width="15%">Cover Image
                            </td>
                            <td width="15%">Title</td>
                            <td class="auto-style4" width="15%">Author</td>
                            <td class="auto-style4" width="15%">ISBN</td>
                            <td class="auto-style4" width="15%">Price</td>

                            <td class="auto-style4" width="15%">Quantity
                            </td>
                            <td class="auto-style4" width="15%">Action
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <asp:Repeater ID="Repeater_ViewCart" runat="server" OnItemCommand="Repeater_ViewCart_ItemCommand">
                <ItemTemplate>
                    <div class="col-xs-12" style="padding-bottom: 2px;">
                        <div class="card" style="padding-bottom: 2px; margin-bottom: 2px;">
                            <table style="width: 100%; padding-bottom: 10%;">
                                <tr style="text-align: center;">
                                    <td class="auto-style3" width="15%">
                                        <image src="Images/<%# Eval("ISBN") %>.jpg" width="100"></image>
                                    </td>

                                    <td width="15%">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title")%>' Style="vertical-align: top;"></asp:Label></td>
                                    <td class="auto-style4" width="15%">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Author")%>'></asp:Label></td>
                                    <td class="auto-style4" width="15%">
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("ISBN")%>'></asp:Label></td>
                                    <td class="auto-style4" width="15%">
                                        <asp:Label ID="Label6" runat="server" Text='<%# "S$" + Convert.ToString(Eval("DiscountPrice")) %>'></asp:Label></td>

                                    <td class="auto-style4" width="15%">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-default" CommandName="-">-</asp:LinkButton>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Quantity")%>'></asp:Label>

                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-default" CommandName="+">+</asp:LinkButton>
                                    </td>
                                    <td class="auto-style4" width="15%">
                                        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-default" CommandName="RemoveItem">Remove Item</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <table style="width:98%; padding-top: 10px" align="right">
                <tr style="text-align: center;" >
                    <td width="75%" class="text-right"> <asp:Label ID="Label_Price" runat="server" Text="Total Price"></asp:Label></td>
                    <td class="auto-style4" width="15%"><asp:Button ID="Button_Pay" runat="server" Text="Payment" CssClass="btn btn-default" OnClick="Button_Pay_Click" /></td>
                </tr>
                </table>
            <br />
        </div>
    </div>
    <table>
        <tr>
           
        </tr>
    </table>
</asp:Content>
