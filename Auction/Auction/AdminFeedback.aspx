<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminFeedback.aspx.cs" MasterPageFile="~/Admin.Master" Inherits="Auction.AdminFeedback" %>

<asp:Content ContentPlaceHolderID="Body" runat="server">
    <div class="addProduct">
        <div style="text-align:center;font-size:30px;">
            <asp:Label ID="lblHeader" runat="server" Text="View Feedback" ></asp:Label>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to Home</asp:HyperLink>
        <br />
        <br />
        <asp:GridView ID="gvFeedback" runat="server" Width="100%" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Username" DataField="username" />
                <asp:BoundField HeaderText="Subject" DataField="subject" />
                <asp:BoundField HeaderText="Description" DataField="description" />
                <asp:BoundField HeaderText="Feedback Date" DataField="fdate" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
