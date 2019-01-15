using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop13_CA
{
    public partial class SearchResult : System.Web.UI.Page
    {
        BookshopEntities entities = new BookshopEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            string searchCatalogue = Request.QueryString["catelog"];
            string searchContent = Request.QueryString["content"];

            //string searchCatalogue = DropDownList_SearchCatalogue.Text;
            //string searchContent = TextBox_Search.Text;
            //TextBox_Search.Text = searchContent;

                if (!IsPostBack)
                {
                    Repeater_SearchResult.DataSource = BusinessLogic.ShowBySearch(searchCatalogue, searchContent);
                    Repeater_SearchResult.DataBind();

                    foreach (RepeaterItem q in Repeater_SearchResult.Items)
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
        }

        protected void Repeater_SearchResult_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Add to Cart")
            {
                string ISBN = ((Label)e.Item.FindControl("Label4")).Text;
                string user;
                try { user = Context.User.Identity.GetUserName(); (new BusinessLogic()).AddToCart(user, ISBN); }
                catch { Page.ClientScript.RegisterStartupScript(GetType(), "msgbox_log", "alert('Please log in')", true); }
            }
        }

        protected void Button_Search_Click(object sender, EventArgs e)
        {
            string searchCatalogue = DropDownList_SearchCatalogue.Text;
            string searchContent = TextBox_Search.Text;

            Response.Redirect("~/SearchResult.aspx?catelog=" + searchCatalogue + "&" + "content=" + searchContent);

            Repeater_SearchResult.DataSource = BusinessLogic.ShowBySearch(searchCatalogue, searchContent);
            Repeater_SearchResult.DataBind();

            foreach (RepeaterItem q in Repeater_SearchResult.Items)
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
    }
}