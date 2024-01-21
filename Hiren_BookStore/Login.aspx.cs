using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Hiren_BookStore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (!IsPostBack)
                {
                    HttpCookie firstName = Request.Cookies["FirstName"];
                    HttpCookie lastName = Request.Cookies["LastName"];
                    txtFirstName.Text = firstName?.Value;
                    txtLastName.Text = lastName?.Value;
                }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/Default.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
                DateTime expiryDate = DateTime.Now.AddMinutes(5);
                SetCookie("FirstName", txtFirstName.Text, expiryDate);
                SetCookie("LastName", txtLastName.Text, expiryDate);
                Session["FirstName"] = txtFirstName.Text;
                 Response.Redirect("~/Products.aspx");
        }
        private void SetCookie(string name, string value, DateTime expiryDate)
        {
            HttpCookie cookie = new HttpCookie(name, value);
            cookie.Expires = expiryDate;
            Response.Cookies.Add(cookie);
        }
    }
}
