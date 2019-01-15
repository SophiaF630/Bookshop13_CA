<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerLogin.aspx.cs" Inherits="Bookshop13_CA.ManagerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }

        .button {
             -webkit-transition-duration: 0.4s; /* Safari */
             transition-duration: 0.4s;
             color:forestgreen;
        }

        .button:hover {
             background-color: #4CAF50; /* Green */
            color: red;
        }


    </style>
</head>
<body style="height:100%;width:100%;top:0;position:absolute">

        <form id="form1" runat="server" style="height:100%;width:100%;top:0;">

        <div style="background-position: center; background-image: url('Images/backgrand.png'); font-style: inherit; font-size: large; background-attachment: inherit; background-repeat: repeat; color: #FFFFFF; text-transform: capitalize; font-variant: normal; font-weight: normal; font-family: 'Century Gothic'; height: 100%; width: 100%; ">


            <br />
            <br />

            <div class="auto-style1" style="height: 317px; width: 556px; margin:auto;  right: 0px;top: 30%; left: 0px; background-image: url('Images/login%20textbox%20bg.png'); background-size:cover ;background-repeat:no-repeat;">

                <br />
                <br />
                <br />
                Account
            <asp:TextBox ID="TextBox2" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Ridge" style="margin-bottom: 0px" Width="190px"></asp:TextBox>


                <br />
                <br />
                Password


            <asp:TextBox ID="TextBox1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Ridge" Width="190px" TextMode="Password"></asp:TextBox>
                <br />
                <br />

                <asp:Button ID="Button1" runat="server"  BorderColor="Black" BorderStyle="Ridge" Text="Log In" OnClick="Button1_Click" />



            </div>


        </div>

    </form>
</body>
</html>
