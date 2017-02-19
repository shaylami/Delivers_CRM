<%@ Page Title="" Language="C#" MasterPageFile="~/WebFormMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Delivers_CRM.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContent" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table ID="Table1" runat="server" Font-Size="Large" Width="364px" Font-Names="Palatino" BorderColor="DarkRed" BorderWidth="2" ForeColor="Snow" CellPadding="5" CellSpacing="5" HorizontalAlign="Center" >
            <asp:TableHeaderRow runat="server" ForeColor="Snow" BackColor="DarkOrange" Font-Bold="true">
                <asp:TableHeaderCell columnSpan="2">התחברות</asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow ID="TableRow1" runat="server" BackColor="DarkOrange">
                <asp:TableCell>שם משתמש</asp:TableCell>
                <asp:TableCell><asp:TextBox runat="server" ID="TBEmail" Text="shay@lami.co.il" width="200px"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TableRow2" runat="server" BackColor="DarkOrange">
                <asp:TableCell>סיסמא</asp:TableCell>
                <asp:TableCell><asp:TextBox runat="server" ID="TBPWD" Text="123" width="200px" TextMode="SingleLine"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TableRow3" runat="server" BackColor="DarkOrange">
                <asp:TableCell ColumnSpan="2" HorizontalAlign ="Center">
                    <asp:Button runat="server" ID="UserLogin" Text="התחבר" OnClick="UserLogin_Click" width="40%"></asp:Button>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableFooterRow runat="server" BackColor="DarkOrange">
                <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                    <asp:Label runat="server" ID="lblError" visable="false" textcolor="red"></asp:Label>
                </asp:TableCell>
            </asp:TableFooterRow>
        </asp:Table>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
