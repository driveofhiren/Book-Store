<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="placed.aspx.cs" Inherits="Hiren_BookStore.placed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hiren's Books - Order Confirmation</title>
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
                <h1>Order Confirmation</h1>
            </header>

            <main>
            
                <h2>Order Details:</h2>
<p><strong>Full Name:</strong> <asp:Label ID="lblFullName" runat="server"></asp:Label></p>
<p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
<p><strong>First Name:</strong> <asp:Label ID="lblFirstName" runat="server"></asp:Label></p>
<p><strong>Last Name:</strong> <asp:Label ID="lblLastName" runat="server"></asp:Label></p>
<p><strong>Phone Number:</strong> <asp:Label ID="lblPhoneNumber" runat="server"></asp:Label></p>
<p><strong>Address:</strong> <asp:Label ID="lblAddress" runat="server"></asp:Label></p>
<p><strong>City:</strong> <asp:Label ID="lblCity" runat="server"></asp:Label></p>
<p><strong>State:</strong> <asp:Label ID="lblState" runat="server"></asp:Label></p>
<p><strong>Zip Code:</strong> <asp:Label ID="lblZipCode" runat="server"></asp:Label></p>
<p><strong>Contact Method:</strong> <asp:Label ID="lblContactMethod" runat="server"></asp:Label></p>

            </main>
        </div>
    </form>
</body>
</html>
