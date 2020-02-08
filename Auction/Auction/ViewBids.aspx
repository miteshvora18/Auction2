<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBids.aspx.cs" MasterPageFile="~/User.Master" Inherits="Auction.ViewBids" %>

<asp:Content ContentPlaceHolderID="Body" runat="server">
    <div class="addProduct" style="width:70%;">
        <div style="text-align:center;font-size:30px;">
            <asp:Label ID="lblHeader" runat="server" Text="All Bids List" ></asp:Label>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to Home</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server">Back to Product Bid</asp:HyperLink>
        <br />
        <br />
        <asp:GridView ID="gvAllBids" runat="server" Width="100%" AutoGenerateColumns="false" EmptyDataText="No Bids for this product">
            <Columns>
                <asp:TemplateField HeaderText="Product Id" >
                    <ItemTemplate>
                        <asp:Label ID="lblPid" runat="server" Text='<%#Eval("pid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Name" >
                    <ItemTemplate>
                        <asp:Label ID="lblPName" runat="server" Text='<%#Eval("pname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bid By" >
                    <ItemTemplate>
                        <asp:Label ID="lblBidBy" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bid Amount" >
                    <ItemTemplate>
                        <asp:Label ID="lblBidAmount" runat="server" Text='<%#Eval("bidAmount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
