using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop13_CA
{
    public partial class ConfirmPage : System.Web.UI.Page
    {
        string user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = Context.User.Identity.GetUserName();
            var q = from x in new BusinessLogic().GetCartItems(user)
                    select new { x.Title, x.ISBN, x.Price, x.Quantity };

            GridView1.DataSource = q.ToList();
            GridView1.DataBind();
            Label_TotalPrice.Text = string.Format("Total Price is S$ {0}", new BusinessLogic().TotalPrice(user).ToString());

            using (BookshopEntities context = new BookshopEntities())
            {
                var cart = context.Cart.Where(x => x.Status == "Unpaid").ToList();
                cart.ForEach(s => s.Status = "Paid");
                context.SaveChanges();
            }

            
        }
    }
}