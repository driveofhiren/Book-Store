using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hiren_BookStore
{
    public partial class Products : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rptProducts.DataSourceID = "SqlDataSource";
            HttpCookie firstName = Request.Cookies["FirstName"];
            if (firstName != null)
                lblWelcome.Text = "<h4>welcome back, " + firstName.Value + "!</h4>";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Button button = (Button)sender;
                //get cart from session and selected item from cart
                CartItemList cart = CartItemList.GetCart();
               CartItem cartItem = cart[button.CommandArgument.ToString()];
                Product selectedBook = GetSelectedProduct(button.CommandArgument.ToString());

                //if item isn’t in cart, add it; otherwise, increase its quantity
                if (cartItem == null)
                {
                    cart.AddItem(selectedBook, 1);
                }
                else
                {
                    cartItem.AddQuantity(1);
                }
                Response.Redirect("Cart.aspx", false);
                rptProducts.DataBind();
            }
        }

        private Product GetSelectedProduct(String ProductID)
        {
            DataView booksTable = (DataView)
                SqlDataSource.Select(DataSourceSelectArguments.Empty);
            booksTable.RowFilter =
                "ProductID = '" + ProductID + "'";
            DataRowView row = booksTable[0];

            //create a new book object and load with data from row
            Product b = new Product();
            b.ProductID = row["ProductID"].ToString();
            b.Name = row["Name"].ToString();
            b.ShortDescription = row["ShortDescription"].ToString();
            b.LongDescription = row["LongDescription"].ToString();
            b.UnitPrice = (decimal)row["UnitPrice"];
            b.ImageFile = row["ImageFile"].ToString();
            return b;
        }

    }
}