<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="TECH_FIX_WEBSITE.AddCategory" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Category - TechFixx</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
        }
        .container {
            margin-top: 30px;
            max-width: 600px;
        }
        .header {
            background-color: #007bff;
            padding: 15px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header img {
            height: 50px; 
            margin-right: 15px;
        }
        .header h1 {
            margin-left: 10px;
            font-size: 24px;
        }
        .home-button {
            background-color: white;
            border: 2px solid #007bff;
            border-radius: 5px;
            padding: 5px 15px;
            text-decoration: none;
        }
        .home-button:hover {
            background-color: yellow;
         
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form runat="server">
        <header class="header">
            <div>
                <img src="images/shop_new.jpeg" alt="TechFixx Logo" />
                <h1>TechFixx</h1>
            </div>
            <a href="AdminDashboard.aspx" class="home-button">
                <img src="images/home_icon.jpeg" alt="Home" style="height: 30px; margin-right: 5px;" />
                Home
            </a>

        </header>

        <div class="container">
            <h2 class="text-center">Add New Category</h2>
            <asp:Label ID="SuccessMessage" runat="server" CssClass="text-success" Visible="false"></asp:Label>
            <asp:Label ID="ErrorMessage" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
            
            <asp:Panel ID="AddCategoryPanel" runat="server">
                <div class="mb-3">
                    <asp:Label ID="CategoryNameLabel" runat="server" CssClass="form-label" Text="Category Name:" AssociatedControlID="CategoryName"></asp:Label>
                    <asp:TextBox ID="CategoryName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="AddCategoryButton" runat="server" Text="Add Category" CssClass="btn btn-primary" OnClick="AddCategoryButton_Click" />
                <asp:Button ID="ViewAllCategoriesButton" runat="server" Text="View All Categories" CssClass="btn btn-secondary" OnClick="ViewAllCategoriesButton_Click" />
            </asp:Panel>
            
            <asp:GridView ID="CategoriesGridView" runat="server" CssClass="table table-striped mt-4" AutoGenerateColumns="False" Visible="false" OnRowCommand="CategoriesGridView_RowCommand">
                <Columns>
                    <asp:BoundField DataField="CategoryId" HeaderText="ID" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="RemoveButton" runat="server" CommandName="Remove" CommandArgument='<%# Eval("CategoryId") %>' Text="Remove" CssClass="btn btn-danger btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
