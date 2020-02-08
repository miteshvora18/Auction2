<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.Master" CodeBehind="AddProduct.aspx.cs" Inherits="Auction.AddProduct" %>

<asp:Content ContentPlaceHolderID="Body" runat="server">
    <div class="addProduct">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to Home</asp:HyperLink>
        <br />
        <br />
        <div>
            <div style="width:30%;float:left;">Enter Product Name</div> 
            <asp:TextBox ID="txtPName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtPName" Display="Dynamic" ErrorMessage="*">*</asp:RequiredFieldValidator>
        </div>
        <br />
        <div>
            <div style="width:30%;float:left;">Enter Product Description</div>
            <asp:TextBox ID="txtPDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtPDesc" Display="Dynamic" ErrorMessage="*">*</asp:RequiredFieldValidator>
        </div> 
        <br />
        <div>
            <div style="width:30%;float:left;">Enter Minimum Bid Amount (in Rs.)</div>
            <asp:TextBox ID="txtMinBid" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtMinBid" Display="Dynamic" ErrorMessage="*">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtMinBid" Display="Dynamic" 
                ErrorMessage="Only integers are allowed" ValidationExpression="^(0|[1-9][0-9]*)$">Only numbers are allowed</asp:RegularExpressionValidator>
        </div>
        <br />
        <div>
            <div style="width:30%;float:left;">Enter Auction Time (in minutes)</div>
            <asp:TextBox ID="txtATime" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtATime" Display="Dynamic" ErrorMessage="*">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="txtATime" Display="Dynamic" 
                ErrorMessage="Only integers are allowed" ValidationExpression="^(0|[1-9][0-9]*)$">Only numbers are allowed</asp:RegularExpressionValidator>
        </div> 
        <br />
        <div>
            <div style="width:30%;float:left;">Select Category</div>
            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true">
                <asp:ListItem Text="Clothing"></asp:ListItem>
                <asp:ListItem Text="Electronics"></asp:ListItem>
                <asp:ListItem Text="Furniture"></asp:ListItem>
                <asp:ListItem Text="Other"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <div>
            <div style="width:30%;float:left;">Upload Image</div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </div> 
        <br />
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Add" 
                onclick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>
