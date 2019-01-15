using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop13_CA
{
    public partial class ViewCart : System.Web.UI.Page
    {
        string user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = Context.User.Identity.GetUserName();

            Repeater_ViewCart.DataSource = BusinessLogic.ShowCartItem(user);
            Repeater_ViewCart.DataBind();
            Label_Price.Text = String.Format( "Price: S$ {0:c}",(new BusinessLogic()).TotalPrice(user));

        }

        protected void Repeater_ViewCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string user = Context.User.Identity.GetUserName();
            switch (e.CommandName)
            {
                case "-":
                    string ISBN = ((Label)e.Item.FindControl("Label4")).Text;
                    (new BusinessLogic()).QuantityDecrease(user, ISBN);
                    break;

                case "+":
                    string ISBN_add = ((Label)e.Item.FindControl("Label4")).Text;
                    (new BusinessLogic()).QuantityIncrease(user, ISBN_add);
                    break;

                case "RemoveItem":
                    string ISBN_remove = ((Label)e.Item.FindControl("Label4")).Text;
                    (new BusinessLogic()).RemoveItem(user, ISBN_remove);
                    break;
            }

            Repeater_ViewCart.DataSource = BusinessLogic.ShowCartItem(user);
            Repeater_ViewCart.DataBind();
            Label_Price.Text = String.Format("Price: S$ {0:c}", (new BusinessLogic()).TotalPrice(user));
        }

        protected void Button_Pay_Click(object sender, EventArgs e)
        {
            //stock need to -1s
            if (Check(user))
                Response.Redirect("ConfirmPage.aspx");
            else
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox1", "alert('Cannot buy it,sorry')", true);
        }

        private bool Check(string username)
        {
            List<Cart> CartList = new BusinessLogic().GetCartItems(username);
            foreach (Cart c in CartList)
            {
                bool result = new BusinessLogic().ChangeStock(c);
                if (!result)
                {
                    return false;
                }
            }
            return true;
        }
    }
}