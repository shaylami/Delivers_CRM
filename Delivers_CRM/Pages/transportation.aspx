<%@ Page Title="" Language="C#" MasterPageFile="~/WebFormMaster.Master" AutoEventWireup="true" CodeBehind="transportation.aspx.cs" Inherits="Delivers_CRM.Pages.transportation" %>
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CaptionAlign="Top" DataKeyNames="Bike_Id" DataSourceID="SqlDataSourceBike" DefaultMode="Insert" Height="50px" Width="353px">
        <CommandRowStyle Wrap="True" />
        <Fields>
            <asp:BoundField DataField="Bike_Id" HeaderText="Bike_Id" InsertVisible="False" ReadOnly="True" SortExpression="Bike_Id" />
            <asp:TemplateField HeaderText="לוחית זיהוי" SortExpression="Bike_Plate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Bike_Plate") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Bike_Plate") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Bike_Plate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="דגם" SortExpression="Bike_Model">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Bike_Model") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Bike_Model") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Bike_Model") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="צבע" SortExpression="Bike_Color">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Bike_Color") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Bike_Color") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Bike_Color") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" CancelText="ביטול" DeleteText="מחק" EditText="ערוך" InsertText="הוסף" NewText="חדש" SelectText="בחר" ShowInsertButton="True" UpdateText="עדכן" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceBike" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Motor_Bike] WHERE [Bike_Id] = @original_Bike_Id AND (([Bike_Plate] = @original_Bike_Plate) OR ([Bike_Plate] IS NULL AND @original_Bike_Plate IS NULL)) AND (([Bike_Model] = @original_Bike_Model) OR ([Bike_Model] IS NULL AND @original_Bike_Model IS NULL)) AND (([Bike_Color] = @original_Bike_Color) OR ([Bike_Color] IS NULL AND @original_Bike_Color IS NULL))" InsertCommand="INSERT INTO [Motor_Bike] ([Bike_Plate], [Bike_Model], [Bike_Color]) VALUES (@Bike_Plate, @Bike_Model, @Bike_Color)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Motor_Bike]" UpdateCommand="UPDATE [Motor_Bike] SET [Bike_Plate] = @Bike_Plate, [Bike_Model] = @Bike_Model, [Bike_Color] = @Bike_Color WHERE [Bike_Id] = @original_Bike_Id AND (([Bike_Plate] = @original_Bike_Plate) OR ([Bike_Plate] IS NULL AND @original_Bike_Plate IS NULL)) AND (([Bike_Model] = @original_Bike_Model) OR ([Bike_Model] IS NULL AND @original_Bike_Model IS NULL)) AND (([Bike_Color] = @original_Bike_Color) OR ([Bike_Color] IS NULL AND @original_Bike_Color IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Bike_Id" Type="Int32" />
            <asp:Parameter Name="original_Bike_Plate" Type="String" />
            <asp:Parameter Name="original_Bike_Model" Type="String" />
            <asp:Parameter Name="original_Bike_Color" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Bike_Plate" Type="String" />
            <asp:Parameter Name="Bike_Model" Type="String" />
            <asp:Parameter Name="Bike_Color" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Bike_Plate" Type="String" />
            <asp:Parameter Name="Bike_Model" Type="String" />
            <asp:Parameter Name="Bike_Color" Type="String" />
            <asp:Parameter Name="original_Bike_Id" Type="Int32" />
            <asp:Parameter Name="original_Bike_Plate" Type="String" />
            <asp:Parameter Name="original_Bike_Model" Type="String" />
            <asp:Parameter Name="original_Bike_Color" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
