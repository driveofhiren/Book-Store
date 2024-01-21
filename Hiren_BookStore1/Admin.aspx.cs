using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Hiren_BookStore
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind initial data on the first load
                BindCategoriesDropDown();
                BindCategoriesGrid();
                BindProductsGrid();
            }
        }

        private void BindCategoriesDropDown()
        {
            // Implement data binding for the DropDownList
        }

        private void BindCategoriesGrid()
        {
            // Implement data binding for the GridView of Categories
        }

        private void BindProductsGrid()
        {
            // Implement data binding for the GridView of Products
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            // Implement logic to add a new category
        }

        // Add other event handlers and methods for CRUD operations
    }
}
