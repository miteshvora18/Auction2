<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Auction.Regsiter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Registration Page</title>
    <link href="includes/Common.css" rel="stylesheet" type="text/css" />
</head>
<body class="loginbg">
    <div style="width:100%;background-color:#DAA520;border-bottom:1px solid brown;">
        <div class="header">
            BestBid.com 
        </div>
    </div>
    <div id="container" style="height:440px;">
        <form id="Form1" runat="server">
            <asp:Label ID="lblUsername" runat="server" CssClass="paddingLeft15">Username:</asp:Label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" 
                ControlToValidate="txtUsername" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:Label ID="lblPassword" runat="server" CssClass="paddingLeft15">Password:</asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="*" ControlToValidate="txtPassword" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:Label ID="lblVerifyPassword" runat="server" CssClass="paddingLeft15">Verify Password:</asp:Label>
            <asp:TextBox ID="txtVerifyPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ErrorMessage="Passwords do not match" ControlToCompare="txtVerifyPassword" 
                ControlToValidate="txtPassword" Display="Dynamic" CssClass="paddingLeft15">Passwords do not match</asp:CompareValidator><br />
            <asp:Label ID="lblEmail" runat="server" CssClass="paddingLeft15">Email:</asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="*" ControlToValidate="txtEmail" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtEmail" CssClass="paddingLeft15" Display="Dynamic" 
                ErrorMessage="Incorrect Email Format" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <div id="lower">
                <asp:HyperLink ID="hyRegister" runat="server" NavigateUrl="~/Login.aspx" CssClass="register">Back to Login</asp:HyperLink>
                <asp:Button ID="btnSubmit" runat="server" Text="Register" 
                    onclick="btnSubmit_Click" />
            </div>
        </form>
    </div>
</body>
</html>
