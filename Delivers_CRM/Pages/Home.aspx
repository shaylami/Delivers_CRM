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
    <div>
        <asp:Button ID="BtnAddNewDeliver2Bike" runat="server" Text="שיוך קטנוע לשליח" Width="130px" OnClick="BtnAddNewDeliver2Bike_Click" />&nbsp;&nbsp;&nbsp;
        <asp:Button ID="BtnDeliversBikesList" runat="server" Text="רשימת שליחים קטנועים" OnClick="BtnDeliversBikesList_Click" />
    </div>
    <div>
        <asp:DetailsView ID="DVAddDeliver2Bike" runat="server" AutoGenerateRows="False" DataKeyNames="Bike_Jornal_ID" DefaultMode="Insert" Height="50px" Width="569px" OnItemInserting="DVAddDeliver2Bike_ItemInserting" Visible="False" OnModeChanging="DVAddDeliver2Bike_ModeChanging">
            <Fields>
                <asp:BoundField DataField="Bike_Jornal_ID" HeaderText="Bike_Jornal_ID" InsertVisible="False" ReadOnly="True" SortExpression="Bike_Jornal_ID" />
                <asp:TemplateField HeaderText="לוחית רישוי" SortExpression="Bike_Plate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Bike_Plate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DDL_BikePlate" runat="server" DataSourceID="SqlDataSourceBikes" DataTextField="Bike_Plate" DataValueField="Bike_Plate" SelectedValue='<%# Bind("Bike_Plate", "{0}") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Bike_Plate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="תאריך ושעה" SortExpression="Tody_Date_Time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Tody_Date_Time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBCurrentTodatDateTime" runat="server" Text='<%# Bind("Tody_Date_Time") %>' ReadOnly="True"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Tody_Date_Time") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="שליח מוסר" SortExpression="Deliver_return_Bike">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Deliver_return_Bike") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DDLDeliverSend" runat="server" DataSourceID="SqlDataSourceDelivers" DataTextField="Deliver_FULLName" DataValueField="Deliver_FULLName" SelectedValue='<%# Bind("Deliver_return_Bike", "{0}") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Deliver_return_Bike") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="שליח מקבל" SortExpression="Deliver_get_Bike">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Deliver_get_Bike") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DDLDeliverGetBike" runat="server" DataSourceID="SqlDataSourceDelivers" DataTextField="Deliver_FULLName" DataValueField="Deliver_FULLName" SelectedValue='<%# Bind("Deliver_get_Bike", "{0}") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Deliver_get_Bike") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ק&quot;מ" SortExpression="Bike_Km">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Bike_Km") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBKM" runat="server" Text='<%# Bind("Bike_Km") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Bike_Km") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="משוייך ל" SortExpression="Bike_Current_Owner">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Bike_Current_Owner") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBFinallDeliverName" runat="server" Text='<%# Bind("Bike_Current_Owner") %>' ReadOnly="True"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Bike_Current_Owner") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="הערות" SortExpression="Comments">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBComments" runat="server" Height="55px" Text='<%# Bind("Comments") %>' TextMode="MultiLine" Width="333px"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" CancelText="ביטול" DeleteText="מחיקה" EditText="עריכה" InsertText="הוספה" NewText="חדש" SelectText="בחר" UpdateText="עדכן" />
            </Fields>
        </asp:DetailsView>
        <asp:GridView ID="GVDeliverBikeList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Bike_Jornal_ID" DataSourceID="SqlDataSourceBikeJornalViewEdit">
            <Columns>
                <asp:CommandField ButtonType="Button" CancelText="ביטול" DeleteText="מחיקה" EditText="עריכה" InsertText="הוספה" NewText="חדש" SelectText="בחר" ShowEditButton="True" UpdateText="עדכון" />
                <asp:BoundField DataField="Bike_Jornal_ID" HeaderText="מזהה מערכת" InsertVisible="False" ReadOnly="True" SortExpression="Bike_Jornal_ID" Visible="False" />
                <asp:TemplateField HeaderText="לוחית רישוי" SortExpression="Bike_Plate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TBBikePlate" runat="server" Text='<%# Bind("Bike_Plate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Bike_Plate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="תאריך ושעה" SortExpression="Tody_Date_Time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TBDateTime" runat="server" Text='<%# Bind("Tody_Date_Time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Tody_Date_Time") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="שליח מוסר" SortExpression="Deliver_return_Bike">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLDelvierSet" runat="server" DataSourceID="SqlDataSourceDelivers" DataTextField="Deliver_FULLName" DataValueField="Deliver_FULLName" SelectedValue='<%# Bind("Deliver_return_Bike", "{0}") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Deliver_return_Bike") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="שליח מקבל" SortExpression="Deliver_get_Bike">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLDeliverGet" runat="server" DataSourceID="SqlDataSourceDelivers" DataTextField="Deliver_FULLName" DataValueField="Deliver_FULLName" SelectedValue='<%# Bind("Deliver_get_Bike", "{0}") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Deliver_get_Bike") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ק&quot;מ" SortExpression="Bike_Km">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Bike_Km") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Bike_Km") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="משוייך ל" SortExpression="Bike_Current_Owner">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLFinalDeliver" runat="server" DataSourceID="SqlDataSourceDelivers" DataTextField="Deliver_FULLName" DataValueField="Deliver_FULLName" SelectedValue='<%# Bind("Bike_Current_Owner", "{0}") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Bike_Current_Owner") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="הערות" SortExpression="Comments">
                    <EditItemTemplate>
                        <asp:TextBox ID="TBComments" runat="server" Text='<%# Bind("Comments") %>' TextMode="MultiLine" Width="200px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceBikeJornalViewEdit" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Bike_Jornal] WHERE [Bike_Jornal_ID] = @original_Bike_Jornal_ID AND (([Bike_Plate] = @original_Bike_Plate) OR ([Bike_Plate] IS NULL AND @original_Bike_Plate IS NULL)) AND (([Tody_Date_Time] = @original_Tody_Date_Time) OR ([Tody_Date_Time] IS NULL AND @original_Tody_Date_Time IS NULL)) AND (([Deliver_return_Bike] = @original_Deliver_return_Bike) OR ([Deliver_return_Bike] IS NULL AND @original_Deliver_return_Bike IS NULL)) AND (([Deliver_get_Bike] = @original_Deliver_get_Bike) OR ([Deliver_get_Bike] IS NULL AND @original_Deliver_get_Bike IS NULL)) AND (([Bike_Km] = @original_Bike_Km) OR ([Bike_Km] IS NULL AND @original_Bike_Km IS NULL)) AND (([Bike_Current_Owner] = @original_Bike_Current_Owner) OR ([Bike_Current_Owner] IS NULL AND @original_Bike_Current_Owner IS NULL)) AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL))" InsertCommand="INSERT INTO [Bike_Jornal] ([Bike_Plate], [Tody_Date_Time], [Deliver_return_Bike], [Deliver_get_Bike], [Bike_Km], [Bike_Current_Owner], [Comments]) VALUES (@Bike_Plate, @Tody_Date_Time, @Deliver_return_Bike, @Deliver_get_Bike, @Bike_Km, @Bike_Current_Owner, @Comments)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Bike_Jornal]" UpdateCommand="UPDATE [Bike_Jornal] SET [Bike_Plate] = @Bike_Plate, [Tody_Date_Time] = @Tody_Date_Time, [Deliver_return_Bike] = @Deliver_return_Bike, [Deliver_get_Bike] = @Deliver_get_Bike, [Bike_Km] = @Bike_Km, [Bike_Current_Owner] = @Bike_Current_Owner, [Comments] = @Comments WHERE [Bike_Jornal_ID] = @original_Bike_Jornal_ID AND (([Bike_Plate] = @original_Bike_Plate) OR ([Bike_Plate] IS NULL AND @original_Bike_Plate IS NULL)) AND (([Tody_Date_Time] = @original_Tody_Date_Time) OR ([Tody_Date_Time] IS NULL AND @original_Tody_Date_Time IS NULL)) AND (([Deliver_return_Bike] = @original_Deliver_return_Bike) OR ([Deliver_return_Bike] IS NULL AND @original_Deliver_return_Bike IS NULL)) AND (([Deliver_get_Bike] = @original_Deliver_get_Bike) OR ([Deliver_get_Bike] IS NULL AND @original_Deliver_get_Bike IS NULL)) AND (([Bike_Km] = @original_Bike_Km) OR ([Bike_Km] IS NULL AND @original_Bike_Km IS NULL)) AND (([Bike_Current_Owner] = @original_Bike_Current_Owner) OR ([Bike_Current_Owner] IS NULL AND @original_Bike_Current_Owner IS NULL)) AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Bike_Jornal_ID" Type="Int64" />
                <asp:Parameter Name="original_Bike_Plate" Type="String" />
                <asp:Parameter Name="original_Tody_Date_Time" Type="String" />
                <asp:Parameter Name="original_Deliver_return_Bike" Type="String" />
                <asp:Parameter Name="original_Deliver_get_Bike" Type="String" />
                <asp:Parameter Name="original_Bike_Km" Type="String" />
                <asp:Parameter Name="original_Bike_Current_Owner" Type="String" />
                <asp:Parameter Name="original_Comments" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Bike_Plate" Type="String" />
                <asp:Parameter Name="Tody_Date_Time" Type="String" />
                <asp:Parameter Name="Deliver_return_Bike" Type="String" />
                <asp:Parameter Name="Deliver_get_Bike" Type="String" />
                <asp:Parameter Name="Bike_Km" Type="String" />
                <asp:Parameter Name="Bike_Current_Owner" Type="String" />
                <asp:Parameter Name="Comments" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Bike_Plate" Type="String" />
                <asp:Parameter Name="Tody_Date_Time" Type="String" />
                <asp:Parameter Name="Deliver_return_Bike" Type="String" />
                <asp:Parameter Name="Deliver_get_Bike" Type="String" />
                <asp:Parameter Name="Bike_Km" Type="String" />
                <asp:Parameter Name="Bike_Current_Owner" Type="String" />
                <asp:Parameter Name="Comments" Type="String" />
                <asp:Parameter Name="original_Bike_Jornal_ID" Type="Int64" />
                <asp:Parameter Name="original_Bike_Plate" Type="String" />
                <asp:Parameter Name="original_Tody_Date_Time" Type="String" />
                <asp:Parameter Name="original_Deliver_return_Bike" Type="String" />
                <asp:Parameter Name="original_Deliver_get_Bike" Type="String" />
                <asp:Parameter Name="original_Bike_Km" Type="String" />
                <asp:Parameter Name="original_Bike_Current_Owner" Type="String" />
                <asp:Parameter Name="original_Comments" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceDelivers" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Deliver_Person] WHERE [Deliver_ID] = @original_Deliver_ID AND (([Deliver_FULLName] = @original_Deliver_FULLName) OR ([Deliver_FULLName] IS NULL AND @original_Deliver_FULLName IS NULL)) AND (([Deliver_Blue_ID] = @original_Deliver_Blue_ID) OR ([Deliver_Blue_ID] IS NULL AND @original_Deliver_Blue_ID IS NULL)) AND (([Deliver_Lic_ID] = @original_Deliver_Lic_ID) OR ([Deliver_Lic_ID] IS NULL AND @original_Deliver_Lic_ID IS NULL)) AND (([Deliver_Lic_Expration_date] = @original_Deliver_Lic_Expration_date) OR ([Deliver_Lic_Expration_date] IS NULL AND @original_Deliver_Lic_Expration_date IS NULL)) AND (([Deliver_Birth_Date] = @original_Deliver_Birth_Date) OR ([Deliver_Birth_Date] IS NULL AND @original_Deliver_Birth_Date IS NULL)) AND (([Deliver_Mobile] = @original_Deliver_Mobile) OR ([Deliver_Mobile] IS NULL AND @original_Deliver_Mobile IS NULL)) AND (([Deliver_Phone] = @original_Deliver_Phone) OR ([Deliver_Phone] IS NULL AND @original_Deliver_Phone IS NULL)) AND (([Deliver_Address] = @original_Deliver_Address) OR ([Deliver_Address] IS NULL AND @original_Deliver_Address IS NULL)) AND (([Deliver_Email] = @original_Deliver_Email) OR ([Deliver_Email] IS NULL AND @original_Deliver_Email IS NULL)) AND (([Emrg_Contact_Name] = @original_Emrg_Contact_Name) OR ([Emrg_Contact_Name] IS NULL AND @original_Emrg_Contact_Name IS NULL)) AND (([Emrg_Contact_Phone] = @original_Emrg_Contact_Phone) OR ([Emrg_Contact_Phone] IS NULL AND @original_Emrg_Contact_Phone IS NULL)) AND (([Emrg_Contact_Reletive] = @original_Emrg_Contact_Reletive) OR ([Emrg_Contact_Reletive] IS NULL AND @original_Emrg_Contact_Reletive IS NULL))" InsertCommand="INSERT INTO [Deliver_Person] ([Deliver_FULLName], [Deliver_Blue_ID], [Deliver_Lic_ID], [Deliver_Lic_Expration_date], [Deliver_Birth_Date], [Deliver_Mobile], [Deliver_Phone], [Deliver_Address], [Deliver_Email], [Emrg_Contact_Name], [Emrg_Contact_Phone], [Emrg_Contact_Reletive]) VALUES (@Deliver_FULLName, @Deliver_Blue_ID, @Deliver_Lic_ID, @Deliver_Lic_Expration_date, @Deliver_Birth_Date, @Deliver_Mobile, @Deliver_Phone, @Deliver_Address, @Deliver_Email, @Emrg_Contact_Name, @Emrg_Contact_Phone, @Emrg_Contact_Reletive)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Deliver_Person]" UpdateCommand="UPDATE [Deliver_Person] SET [Deliver_FULLName] = @Deliver_FULLName, [Deliver_Blue_ID] = @Deliver_Blue_ID, [Deliver_Lic_ID] = @Deliver_Lic_ID, [Deliver_Lic_Expration_date] = @Deliver_Lic_Expration_date, [Deliver_Birth_Date] = @Deliver_Birth_Date, [Deliver_Mobile] = @Deliver_Mobile, [Deliver_Phone] = @Deliver_Phone, [Deliver_Address] = @Deliver_Address, [Deliver_Email] = @Deliver_Email, [Emrg_Contact_Name] = @Emrg_Contact_Name, [Emrg_Contact_Phone] = @Emrg_Contact_Phone, [Emrg_Contact_Reletive] = @Emrg_Contact_Reletive WHERE [Deliver_ID] = @original_Deliver_ID AND (([Deliver_FULLName] = @original_Deliver_FULLName) OR ([Deliver_FULLName] IS NULL AND @original_Deliver_FULLName IS NULL)) AND (([Deliver_Blue_ID] = @original_Deliver_Blue_ID) OR ([Deliver_Blue_ID] IS NULL AND @original_Deliver_Blue_ID IS NULL)) AND (([Deliver_Lic_ID] = @original_Deliver_Lic_ID) OR ([Deliver_Lic_ID] IS NULL AND @original_Deliver_Lic_ID IS NULL)) AND (([Deliver_Lic_Expration_date] = @original_Deliver_Lic_Expration_date) OR ([Deliver_Lic_Expration_date] IS NULL AND @original_Deliver_Lic_Expration_date IS NULL)) AND (([Deliver_Birth_Date] = @original_Deliver_Birth_Date) OR ([Deliver_Birth_Date] IS NULL AND @original_Deliver_Birth_Date IS NULL)) AND (([Deliver_Mobile] = @original_Deliver_Mobile) OR ([Deliver_Mobile] IS NULL AND @original_Deliver_Mobile IS NULL)) AND (([Deliver_Phone] = @original_Deliver_Phone) OR ([Deliver_Phone] IS NULL AND @original_Deliver_Phone IS NULL)) AND (([Deliver_Address] = @original_Deliver_Address) OR ([Deliver_Address] IS NULL AND @original_Deliver_Address IS NULL)) AND (([Deliver_Email] = @original_Deliver_Email) OR ([Deliver_Email] IS NULL AND @original_Deliver_Email IS NULL)) AND (([Emrg_Contact_Name] = @original_Emrg_Contact_Name) OR ([Emrg_Contact_Name] IS NULL AND @original_Emrg_Contact_Name IS NULL)) AND (([Emrg_Contact_Phone] = @original_Emrg_Contact_Phone) OR ([Emrg_Contact_Phone] IS NULL AND @original_Emrg_Contact_Phone IS NULL)) AND (([Emrg_Contact_Reletive] = @original_Emrg_Contact_Reletive) OR ([Emrg_Contact_Reletive] IS NULL AND @original_Emrg_Contact_Reletive IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Deliver_ID" Type="Int64" />
                <asp:Parameter Name="original_Deliver_FULLName" Type="String" />
                <asp:Parameter Name="original_Deliver_Blue_ID" Type="String" />
                <asp:Parameter Name="original_Deliver_Lic_ID" Type="String" />
                <asp:Parameter Name="original_Deliver_Lic_Expration_date" Type="String" />
                <asp:Parameter Name="original_Deliver_Birth_Date" Type="String" />
                <asp:Parameter Name="original_Deliver_Mobile" Type="String" />
                <asp:Parameter Name="original_Deliver_Phone" Type="String" />
                <asp:Parameter Name="original_Deliver_Address" Type="String" />
                <asp:Parameter Name="original_Deliver_Email" Type="String" />
                <asp:Parameter Name="original_Emrg_Contact_Name" Type="String" />
                <asp:Parameter Name="original_Emrg_Contact_Phone" Type="String" />
                <asp:Parameter Name="original_Emrg_Contact_Reletive" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Deliver_FULLName" Type="String" />
                <asp:Parameter Name="Deliver_Blue_ID" Type="String" />
                <asp:Parameter Name="Deliver_Lic_ID" Type="String" />
                <asp:Parameter Name="Deliver_Lic_Expration_date" Type="String" />
                <asp:Parameter Name="Deliver_Birth_Date" Type="String" />
                <asp:Parameter Name="Deliver_Mobile" Type="String" />
                <asp:Parameter Name="Deliver_Phone" Type="String" />
                <asp:Parameter Name="Deliver_Address" Type="String" />
                <asp:Parameter Name="Deliver_Email" Type="String" />
                <asp:Parameter Name="Emrg_Contact_Name" Type="String" />
                <asp:Parameter Name="Emrg_Contact_Phone" Type="String" />
                <asp:Parameter Name="Emrg_Contact_Reletive" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Deliver_FULLName" Type="String" />
                <asp:Parameter Name="Deliver_Blue_ID" Type="String" />
                <asp:Parameter Name="Deliver_Lic_ID" Type="String" />
                <asp:Parameter Name="Deliver_Lic_Expration_date" Type="String" />
                <asp:Parameter Name="Deliver_Birth_Date" Type="String" />
                <asp:Parameter Name="Deliver_Mobile" Type="String" />
                <asp:Parameter Name="Deliver_Phone" Type="String" />
                <asp:Parameter Name="Deliver_Address" Type="String" />
                <asp:Parameter Name="Deliver_Email" Type="String" />
                <asp:Parameter Name="Emrg_Contact_Name" Type="String" />
                <asp:Parameter Name="Emrg_Contact_Phone" Type="String" />
                <asp:Parameter Name="Emrg_Contact_Reletive" Type="String" />
                <asp:Parameter Name="original_Deliver_ID" Type="Int64" />
                <asp:Parameter Name="original_Deliver_FULLName" Type="String" />
                <asp:Parameter Name="original_Deliver_Blue_ID" Type="String" />
                <asp:Parameter Name="original_Deliver_Lic_ID" Type="String" />
                <asp:Parameter Name="original_Deliver_Lic_Expration_date" Type="String" />
                <asp:Parameter Name="original_Deliver_Birth_Date" Type="String" />
                <asp:Parameter Name="original_Deliver_Mobile" Type="String" />
                <asp:Parameter Name="original_Deliver_Phone" Type="String" />
                <asp:Parameter Name="original_Deliver_Address" Type="String" />
                <asp:Parameter Name="original_Deliver_Email" Type="String" />
                <asp:Parameter Name="original_Emrg_Contact_Name" Type="String" />
                <asp:Parameter Name="original_Emrg_Contact_Phone" Type="String" />
                <asp:Parameter Name="original_Emrg_Contact_Reletive" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceBikes" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Motor_Bike] WHERE [Bike_Id] = @original_Bike_Id AND (([Bike_Plate] = @original_Bike_Plate) OR ([Bike_Plate] IS NULL AND @original_Bike_Plate IS NULL)) AND (([Bike_Model] = @original_Bike_Model) OR ([Bike_Model] IS NULL AND @original_Bike_Model IS NULL)) AND (([Bike_Color] = @original_Bike_Color) OR ([Bike_Color] IS NULL AND @original_Bike_Color IS NULL)) AND (([Year_of_Production] = @original_Year_of_Production) OR ([Year_of_Production] IS NULL AND @original_Year_of_Production IS NULL)) AND (([Car_License_Name] = @original_Car_License_Name) OR ([Car_License_Name] IS NULL AND @original_Car_License_Name IS NULL)) AND (([Car_License_Type] = @original_Car_License_Type) OR ([Car_License_Type] IS NULL AND @original_Car_License_Type IS NULL)) AND (([Car_License_Data] = @original_Car_License_Data) OR ([Car_License_Data] IS NULL AND @original_Car_License_Data IS NULL))" InsertCommand="INSERT INTO [Motor_Bike] ([Bike_Plate], [Bike_Model], [Bike_Color], [Year_of_Production], [Car_License_Name], [Car_License_Type], [Car_License_Data]) VALUES (@Bike_Plate, @Bike_Model, @Bike_Color, @Year_of_Production, @Car_License_Name, @Car_License_Type, @Car_License_Data)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Motor_Bike]" UpdateCommand="UPDATE [Motor_Bike] SET [Bike_Plate] = @Bike_Plate, [Bike_Model] = @Bike_Model, [Bike_Color] = @Bike_Color, [Year_of_Production] = @Year_of_Production, [Car_License_Name] = @Car_License_Name, [Car_License_Type] = @Car_License_Type, [Car_License_Data] = @Car_License_Data WHERE [Bike_Id] = @original_Bike_Id AND (([Bike_Plate] = @original_Bike_Plate) OR ([Bike_Plate] IS NULL AND @original_Bike_Plate IS NULL)) AND (([Bike_Model] = @original_Bike_Model) OR ([Bike_Model] IS NULL AND @original_Bike_Model IS NULL)) AND (([Bike_Color] = @original_Bike_Color) OR ([Bike_Color] IS NULL AND @original_Bike_Color IS NULL)) AND (([Year_of_Production] = @original_Year_of_Production) OR ([Year_of_Production] IS NULL AND @original_Year_of_Production IS NULL)) AND (([Car_License_Name] = @original_Car_License_Name) OR ([Car_License_Name] IS NULL AND @original_Car_License_Name IS NULL)) AND (([Car_License_Type] = @original_Car_License_Type) OR ([Car_License_Type] IS NULL AND @original_Car_License_Type IS NULL)) AND (([Car_License_Data] = @original_Car_License_Data) OR ([Car_License_Data] IS NULL AND @original_Car_License_Data IS NULL))">
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
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="TimerClock" runat="server" OnTick="TimerClock_Tick" />
</asp:Content>
