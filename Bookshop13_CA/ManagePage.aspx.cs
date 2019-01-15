using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop13_CA
{
    public partial class ManagePage : System.Web.UI.Page
    {
        string title, author, isbn, show;
        int categoryid, stock;
        int? discount;
        decimal price;
        BookshopEntities bs = new BookshopEntities();

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateBind();
            }
        }
        private void DateBind()
        {
            List<Book> books = bs.Book.Where(m => m.Title != null).ToList();
            this.GridView1.DataSource = books;
            this.GridView1.DataBind();
        }
        private void readtext()
        {
            title = TextBox1.Text;
            author = TextBox4.Text;
            isbn = TextBox3.Text;
            categoryid = int.Parse(DropDownList2.SelectedValue);
            stock = int.Parse(DropDownList3.SelectedValue);
            price = decimal.Parse(TextBox6.Text);
            show = TextBox9.Text;
            try
            {
                discount = int.Parse(TextBox10.Text);
            }
            catch (Exception)
            {
                discount = null;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //update data button
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int index = e.NewEditIndex;
            GridView1.EditIndex = index;
            DateBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            DateBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int bookID = int.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
            Book books = new Book() { BookID = bookID };
            bs.Book.Attach(books);
            bs.Book.Remove(books);
            bs.SaveChanges();
            DateBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int bookID = int.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
            GridViewRow rows = this.GridView1.Rows[e.RowIndex];
            var book = bs.Book.First(p => p.BookID.Equals(bookID));

            book.Title = ((TextBox)rows.FindControl("txtTitle")).Text.Trim();
            book.ISBN = ((TextBox)rows.FindControl("txtISBN")).Text.Trim();
            book.Author = ((TextBox)rows.FindControl("txtAuthor")).Text.Trim();
            book.Stock = int.Parse(((TextBox)rows.FindControl("txtStock")).Text.Trim());
            book.CategoryID = int.Parse(((TextBox)rows.FindControl("txtCategoryID")).Text.Trim());
            book.Price = decimal.Parse(((TextBox)rows.FindControl("txtPrice")).Text.Trim());
            book.show = ((TextBox)rows.FindControl("txtshow")).Text.Trim();
            try
            {
                book.Discount = int.Parse(((TextBox)rows.FindControl("txtDiscount")).Text.Trim());
            }
            catch (Exception)
            {
                book.Discount = null;
            }
            bs.SaveChanges();
            this.GridView1.EditIndex = -1;
            DateBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //add data button
            readtext();
            if (bs.Book.Where(x => x.ISBN == isbn).Count() == 0)
            {
                Book b = bs.Book.Where(x => x.ISBN == isbn).First();
                b.Stock += stock;
                bs.SaveChanges();
                DateBind();
            }
            else
            {
                Book b = new Book
                {
                    Title = title,
                    ISBN = isbn,
                    CategoryID = categoryid,
                    Author = author,
                    Stock = stock,
                    Price = price,
                    show = show,
                    Discount = discount
                };
                bs.Book.Add(b);
                bs.SaveChanges();
                DateBind();
            }
        }

        private void readData()
        {
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }



    }
}