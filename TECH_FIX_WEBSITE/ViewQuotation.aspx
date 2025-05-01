<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewQuotation.aspx.cs" Inherits="TECH_FIX_WEBSITE.ViewQuotation" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Quotations - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: lightblue;
        }

        .container {
            margin-top: 50px;
        }

        h2 {
            margin-bottom: 20px;
            font-weight: bold;
        }

        .table-container {
            margin-top: 30px;
        }

        .table {
            background-color: #fff;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">View All Quotations</h2>

            <!-- Table for displaying quotations -->
            <div class="table-container">
                <asp:GridView ID="GridViewQuotations" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="QuotationID" HeaderText="Quotation ID" />
                        <asp:BoundField DataField="SupplierUserID" HeaderText="Supplier UserID" />
                        <asp:BoundField DataField="QuotationDate" HeaderText="Quotation Date" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount (LKR)" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
