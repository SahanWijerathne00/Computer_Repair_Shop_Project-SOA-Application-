<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminCart.aspx.cs" Inherits="TECH_FIX_WEBSITE.AdminCart" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Cart</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Your Cart</h1>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        
        <div id="cartItemsDiv" runat="server"></div>
    </form>
</body>
</html>


