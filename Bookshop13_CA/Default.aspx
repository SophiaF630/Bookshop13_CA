<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Bookshop13_CA._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <link rel="stylesheet" href="swiper.min.css" type="text/css" />
    <link rel="stylesheet" href="style.css" type="text/css" />
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
    <div style="margin-top: 70px;">
        <div class ="row">
        <table>
            <tr>
                <td class="auto-style1">
                   
                        <div class="form-group col-xs-4 col-lg-6">
                            <asp:DropDownList ID="DropDownList_SearchCatalogue" CssClass="form-control" runat="server" Width="157px">
                                <asp:ListItem>Full Catalogue</asp:ListItem>
                                <asp:ListItem>Book Title</asp:ListItem>
                                <asp:ListItem>Author</asp:ListItem>
                                <asp:ListItem>Category</asp:ListItem>
                                <asp:ListItem>ISBN</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                   
                </td>
                <td class="auto-style2">
                    
                        <div class="form-group col-xs-4 col-lg-6">
                            <asp:TextBox ID="TextBox_Search" runat="server" CssClass="form-control" Width="277px"></asp:TextBox>
                        </div>
                    
                </td>
                <td>

                    <p>
                        <asp:Button ID="Button_Search" runat="server" Text="Search" CssClass="btn btn-default" OnClick="Button_Search_Click" />
                    </p>
                </td>
            </tr>
        </table>
            </div>
    </div>
    <div>
        <h1 style="color: black;">Top Books on Sale</h1>
        <div class="swiper-container swiper-init" data-initial-slide-index="4" >
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="Images/9781593276034.jpg" />
                </div>
                <div class="swiper-slide">
                    <img src="Images/9780691169019.jpg" />
                </div>
                <div class="swiper-slide">
                    <img src="Images/9780812995800.jpg" />
                </div>
                <div class="swiper-slide" >
                    <img src="Images/9780997584714.jpg" />
                </div>
                <div class="swiper-slide">
                    <img src="Images/9781119144755.jpg" />
                </div>
                <div class="swiper-slide">
                    <img src="Images/9781484732748.jpg" />
                </div>
                <div class="swiper-slide">
                    <img src="Images/9781506703671.jpg" />
                </div>
                <div class="swiper-slide">
                    <img src="Images/9781419721373.jpg" />
                </div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
        </div>

    </div>
    <br />
    
    <br />
    <hr />
    <div class="container">
    <div class="row">
    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
        <ItemTemplate>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                            <div class="card">
                        <table style="width: 100%; padding-bottom: 10%; height: 400px">
                            <tr>
                                <td class="auto-style3">
                                    <%--<asp:Image ID="Image1" ImageUrl="Images/<%# Eval("ISBN") %>.jpg" runat="server" Height="261px" Width="188px" />--%>
                                    <image src="images/<%# Eval("ISBN") %>.jpg" width="180" height="200"></image>
                                </td>                                
                            </tr>
                            <tr>
                                 <td><asp:Label ID="Label1" runat="server" style="color: black; font-weight: bold; font-size:14px" Text='<%# Eval("Title")%>'> ></asp:Label></td>
                            </tr>
                            <tr>
                                 <td class="auto-style4">
                                 <asp:Label ID="Label2" runat="server" Text='<%# Eval("Author")%>' style="color: black;"></asp:Label></td>
                            </tr>
                            <tr>
                                 <td class="auto-style4">
                                 <asp:Label ID="Label4" runat="server" Text='<%# Eval("ISBN")%>' style="color: black;" ></asp:Label></td>
                            </tr>
                            <tr> 
                                 <td class="auto-style4">
                                 <asp:Label ID="Label5" runat="server" style="color: black;" Text='<%# Eval("Categoryname")%>' ></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="auto-style4">
                                <asp:Label ID="Label7" runat="server" style="color: red; font-weight: bold; font-size:16px " Text='<%# "S$" + Convert.ToString(Eval("DiscountPrice")) %>' ></asp:Label>
                                <asp:Label ID="Label6" runat="server" style="text-decoration: line-through" Text='<%# " (Original Price: S$" + Convert.ToString(Eval("Price")) + ")"%>'></asp:Label></td>
                            </tr>
                            <tr>
                                 <td class="auto-style9">
                                 <div style="padding-right: 10px;">
                                 <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-default" CommandName="Add to Cart">Add to Cart</asp:LinkButton>
                                 </div>
                            </tr>
                            </table>
                            </div>
                            </div>
                    </ItemTemplate>       
    </asp:Repeater>
                            </div>
        </div>


    <script src="swiper.min.js" type="text/javascript"></script>
    <script>
        var swiper = new Swiper('.swiper-container', {
            effect: 'coverflow',
            grabCursor: true,
            centeredSlides: true,
            slidesPerView: 'auto',
            coverflowEffect: {
                rotate: 50,
                stretch: 0,
                depth: 100,
                modifier: 1,
                slideShadows: true,
            },
            pagination: {
                el: '.swiper-pagination',
            },
        });
    </script>


</asp:Content>
