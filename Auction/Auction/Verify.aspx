<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Verify.aspx.cs" Inherits="Auction.Verify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Verify</title>
    <link href="includes/Common.css" rel="stylesheet" type="text/css" />
</head>
<body class="loginbg">
    <div style="width:100%;background-color:#DAA520;border-bottom:1px solid brown;">
        <div class="header">
            BestBid.com 
        </div>
    </div>
    <div id="container">
        <form id="Form1" runat="server">
            <div class="paddingLeft15">
                <asp:Label runat="server" ID="lblVerify">Congratulations, you have completed registration process..Go to login page to enter site with your login credentials.</asp:Label>
            </div>
            <div id="lower" style="margin-top:119px;">
                <asp:HyperLink ID="hyRegister" runat="server" NavigateUrl="~/Login.aspx" CssClass="register">Back to Login</asp:HyperLink>
            </div>
        </form>
    </div>
</body>
</html>
