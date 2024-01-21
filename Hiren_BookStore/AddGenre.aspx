<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddGenre.aspx.cs" Inherits="Hiren_BookStore.AddGenre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form2" class="form-horizontal">

            <div class="col-xs-12 table-responsive">
                <h1>Genre Maintenance</h1>
                <asp:GridView ID="grdGenres" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="CategoryID"
                    DataSourceID="SqlDataSource3"
                    CssClass="table table-bordered table-condensed"
                    OnPreRender="grdGenres_PreRender" 
                    OnRowDeleted="grdGenres_RowDeleted" 
                    OnRowUpdated="grdGenres_RowUpdated">
                    <Columns>
                        <asp:BoundField DataField="CategoryID" HeaderText="ID" 
                            ReadOnly="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Short Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridShortName" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("ShortName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridShortName" runat="server" 
                                    ControlToValidate="txtGridShortName" ValidationGroup="Edit" 
                                    ErrorMessage="Short Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridShortName" runat="server" 
                                    Text='<%# Bind("ShortName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Long Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridLongName" runat="server" 
                                        MaxLength="50" CssClass="form-control"   
                                        Text='<%# Bind("LongName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridLongName" runat="server" 
                                    ControlToValidate="txtGridLongName" ValidationGroup="Edit" 
                                    Text="*" ErrorMessage="Long Name is a required field" 
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridLongName" runat="server" 
                                    Text='<%# Bind("LongName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-5" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="True" 
                            ShowEditButton="True" ValidationGroup="Edit">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <AlternatingRowStyle CssClass="altRow" />
                    <EditRowStyle CssClass="warning" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                    ConnectionString="<%$ ConnectionStrings:Hiren_BookStore %>"
                    ConflictDetection="CompareAllValues" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT [CategoryID], [ShortName], [LongName] 
                        FROM [Genre]"
                    DeleteCommand="DELETE FROM [Genre] 
                        WHERE [CategoryID] = @original_CategoryID 
                          AND [ShortName] = @original_ShortName 
                          AND [LongName] = @original_LongName" 
                    InsertCommand="INSERT INTO [Genre] 
                        ([CategoryID], [ShortName], [LongName]) 
                        VALUES (@CategoryID, @ShortName, @LongName)" 
                    UpdateCommand="UPDATE [Genre] 
                          SET [ShortName] = @ShortName, 
                              [LongName] = @LongName 
                        WHERE [CategoryID] = @original_CategoryID 
                          AND [ShortName] = @original_ShortName 
                          AND [LongName] = @original_LongName">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CategoryID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_LongName" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CategoryID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LongName" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LongName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_CategoryID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_LongName" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>  
                
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    HeaderText="Please correct the following errors:" 
                    ValidationGroup="Edit" CssClass="text-danger" />  
            </div>

            <div class="col-xs-12">
                <p>To create a new genre, enter the genre information 
                    and click Add New Genre</p>
                <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>

                <div class="form-group">
                    <label for="txtID">ID</label>
                    <div>
                        <asp:TextBox ID="txtID" runat="server" MaxLength="10" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:RequiredFieldValidator ID="rfvID" runat="server" 
                            ControlToValidate="txtID" CssClass="text-danger" 
                            ErrorMessage="ID is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtShortName">Short Name</label>
                    <div>
                        <asp:TextBox ID="txtShortName" runat="server" MaxLength="15" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:RequiredFieldValidator ID="rfvShortName" runat="server" 
                        ControlToValidate="txtShortName" CssClass="text-danger" 
                        ErrorMessage="Short Name is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>              
                <div class="form-group">
                    <label for="txtLongName">Long Name</label>
                    <div>
                        <asp:TextBox ID="txtLongName" runat="server" MaxLength="50" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:RequiredFieldValidator ID="rfvLongName" runat="server" 
                        ControlToValidate="txtLongName" CssClass="text-danger" 
                        ErrorMessage="Long Name is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <asp:Button ID="btnAdd" runat="server" Text="Add New Genre" 
                    CssClass="btn" OnClick="btnAdd_Click" />
            </div>  

        </form>
</asp:Content>
