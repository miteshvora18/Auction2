<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.Master" CodeBehind="Home.aspx.cs" Inherits="Auction.Home" %>

<asp:Content ContentPlaceHolderID="Body" runat="server">
    <div style="width:20%;padding-left:20px;float:left;">
        <asp:HyperLink ID="hyAddProduct" runat="server" NavigateUrl="~/AddProduct.aspx">Add your Product for bidding</asp:HyperLink><br />
        <asp:HyperLink ID="hyDeleteProduct" runat="server" NavigateUrl="~/DeleteProduct.aspx">Delete your products</asp:HyperLink><br />
        <asp:HyperLink ID="hyFb" runat="server" NavigateUrl="~/Feedback.aspx">Provide Feedback</asp:HyperLink><br/>
        <asp:HyperLink ID="hyAdminFb" runat="server" NavigateUrl="~/AdminFeedback.aspx">View Feedback</asp:HyperLink>
    </div>
    <div class="homeHeader">
        <asp:Label ID="lblCategory" runat="server" Text="Category" CssClass="paddingLeft15 padding-right"></asp:Label>
        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" 
            onselectedindexchanged="ddlCategory_SelectedIndexChanged">
            <asp:ListItem Text="All"></asp:ListItem>
            <asp:ListItem Text="Clothing"></asp:ListItem>
            <asp:ListItem Text="Electronics"></asp:ListItem>
            <asp:ListItem Text="Furniture"></asp:ListItem>
            <asp:ListItem Text="Other"></asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblPrice" runat="server" Text="Sort By Price" CssClass="paddingLeft15 padding-right"></asp:Label>
        <asp:DropDownList ID="ddlPrice" runat="server" AutoPostBack="true" 
            onselectedindexchanged="ddlPrice_SelectedIndexChanged">
            <asp:ListItem Text="None"></asp:ListItem>
            <asp:ListItem Text="Asc"></asp:ListItem>
            <asp:ListItem Text="Desc"></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        <asp:GridView Width="97%" runat="server" ID="gvProducts" BorderWidth="0"
            AutoGenerateColumns="false" OnRowDataBound="gvProducts_RowDataBound" EmptyDataText="No Products Found">
            <Columns>
                <asp:TemplateField HeaderText="Product Id">
                    <ItemTemplate>
                        <asp:HyperLink ID="hyProduct2" runat="server">
                            <asp:Label ID="lblPid" runat="server" Text='<%#Eval("pid") %>'></asp:Label>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <asp:HyperLink ID="hyProduct" runat="server">
                            <asp:Image ID="imgProduct" runat="server" style="width:50px;height:50px;" />
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="cname" HeaderText="Category" />
                <asp:BoundField DataField="pname" HeaderText="Product Name" />
                <%--<asp:BoundField DataField="pdesc" HeaderText="Product Description" />--%>
                <asp:BoundField DataField="minBid" HeaderText="Minimum Bid (in Rs.)" />
                <asp:BoundField DataField="bidEndTime" HeaderText="Bid Endtime" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
