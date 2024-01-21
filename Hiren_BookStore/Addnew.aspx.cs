using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hiren_BookStore
{
    public partial class Addnew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdBooks_PreRender(object sender, EventArgs e)
        {
            grdBooks.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void dvBook_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                Label1.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
                Label1.Text = ConcurrencyErrorMessage();
            else
                grdBooks.DataBind();
        }

        protected void dvBook_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                Label1.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                Label1.Text = ConcurrencyErrorMessage();
            else
                grdBooks.DataBind();
        }

        protected void dvBook_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
         
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
            else
                grdBooks.DataBind();
        }

        protected void dvBook_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
        {
            if (e.Values["UnitPrice"] != null)
                e.Values["UnitPrice"] =
                    e.Values["UnitPrice"].ToString().Substring(1);
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
        private string ConcurrencyErrorMessage()
        {
            return "Please try again";
        }
    }
}