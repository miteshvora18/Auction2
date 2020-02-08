<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Auction._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Login Page</title>
    <link href="includes/Common.css" rel="stylesheet" type="text/css" />
</head>
<body class="loginbg">
    <div style="width:100%;background-color:#DAA520;border-bottom:1px solid brown;">
        <div class="header">
            BestBid.com 
        </div>
    </div>
    <div id="container">
        <form runat="server">
            <asp:Label ID="lblUsername" runat="server" CssClass="paddingLeft15">Username:</asp:Label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="*">*</asp:RequiredFieldValidator>
            <asp:Label ID="lblPassword" runat="server" CssClass="paddingLeft15">Password:</asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*">*</asp:RequiredFieldValidator>
            <div id="lower">
                <asp:HyperLink ID="hyRegister" runat="server" NavigateUrl="~/Register.aspx" CssClass="register">Register Here</asp:HyperLink>
                <asp:Button ID="btnSubmit" runat="server" Text="Login" 
                    onclick="btnSubmit_Click" />
            </div>
        </form>
    </div>
</body>
</html>
