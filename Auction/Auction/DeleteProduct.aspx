<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteProduct.aspx.cs" MasterPageFile="~/User.Master" Inherits="Auction.DeleteProduct" %>

<asp:Content ContentPlaceHolderID="Body" runat="server">
        <div class="addProduct" style="width:70%;">
            <div style="text-align:center;font-size:30px;">
                <asp:Label ID="lblHeader" runat="server" Text="Delete Products"></asp:Label>
            </div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to Home</asp:HyperLink>
            <br /><br />
            <asp:GridView Width="100%" runat="server" ID="gvProducts" BorderWidth="0"
            AutoGenerateColumns="false" OnRowDataBound="gvProducts_RowDataBound" 
                EmptyDataText="No Products Found" onrowcommand="gvProducts_RowCommand" 
                onrowdeleting="gvProducts_RowDeleting">
                <Columns>
                    <asp:TemplateField HeaderText="Id" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <asp:Label ID="lblPid" runat="server" Text='<%#Eval("pid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <asp:Image ID="imgProduct" runat="server" style="width:50px;height:50px;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="cname" HeaderText="Category" />
                    <asp:BoundField DataField="pname" HeaderText="Product Name" />
                    <%--<asp:BoundField DataField="pdesc" HeaderText="Product Description" />--%>
                    <asp:BoundField DataField="minBid" HeaderText="Minimum Bid (in Rs.)" />
                    <asp:BoundField DataField="bidEndTime" HeaderText="Bid Endtime" />
                    <asp:TemplateField HeaderText="" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("pid") %>'></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <style type="text/css">
            input[type="submit"] 
            {
                margin-top:0px !important;
            }
        </style>
</asp:Content>
