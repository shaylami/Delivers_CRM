<%@ Page Title="" Language="C#" MasterPageFile="~/WebFormMaster.Master" AutoEventWireup="true" CodeBehind="Delivers.aspx.cs" Inherits="Delivers_CRM.Pages.Delivers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContent" runat="server">
    <div>
        <asp:Label ID="lblCurrentDateTime" runat="server"></asp:Label>
    </div>
    <div>
        <asp:Label ID="lblUserName" runat="server"></asp:Label>
    </div>
    <div>
        <asp:Menu ID="RMenu" runat="server" CssClass="dynamic">
            <Items>
                <asp:MenuItem NavigateUrl="~/Pages/Home.aspx" Text="ראשי" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Pages/Transportation.aspx" Text="רכב" Value="רכב"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Pages/Delivers.aspx" Text="שליחים" Value="שליחים"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Pages/Business.aspx" Text="לקוחות" Value="לקוחות"></asp:MenuItem>
            </Items>
        </asp:Menu>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Button ID="BtnInsertDeliver" runat="server" Text="הוסף שליח חדש" OnClick="BtnInsertDeliver_Click" /> &nbsp&nbsp&nbsp&nbsp <asp:Button ID="BtnViewAllDelivers" runat="server" Text="רשימת שליחים" OnClick="BtnViewAllDelivers_Click" /> 
    <br /><br />
    <asp:DetailsView ID="DVInsertDelivers" runat="server" AutoGenerateRows="False" DataKeyNames="Deliver_ID" DataSourceID="SqlDataSourceDelivers" DefaultMode="Insert" Height="50px" Width="387px" OnItemInserted="DVInsertDelivers_ItemInserted">
        <Fields>
            <asp:BoundField DataField="Deliver_ID" HeaderText="Deliver_ID" InsertVisible="False" ReadOnly="True" SortExpression="Deliver_ID" />
            <asp:TemplateField HeaderText="שם מלא" SortExpression="Deliver_FULLName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Deliver_FULLName") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Deliver_FULLName") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Deliver_FULLName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="מס' ת&quot;ז" SortExpression="Deliver_Blue_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Deliver_Blue_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Deliver_Blue_ID") %>' TextMode="Number"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Deliver_Blue_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="מס' רישיון נהיגה" SortExpression="Deliver_Lic_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Deliver_Lic_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Deliver_Lic_ID") %>' TextMode="Number"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Deliver_Lic_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="תוקף רישיון נהיגה" SortExpression="Deliver_Lic_Expration_date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Deliver_Lic_Expration_date") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Deliver_Lic_Expration_date") %>' TextMode="DateTime"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Deliver_Lic_Expration_date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="תאריך לידה" SortExpression="Deliver_Birth_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Deliver_Birth_Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Deliver_Birth_Date") %>' TextMode="DateTime"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Deliver_Birth_Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="טלפון נייד" SortExpression="Deliver_Mobile">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Deliver_Mobile") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Deliver_Mobile") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Deliver_Mobile") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="טלפון" SortExpression="Deliver_Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Deliver_Phone") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Deliver_Phone") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Deliver_Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="כתובת" SortExpression="Deliver_Address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Deliver_Address") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Deliver_Address") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Deliver_Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="דוא&quot;ל" SortExpression="Deliver_Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Deliver_Email") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Deliver_Email") %>' TextMode="Email"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Deliver_Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="שם איש קשר בחרום" SortExpression="Emrg_Contact_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Emrg_Contact_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Emrg_Contact_Name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Emrg_Contact_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="טלפון איש קשר בחרום" SortExpression="Emrg_Contact_Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Emrg_Contact_Phone") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Emrg_Contact_Phone") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("Emrg_Contact_Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="קרבה איש קשר בחרום" SortExpression="Emrg_Contact_Reletive">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Emrg_Contact_Reletive") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Emrg_Contact_Reletive") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("Emrg_Contact_Reletive") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" CancelText="ביטול" DeleteText="מחק" EditText="עריכה" InsertText="הוסף" NewText="חדש" SelectText="בחר" ShowInsertButton="True" UpdateText="עדכן" />
        </Fields>
    </asp:DetailsView>
    <asp:GridView ID="GvAllDelives" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Deliver_ID" DataSourceID="SqlDataSourceDelivers" CssClass="gridview">
        <Columns>
            <asp:CommandField ButtonType="Button" CancelText="ביטול" DeleteText="מחיקה" EditText="עריכה" InsertText="הוספה" NewText="חדש" SelectText="בחר" ShowEditButton="True" UpdateText="עדכן" />
            <asp:BoundField DataField="Deliver_ID" HeaderText="Deliver_ID" InsertVisible="False" ReadOnly="True" SortExpression="Deliver_ID" Visible="False" />
            <asp:TemplateField HeaderText="שם מלא" SortExpression="Deliver_FULLName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Deliver_FULLName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Deliver_FULLName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ת&quot;ז" SortExpression="Deliver_Blue_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Deliver_Blue_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Deliver_Blue_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="מס' רישיון נהיגה" SortExpression="Deliver_Lic_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Deliver_Lic_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Deliver_Lic_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="תוקף רישיון נהיגה" SortExpression="Deliver_Lic_Expration_date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Deliver_Lic_Expration_date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Deliver_Lic_Expration_date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="תאריך לידה" SortExpression="Deliver_Birth_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Deliver_Birth_Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Deliver_Birth_Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="טלפון נייד" SortExpression="Deliver_Mobile">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Deliver_Mobile") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Deliver_Mobile") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="טלפון" SortExpression="Deliver_Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Deliver_Phone") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Deliver_Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="כתובת" SortExpression="Deliver_Address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Deliver_Address") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Deliver_Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="דוא&quot;ל" SortExpression="Deliver_Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Deliver_Email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Deliver_Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="איש קשר בחרום" SortExpression="Emrg_Contact_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Emrg_Contact_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Emrg_Contact_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="טלפון איש קשר בחרום" SortExpression="Emrg_Contact_Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Emrg_Contact_Phone") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("Emrg_Contact_Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="קרבה איש קשר בחרום" SortExpression="Emrg_Contact_Reletive">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Emrg_Contact_Reletive") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("Emrg_Contact_Reletive") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
