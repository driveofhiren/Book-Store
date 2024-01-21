using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hiren_BookStore
{
    public partial class placed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
               
                string fullName = Request.QueryString["FullName"];
                string email = Request.QueryString["Email"];
                string firstName = Request.QueryString["FirstName"];
                string lastName = Request.QueryString["LastName"];
                string phoneNumber = Request.QueryString["PhoneNumber"];
                string address = Request.QueryString["Address"];
                string city = Request.QueryString["City"];
                string state = Request.QueryString["State"];
                string zipCode = Request.QueryString["ZipCode"];
                string contactMethod = Request.QueryString["ContactMethod"];

  
                lblFullName.Text = fullName;
                lblEmail.Text = email;
                lblFirstName.Text = firstName;
                lblLastName.Text = lastName;
                lblPhoneNumber.Text = phoneNumber;
                lblAddress.Text = address;
                lblCity.Text = city;
                lblState.Text = state;
                lblZipCode.Text = zipCode;
                lblContactMethod.Text = contactMethod;
            
        }

    }
}