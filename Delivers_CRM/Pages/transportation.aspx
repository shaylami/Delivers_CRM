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
    <div>
        <asp:Button runat="server" ID="AddNewBike" Text="הוסף אופנוע חדש" OnClick="AddNewBike_Click"></asp:Button>
        &nbsp
        <asp:Button runat="server" ID="ViewAllBikes" Text="כל האופנועים" OnClick="ViewAllBikes_Click"></asp:Button>
    </div>
    <br/>
    <div>
    <asp:DetailsView ID="DVAddBike" runat="server" Visible="False" AutoGenerateRows="False" CaptionAlign="Right" DataKeyNames="Bike_Id" DataSourceID="SqlDataSourceBike" DefaultMode="Insert" Height="73px" Width="353px">
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
            <asp:TemplateField HeaderText="שנת יצור" SortExpression="Year_of_Production">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Year_of_Production") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Year_of_Production") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Year_of_Production") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" CancelText="בטל" DeleteText="מחק" EditText="עריכה" InsertText="הוסף" NewText="חדש" SelectText="בחר" ShowInsertButton="True" UpdateText="עדכן" />
        </Fields>
    </asp:DetailsView>
    </div>
    <div>
        <asp:GridView ID="GVAllBikes" runat="server" Visible="true" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Bike_Id" DataSourceID="SqlDataSourceBike">
            <Columns>
                <asp:CommandField ButtonType="Button" CancelText="בטל" DeleteText="מחק" EditText="עריכה" InsertText="הוסף" NewText="חדש" SelectText="בחר" ShowEditButton="True" ShowSelectButton="True" UpdateText="עדכן" />
                <asp:BoundField DataField="Bike_Id" HeaderText="מזהה מערכת" InsertVisible="False" ReadOnly="True" SortExpression="Bike_Id" />
                <asp:TemplateField HeaderText="לוחית זיהוי" SortExpression="Bike_Plate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Bike_Plate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Bike_Plate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="דגם" SortExpression="Bike_Model">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Bike_Model") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Bike_Model") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="צבע" SortExpression="Bike_Color">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Bike_Color") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Bike_Color") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="שנת יצור" SortExpression="Year_of_Production">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Year_of_Production") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Year_of_Production") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div>
    <asp:SqlDataSource ID="SqlDataSourceBike" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Motor_Bike] WHERE [Bike_Id] = @original_Bike_Id AND (([Bike_Plate] = @original_Bike_Plate) OR ([Bike_Plate] IS NULL AND @original_Bike_Plate IS NULL)) AND (([Bike_Model] = @original_Bike_Model) OR ([Bike_Model] IS NULL AND @original_Bike_Model IS NULL)) AND (([Bike_Color] = @original_Bike_Color) OR ([Bike_Color] IS NULL AND @original_Bike_Color IS NULL)) AND (([Year_of_Production] = @original_Year_of_Production) OR ([Year_of_Production] IS NULL AND @original_Year_of_Production IS NULL))" InsertCommand="INSERT INTO [Motor_Bike] ([Bike_Plate], [Bike_Model], [Bike_Color], [Year_of_Production]) VALUES (@Bike_Plate, @Bike_Model, @Bike_Color, @Year_of_Production)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Motor_Bike]" UpdateCommand="UPDATE [Motor_Bike] SET [Bike_Plate] = @Bike_Plate, [Bike_Model] = @Bike_Model, [Bike_Color] = @Bike_Color, [Year_of_Production] = @Year_of_Production WHERE [Bike_Id] = @original_Bike_Id AND (([Bike_Plate] = @original_Bike_Plate) OR ([Bike_Plate] IS NULL AND @original_Bike_Plate IS NULL)) AND (([Bike_Model] = @original_Bike_Model) OR ([Bike_Model] IS NULL AND @original_Bike_Model IS NULL)) AND (([Bike_Color] = @original_Bike_Color) OR ([Bike_Color] IS NULL AND @original_Bike_Color IS NULL)) AND (([Year_of_Production] = @original_Year_of_Production) OR ([Year_of_Production] IS NULL AND @original_Year_of_Production IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Bike_Id" Type="Int32" />
            <asp:Parameter Name="original_Bike_Plate" Type="String" />
            <asp:Parameter Name="original_Bike_Model" Type="String" />
            <asp:Parameter Name="original_Bike_Color" Type="String" />
            <asp:Parameter Name="original_Year_of_Production" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Bike_Plate" Type="String" />
            <asp:Parameter Name="Bike_Model" Type="String" />
            <asp:Parameter Name="Bike_Color" Type="String" />
            <asp:Parameter Name="Year_of_Production" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Bike_Plate" Type="String" />
            <asp:Parameter Name="Bike_Model" Type="String" />
            <asp:Parameter Name="Bike_Color" Type="String" />
            <asp:Parameter Name="Year_of_Production" Type="String" />
            <asp:Parameter Name="original_Bike_Id" Type="Int32" />
            <asp:Parameter Name="original_Bike_Plate" Type="String" />
            <asp:Parameter Name="original_Bike_Model" Type="String" />
            <asp:Parameter Name="original_Bike_Color" Type="String" />
            <asp:Parameter Name="original_Year_of_Production" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
