<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.Master" CodeBehind="Feedback.aspx.cs" Inherits="Auction.Feedback" %>

<asp:Content ContentPlaceHolderID="Body" runat="server">
    <div class="addProduct">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to Home</asp:HyperLink>
        <br />
        <br />
        <div>
            <div style="width:30%;float:left;">Enter Subject</div> 
            <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtSubject" Display="Dynamic" ErrorMessage="*">*</asp:RequiredFieldValidator>
        </div>
        <br />
        <div>
            <div style="width:30%;float:left;">Enter Description</div> 
            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtDesc" Display="Dynamic" ErrorMessage="*">*</asp:RequiredFieldValidator>
        </div>
        <br />
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                onclick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>
