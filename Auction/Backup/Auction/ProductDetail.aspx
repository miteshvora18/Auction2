<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.Master" CodeBehind="ProductDetail.aspx.cs" Inherits="Auction.ProductDetail" %>

<asp:Content ContentPlaceHolderID="Body" runat="server">
    <div class="addProduct" style="width:70%;">
        <div style="text-align:center;font-size:30px;">
            <asp:Label ID="lblHeader" runat="server" Text="Product Bid" ></asp:Label>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to Home</asp:HyperLink>
        <br />
        <br />
        <div style="margin-left:20%;">
            <div>
                <asp:Image ID="imgProduct" runat="server" Width="300px" style="margin-left:15%;" />
            </div>
            <br />
            <div>
                <div style="width:30%;float:left;">Product Name</div> 
                <asp:Label ID="lblPname" runat="server"></asp:Label>
            </div>
            <br />
            <div>
                <div style="width:30%;float:left;">Product Description</div> 
                <asp:Label ID="lblPDesc" runat="server"></asp:Label>
            </div>
            <br />
            <div>
                <div style="width:30%;float:left;">Category</div> 
                <asp:Label ID="lblCategory" runat="server"></asp:Label>
            </div>
            <br />
            <div>
                <div style="width:30%;float:left;">Minimum Bid</div> 
                <asp:Label ID="lblMinBid" runat="server"></asp:Label>
            </div>
            <br />
            <div>
                <div style="width:30%;float:left;">Bid End Time</div> 
                <asp:Label ID="lblBidEndTime" runat="server"></asp:Label>
            </div>
            <br />
            <div>
                <div style="width:30%;float:left;" id="lblAmount" runat="server">Enter Your Bid Amount (in Rs.)</div> 
                <asp:TextBox ID="txtBidAmount" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtBidAmount" Display="Dynamic" ErrorMessage="*">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtBidAmount" Display="Dynamic" 
                    ErrorMessage="Only integers are allowed" ValidationExpression="^(0|[1-9][0-9]*)$">Only integers are allowed</asp:RegularExpressionValidator>
            </div>
            <br />
            <div>
                <asp:Button ID="btnSubmit" runat="server" Text="Bid" 
                    onclick="btnSubmit_Click" />
            </div>
            <br />
            <div id="note" runat="server">
                Note: Your bid amount must be more than minimum bid
            </div>
            <br />
            <div>
                <asp:HyperLink ID="hyViewBid" runat="server">View All bids for this product</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>
