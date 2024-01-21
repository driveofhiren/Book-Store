<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Hiren_BookStore._Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hiren's Books</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="Content/bootstrap.min.css" rel="stylesheet" />
<link href="Content/site.css" rel="stylesheet" />
<script src="Scripts/jquery-1.9.1.min.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
        <header class="text-center jumbotron">
            <h1>Hiren's Book Store</h1>
            <p>Your One-Stop Shop for Great Reads</p>
        </header>

        
            <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title">Home</h2>
                            <p class="card-text">Welcome to Hiren's Book Store. Discover a wide range of books in our collection.</p>
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/default.aspx" CssClass="btn btn-primary" Text="Visit Home" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title">Products</h2>
                            <p class="card-text">Explore our selection of books, magazines, and more.</p>
                            <asp:HyperLink ID="lnkProducts" runat="server" NavigateUrl="~/Products.aspx" CssClass="btn btn-primary" Text="View Products" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title">Cart</h2>
                            <p class="card-text">View and manage items in your shopping cart.</p>
                            <asp:HyperLink ID="lnkCart" runat="server" NavigateUrl="~/Cart.aspx" CssClass="btn btn-primary" Text="Go to Cart" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title">Login</h2>
            <p class="card-text">Login with your first name and last name</p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/login.aspx" CssClass="btn btn-primary" Text="Login" />
        </div>
    </div>
</div>
            </div>
        </div>
    </form>

    <!-- Add Bootstrap JS and jQuery scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
