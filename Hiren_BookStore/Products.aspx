<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Hiren_BookStore.Products" MasterPageFile="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       <div class="row thumbnail1">
           <div class="row"><%-- row 1 --%>
                <div class="col-sm-12">
    <asp:Label ID="lblWelcome" runat="server" CssClass="text-capitalize"></asp:Label>
</div>
        <asp:Repeater ID="rptProducts" runat="server"  DataSourceID="SqlDataSource">
            <ItemTemplate>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="thumbnail">
                        <img src='Images/<%# Eval("ImageFile") %>'
                            alt='<%# Eval("Name") %>' width="100" height="100" />
                        <div class="caption">
                            <h3><%# Eval("Name") %></h3>
                            <p>
                                <b>Price: <%# Eval("UnitPrice", "{0:0.00}") %></b>
                                <br>
                                <br>
                                <%# Eval("LongDescription") %>
                            </p>
                           <asp:Button ID="btnAdd" runat="server" 
                            CommandArgument='<%# Eval("ProductID") %>'  OnClick="btnAdd_Click" CssClass="btn" Text="Add to Cart" />
                        </div>
                                              
                    </div>    
                </div>
            </ItemTemplate>

        </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" 
    ConnectionString='<%$ ConnectionStrings:Hiren_BookStore %>' 
    SelectCommand="SELECT [ProductID], [Name], [ShortDescription], [LongDescription], [ImageFile], [UnitPrice] FROM [Books] ORDER BY [Name]">
</asp:SqlDataSource>

    </asp:Content>