using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hiren_BookStore
{
    public partial class Cart : System.Web.UI.Page
    {
        private CartItemList cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            cart = CartItemList.GetCart();
            if (!IsPostBack)
                this.DisplayCart();
          
        }

        private void DisplayCart()
        {
            lstCart.Items.Clear();
            CartItem item;
            for (int i = 0; i < cart.Count; i++)
            {
                item = cart[i];
                lstCart.Items.Add(item.Display());
                getTotal(item.Quantity, item.Product.UnitPrice);
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    cart.RemoveAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                }
                else
                {
                    lblMessage.Text = "Please select the item you want to remove.";
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                cart.Clear();
                lstCart.Items.Clear();
            }
        }
        protected void getTotal(int quantity, decimal price)
        {
            decimal total = 0;
            if (!string.IsNullOrEmpty(totalvalue.Text))
            {
                total = Convert.ToDecimal(totalvalue.Text);
            }
            total += Convert.ToDecimal(quantity) * price;
            totalvalue.Text = string.Format("{0:0.00}", total);
            totalLabel.Text = "Total :$" + totalvalue.Text;
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Sorry, that function hasn't been "
                            + "implemented yet.";
        }
    }
}