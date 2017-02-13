<%@ Page Title="" Language="C#" MasterPageFile="~/WebFormMaster.Master" AutoEventWireup="true" CodeBehind="Transportation.aspx.cs" Inherits="Delivers_CRM.Pages.transportation" %>
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
    <asp:DetailsView ID="DVAddBike" runat="server" Visible="False" AutoGenerateRows="False" CaptionAlign="Right" DefaultMode="Insert" Height="73px" Width="575px" OnItemInserting="DVAddBike_ItemInserting">
        <CommandRowStyle Wrap="True" />
        <Fields>
            <asp:TemplateField HeaderText="לוחית זיהוי">
                <InsertItemTemplate>
                    <asp:TextBox ID="tbBike_Plate" runat="server"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="דגם">
                <InsertItemTemplate>
                    <asp:TextBox ID="tbBike_Model" runat="server"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="צבע">
                <InsertItemTemplate>
                    <asp:TextBox ID="tbBike_Color" runat="server"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="שנת יצור">
                <InsertItemTemplate>
                    <asp:TextBox ID="tbYear_of_Production" runat="server"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="רישיון רכב">
                <InsertItemTemplate>
                    <asp:FileUpload ID="FUCarLicense" runat="server"></asp:FileUpload>
                    &nbsp
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" CancelText="בטל" DeleteText="מחק" EditText="עריכה" InsertText="הוסף" NewText="חדש" SelectText="בחר" ShowInsertButton="True" UpdateText="עדכן" />
        </Fields>
    </asp:DetailsView>
    </div>
    <div>
        <asp:GridView ID="GVAllBikes" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Bike_Id" DataSourceID="SqlDataSourceBike">
            <Columns>
                <asp:CommandField ButtonType="Button" CancelText="ביטול" DeleteText="מחק" EditText="עריכה" InsertText="הוסף" NewText="חדש" SelectText="בחר" ShowEditButton="True" ShowSelectButton="True" UpdateText="עדכן" />
                <asp:TemplateField HeaderText="מזהה מערכת" InsertVisible="False" SortExpression="Bike_Id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Bike_Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBikeID" runat="server" Text='<%# Bind("Bike_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="לוחית זיהוי" SortExpression="Bike_Plate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Bike_Plate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Bike_Plate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="דגם מלא" SortExpression="Bike_Model">
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
                <asp:TemplateField HeaderText="רישיון רכב" SortExpression="Car_License_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Car_License_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Car_License_Name") %>' Visible="False"></asp:Label>
                        <asp:LinkButton ID="FileView" runat="server" Text="רישיון רכב" OnClick="ViewFile" CommandArgument='<%# Bind("Bike_Id") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div>
    <asp:SqlDataSource ID="SqlDataSourceBike" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Motor_Bike] WHERE [Bike_Id] = @original_Bike_Id AND (([Bike_Plate] = @original_Bike_Plate) OR ([Bike_Plate] IS NULL AND @original_Bike_Plate IS NULL)) AND (([Bike_Model] = @original_Bike_Model) OR ([Bike_Model] IS NULL AND @original_Bike_Model IS NULL)) AND (([Bike_Color] = @original_Bike_Color) OR ([Bike_Color] IS NULL AND @original_Bike_Color IS NULL)) AND (([Year_of_Production] = @original_Year_of_Production) OR ([Year_of_Production] IS NULL AND @original_Year_of_Production IS NULL)) AND (([Car_License_Name] = @original_Car_License_Name) OR ([Car_License_Name] IS NULL AND @original_Car_License_Name IS NULL)) AND (([Car_License_Type] = @original_Car_License_Type) OR ([Car_License_Type] IS NULL AND @original_Car_License_Type IS NULL)) AND (([Car_License_Data] = @original_Car_License_Data) OR ([Car_License_Data] IS NULL AND @original_Car_License_Data IS NULL))" InsertCommand="INSERT INTO [Motor_Bike] ([Bike_Plate], [Bike_Model], [Bike_Color], [Year_of_Production], [Car_License_Name], [Car_License_Type], [Car_License_Data]) VALUES (@Bike_Plate, @Bike_Model, @Bike_Color, @Year_of_Production, @Car_License_Name, @Car_License_Type, @Car_License_Data)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Motor_Bike]" UpdateCommand="UPDATE [Motor_Bike] SET [Bike_Plate] = @Bike_Plate, [Bike_Model] = @Bike_Model, [Bike_Color] = @Bike_Color, [Year_of_Production] = @Year_of_Production, [Car_License_Name] = @Car_License_Name, [Car_License_Type] = @Car_License_Type, [Car_License_Data] = @Car_License_Data WHERE [Bike_Id] = @original_Bike_Id AND (([Bike_Plate] = @original_Bike_Plate) OR ([Bike_Plate] IS NULL AND @original_Bike_Plate IS NULL)) AND (([Bike_Model] = @original_Bike_Model) OR ([Bike_Model] IS NULL AND @original_Bike_Model IS NULL)) AND (([Bike_Color] = @original_Bike_Color) OR ([Bike_Color] IS NULL AND @original_Bike_Color IS NULL)) AND (([Year_of_Production] = @original_Year_of_Production) OR ([Year_of_Production] IS NULL AND @original_Year_of_Production IS NULL)) AND (([Car_License_Name] = @original_Car_License_Name) OR ([Car_License_Name] IS NULL AND @original_Car_License_Name IS NULL)) AND (([Car_License_Type] = @original_Car_License_Type) OR ([Car_License_Type] IS NULL AND @original_Car_License_Type IS NULL)) AND (([Car_License_Data] = @original_Car_License_Data) OR ([Car_License_Data] IS NULL AND @original_Car_License_Data IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Bike_Id" Type="Int32" />
            <asp:Parameter Name="original_Bike_Plate" Type="String" />
            <asp:Parameter Name="original_Bike_Model" Type="String" />
            <asp:Parameter Name="original_Bike_Color" Type="String" />
            <asp:Parameter Name="original_Year_of_Production" Type="String" />
            <asp:Parameter Name="original_Car_License_Name" Type="String" />
            <asp:Parameter Name="original_Car_License_Type" Type="String" />
            <asp:Parameter Name="original_Car_License_Data" Type="Object" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Bike_Plate" Type="String" />
            <asp:Parameter Name="Bike_Model" Type="String" />
            <asp:Parameter Name="Bike_Color" Type="String" />
            <asp:Parameter Name="Year_of_Production" Type="String" />
            <asp:Parameter Name="Car_License_Name" Type="String" />
            <asp:Parameter Name="Car_License_Type" Type="String" />
            <asp:Parameter Name="Car_License_Data" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Bike_Plate" Type="String" />
            <asp:Parameter Name="Bike_Model" Type="String" />
            <asp:Parameter Name="Bike_Color" Type="String" />
            <asp:Parameter Name="Year_of_Production" Type="String" />
            <asp:Parameter Name="Car_License_Name" Type="String" />
            <asp:Parameter Name="Car_License_Type" Type="String" />
            <asp:Parameter Name="Car_License_Data" Type="Object" />
            <asp:Parameter Name="original_Bike_Id" Type="Int32" />
            <asp:Parameter Name="original_Bike_Plate" Type="String" />
            <asp:Parameter Name="original_Bike_Model" Type="String" />
            <asp:Parameter Name="original_Bike_Color" Type="String" />
            <asp:Parameter Name="original_Year_of_Production" Type="String" />
            <asp:Parameter Name="original_Car_License_Name" Type="String" />
            <asp:Parameter Name="original_Car_License_Type" Type="String" />
            <asp:Parameter Name="original_Car_License_Data" Type="Object" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
    <div>
         <asp:Literal ID="ltEmbedHT" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
