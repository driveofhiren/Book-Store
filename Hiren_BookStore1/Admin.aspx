<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Hiren_BookStore.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
        <link href="Content/site.css" rel="stylesheet" />
        <script src="Scripts/jquery-1.9.1.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
        
            <main class="row">
                <form id="form1" class="form-horizontal">
                    <div class="form-group">
                        <label id="lblGenre" for="ddlGenre"
                            class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
                            Choose a genre:</label>
                        <div class="col-xs-8 col-sm-5">
                            <asp:DropDownList ID="ddlGenre" runat="server" AutoPostBack="true"
                                DataSourceID="SqlDataSource1" DataTextField="LongName"
                                DataValueField="CategoryID" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1"
                                ConnectionString='<%$ ConnectionStrings:Hiren_BookStore %>'
                                SelectCommand="SELECT [CategoryID], [LongName] FROM [Genre] 
                            ORDER BY [LongName]"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="form-group">

                        <div class="col-xs-12 col-sm-offset-1 col-sm-9">
                            <asp:DataList ID="dlBooks" runat="server"
                                DataKeyField="ProductId" DataSourceID="SqlDataSource2"
                                CssClass="table table-bordered table-striped table-condensed">
                                <HeaderTemplate>
                                    <span class="col-xs-3">ID</span>
                                    <span class="col-xs-3">Book</span>
                                    <span class="col-xs-3 text-right">Unit Price</span>
                                    <span class="col-xs-3 text-right">On Hand</span>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblID" runat="server"
                                        Text='<%# Eval("ProductId") %>' CssClass="col-xs-3" />
                                    <asp:Label ID="lblName" runat="server"
                                        Text='<%# Eval("Name") %>' CssClass="col-xs-3" />
                                    <asp:Label ID="lblUnitPrice" runat="server"
                                        Text='<%# Eval("UnitPrice", "{0:0.00}") %>' CssClass="col-xs-3 text-right" />
                                    <asp:Label ID="lblOnHand" runat="server"
                                        Text='<%# Eval("OnHand") %>' CssClass="col-xs-3 text-right" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="bg-halloween" />
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:Hiren_BookStore %>"
                                SelectCommand="SELECT [ProductId], [Name], [UnitPrice], [OnHand] 
                            FROM [Books] WHERE ([CategoryID] = @CategoryID) 
                            ORDER BY [ProductID]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlGenre" Name="CategoryID"
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>

                </form>
            </main>
        </div>
    </body>
    </html>
</asp:Content>
