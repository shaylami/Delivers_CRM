﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WebFormMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Delivers_CRM.Pages.Home" %>
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
    <div></div>
    <div>
    </div>
    <div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="TimerClock" runat="server" OnTick="TimerClock_Tick" />
</asp:Content>
