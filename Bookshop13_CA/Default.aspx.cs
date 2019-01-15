using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop13_CA
{
    public partial class _Default : Page
    {
    
        BookshopEntities entities = new BookshopEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            BookshopEntities m = new BookshopEntities();
            var qry = from x in m.Book select x;
            List<Book> cLst = qry.ToList<Book>();

            Repeater1.DataSource = BusinessLogic.ShowBySearch("Category", "Finance");
            Repeater1.DataBind();

            foreach (RepeaterItem q in Repeater1.Items)
            {
                string isbn = (q.FindControl("Label4") as Label).Text.ToString();
                if ((new BusinessLogic()).ShowOriginalPrice(isbn))
                {
                    (q.FindControl("Label6") as Label).Visible = true;
                }
                else
                {
                    (q.FindControl("Label6") as Label).Visible = false;
                }
            }
        }


        protected void Button_Search_Click(object sender, EventArgs e)
        {
            string searchCatalogue = DropDownList_SearchCatalogue.Text;
            string searchContent = TextBox_Search.Text;
            Response.Redirect("/SearchResult.aspx?catelog=" + searchCatalogue + "&" + "content=" + searchContent);
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Add to Cart")
            {
                string ISBN = ((Label)e.Item.FindControl("Label4")).Text;
                string user;
                try { user = Context.User.Identity.GetUserName(); (new BusinessLogic()).AddToCart(user, ISBN); }
                catch { Page.ClientScript.RegisterStartupScript(GetType(), "msgbox_log", "alert('Please log in')", true); }
            }
        }
    }
}