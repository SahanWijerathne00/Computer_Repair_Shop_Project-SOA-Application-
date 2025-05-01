<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierView.aspx.cs" Inherits="TECH_FIX_WEBSITE.SupplierView" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: lightskyblue;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        table th {
            background-color: #007BFF;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn-delete {
            padding: 8px 12px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .btn-home {
            margin-bottom: 20px;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            float: right;
        }

        .btn-home:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Supplier Details</h1>
            <asp:Button ID="HomeButton" runat="server" Text="Home" CssClass="btn-home" OnClick="HomeButton_Click" />
            <asp:GridView ID="SupplierGridView" runat="server" AutoGenerateColumns="false" CssClass="table" OnRowCommand="SupplierGridView_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Supplier ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="DeleteSupplier" CommandArgument='<%# Eval("Id") %>' Text="Delete" CssClass="btn-delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
