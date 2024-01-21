<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Hiren_BookStore.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hiren's Books</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header class="jumbotron">
                <h1>Checkout</h1>
            </header>

            <main>
                <!-- Validation Summary -->
                <div class="alert alert-danger" role="alert">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="Please correct the following errors:" 
                        ForeColor="Red" DisplayMode="BulletList" />
                </div>

                <!-- Name -->
                <div class="form-group">
                    <div class="col-sm-6">
                        <label for="txtName">Full Name:</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                            ControlToValidate="txtName" ErrorMessage="Name is required." 
                            Display="Dynamic" ForeColor="Red" />
                    </div>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <div class="col-sm-6">
                        <label for="txtEmail">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="Email is required." 
                            Display="Dynamic" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="Invalid email format." 
                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" 
                            Display="Dynamic" ForeColor="Red" />
                    </div>
                </div>

                <!-- Re-enter Email -->
                <div class="form-group">
                    <div class="col-sm-6">
                        <label for="txtReEnterEmail">Re-enter Email:</label>
                        <asp:TextBox ID="txtReEnterEmail" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvReEnterEmail" runat="server"
                            ControlToValidate="txtReEnterEmail" ErrorMessage="Please re-enter your email."
                            Display="Dynamic" ForeColor="Red" />
                        <asp:CompareValidator ID="cvEmailMatch" runat="server"
                            ControlToValidate="txtReEnterEmail" ControlToCompare="txtEmail"
                            ErrorMessage="Emails do not match." Operator="Equal" Type="String"
                            Display="Dynamic" ForeColor="Red" />
                    </div>
                </div>

                <!-- First Name -->
                <div class="form-group">
                    <div class="col-sm-6">
                        <label for="txtFirstName">First Name:</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                            ControlToValidate="txtFirstName" ErrorMessage="First name is required."
                            Display="Dynamic" ForeColor="Red" />
                    </div>
                </div>

                <!-- Last Name -->
                <div class="form-group">
                    <div class="col-sm-6">
                        <label for="txtLastName">Last Name:</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                            ControlToValidate="txtLastName" ErrorMessage="Last name is required."
                            Display="Dynamic" ForeColor="Red" />
                    </div>
                </div>

                <!-- Phone Number -->
                <div class="form-group">
                    <div class="col-sm-6">
                        <label for="txtPhone">Phone Number:</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                            ControlToValidate="txtPhone" ErrorMessage="Phone number is required." 
                            Display="Dynamic" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                            ControlToValidate="txtPhone" ErrorMessage="Invalid phone number format." 
                            ValidationExpression="^\d{10}$" Display="Dynamic" ForeColor="Red" />
                    </div>
                </div>

                <!-- Address -->
                <div class="form-group">
                    <div class="col-sm-6">
                        <label for="txtAddress">Address:</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <!-- City -->
                <div class="form-group">
                    <div class="col-sm-6">
                        <label for="txtCity">City:</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <!-- State -->
                <div class="form-group">
                    <div class="col-sm-6">
                        <label for="ddlState">State:</label>
                         <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" 
     DataSourceID="SqlDataSource1" DataTextField="Name" 
     DataValueField="Name" CssClass="form-control">
 </asp:DropDownList>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
     ConnectionString='<%$ ConnectionStrings:Hiren_BookStore %>' 
     SelectCommand="SELECT [Name], [Abbreviation] FROM [State] 
     ORDER BY [Name]">
 </asp:SqlDataSource>



                        <asp:RequiredFieldValidator ID="rfvState" runat="server"
                            ControlToValidate="ddlState" InitialValue="" ErrorMessage="Please select a state."
                            Display="Dynamic" ForeColor="Red" />
                    </div>
                </div>

                <!-- Zip Code -->
                <div class="form-group">
                    <div class="col-sm-6">
                        <label for="txtZip">Zip Code:</label>
                        <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                            ControlToValidate="txtZip" ErrorMessage="Zip code is required." 
                            Display="Dynamic" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="revZip" runat="server" 
                            ControlToValidate="txtZip" ErrorMessage="Invalid zip code format." 
                            ValidationExpression="^\d{5}-\d{4}|\d{5}|[A-Z]\d[A-Z] \d[A-Z]\d$" Display="Dynamic" ForeColor="Red" />
                    </div>
                </div>

                <!-- Contact Method -->
                <div class="form-group contact">
                    <div class="col-sm-6">
                        <label>Contact Me:</label>
                        
                        <asp:RadioButtonList ID="rblContactMethod" runat="server" CssClass="radio">
                            <asp:ListItem Text="Facebook" Value="Facebook" />
                            <asp:ListItem Text="Email" Value="Email" />
                            <asp:ListItem Text="Text" Value="Text" />
                            <asp:ListItem Text="Phone" Value="Phone" />
                        </asp:RadioButtonList>
                    </div>
                </div>

                <!-- Buttons -->
                <div class="form-group">
                    <div class="col-sm-6">
                        <asp:Button ID="btnGoBackToCart" runat="server" Text="Go back to Cart" 
                            OnClick="btnGoBackToCart_Click" CssClass="btn btn-secondary" />
                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" 
                            OnClick="btnPlaceOrder_Click" CssClass="btn btn-success" />
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>
