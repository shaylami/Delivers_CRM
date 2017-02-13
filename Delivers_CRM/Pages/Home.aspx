<%@ Page Title="" Language="C#" MasterPageFile="~/WebFormMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Delivers_CRM.Pages.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContent" runat="server">
    <div>
        <asp:label ID="lblCurrentDateTime" runat="server"></asp:label>
    </div>
    <div>
        <asp:label ID="lblUserName" runat="server"></asp:label>
    </div>
    <div>
        <asp:Menu ID="RMenu" runat="server" CssClass="dynamic">
            <Items>
                <asp:MenuItem NavigateUrl="~/Pages/Home.aspx" Text="ראשי" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Pages/Transportation.aspx" Text="רכב" Value="רכב"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Pages/Delivers.aspx" Text="שליחים" Value="שליחים"></asp:MenuItem>
            </Items>
        </asp:Menu>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<asp:GridView id="GvJornal" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceBikesDelivers">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="Deliver_FULLName" HeaderText="Deliver_FULLName" SortExpression="Deliver_FULLName" />
        <asp:BoundField DataField="Deliver_Mobile" HeaderText="Deliver_Mobile" SortExpression="Deliver_Mobile" />
        <asp:BoundField DataField="Bike_Plate" HeaderText="Bike_Plate" SortExpression="Bike_Plate" />
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceBikesDelivers" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Deliver_Person.Deliver_FULLName, Deliver_Person.Deliver_Mobile, Motor_Bike.Bike_Plate FROM Deliver_Person CROSS JOIN Motor_Bike"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="TimerClock" runat="server" OnTick="TimerClock_Tick" />
</asp:Content>
