using System;
using System.Data;
using System.Web.UI;

namespace Hiren_BookStore
{
    public partial class Checkout : Page
    {
        private State selectedState;
       
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnGoBackToCart_Click(object sender, EventArgs e)
        {
     
            Response.Redirect("Cart.aspx");
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            // Retrieve user input
            string fullName = txtName.Text;
            string email = txtEmail.Text;
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string phoneNumber = txtPhone.Text;
            string address = txtAddress.Text;
            string city = txtCity.Text;
            string state = ddlState.SelectedValue;
            string zipCode = txtZip.Text;
            string contactMethod = rblContactMethod.SelectedValue;

            // Redirect to the Confirm page with query parameters
            Response.Redirect($"placed.aspx?FullName={fullName}&Email={email}&FirstName={firstName}&LastName={lastName}&PhoneNumber={phoneNumber}&Address={address}&City={city}&State={state}&ZipCode={zipCode}&ContactMethod={contactMethod}");
        }

        private State GetState()
        {
            //get row from SqlDataSource based on value in drop-down list
            DataView StateTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            StateTable.RowFilter =
                "Name = '" + ddlState.SelectedValue + "'";
            DataRowView row = StateTable[0];

            //create a new product object and load with data from row
            State p = new State();
            p.Name = row["Name"].ToString();
            p.Abbreviation = row["Abbreviation"].ToString();
            return p;
        }

    }
}
