<%@ Page Title="" Language="C#" MasterPageFile="~/WebFormMaster.Master" AutoEventWireup="true" CodeBehind="Business.aspx.cs" Inherits="Delivers_CRM.Pages.Business" %>
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
    <div>
        <asp:Button ID="BtnFullListCustomers" runat="server" Text="רשימת כל הלקוחות" />&nbsp&nbsp&nbsp
        <asp:Button ID="BtnAddNewCustomer" runat="server" Text="הוסף לקוח חדש" />
        <br />
    </div>
    <div>
        <asp:DetailsView ID="DVAddNewCustomer" runat="server" Height="50px" Width="380px" AutoGenerateRows="False" DataKeyNames="ID" DefaultMode="Insert" OnItemInserting="DVAddNewCustomer_ItemInserting" OnModeChanging="DVAddNewCustomer_ModeChanging">
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:TemplateField HeaderText="Bussines_Name" SortExpression="Bussines_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Bussines_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBBussines_Name" runat="server" Text='<%# Bind("Bussines_Name") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Bussines_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Phone" SortExpression="Bussines_Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Bussines_Phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBBussines_Phone" runat="server" Text='<%# Bind("Bussines_Phone") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Bussines_Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Mobile" SortExpression="Bussines_Mobile">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Bussines_Mobile") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBBussines_Mobile" runat="server" Text='<%# Bind("Bussines_Mobile") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Bussines_Mobile") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Fax" SortExpression="Bussines_Fax">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Bussines_Fax") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBBussines_Fax" runat="server" Text='<%# Bind("Bussines_Fax") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Bussines_Fax") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Address" SortExpression="Bussines_Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Bussines_Address") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBBussines_Address" runat="server" Text='<%# Bind("Bussines_Address") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Bussines_Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Owner" SortExpression="Bussines_Owner">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Bussines_Owner") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBBussines_Owner" runat="server" Text='<%# Bind("Bussines_Owner") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Bussines_Owner") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Ownre_Mobile" SortExpression="Bussines_Ownre_Mobile">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Bussines_Ownre_Mobile") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBBussines_Owner_Mobile" runat="server" Text='<%# Bind("Bussines_Ownre_Mobile") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Bussines_Ownre_Mobile") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_WorkingHouers" SortExpression="Bussines_WorkingHouers">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Bussines_WorkingHouers") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBBussines_WorkingHouers" runat="server" Text='<%# Bind("Bussines_WorkingHouers") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Bussines_WorkingHouers") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Type" SortExpression="Bussines_Type">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Bussines_Type") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TBBussines_Type" runat="server" Text='<%# Bind("Bussines_Type") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Bussines_Type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_LogoName" SortExpression="Bussines_LogoName" InsertVisible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Bussines_LogoName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Bussines_LogoName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Bussines_LogoName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_LogoType" SortExpression="Bussines_LogoType" InsertVisible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Bussines_LogoType") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Bussines_LogoType") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Bussines_LogoType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Bussines_LogoData" SortExpression="Bussines_LogoData">
                    <EditItemTemplate>
                        <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="Bussines_LogoData" Mode="Edit" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:FileUpload ID="FP_Logo" runat="server" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DynamicControl ID="DynamiControl1" runat="server" DataField="Bussines_LogoData" Mode="ReadOnly" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_CustomerAddDate" SortExpression="Bussines_CustomerAddDate" InsertVisible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Bussines_CustomerAddDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Bussines_CustomerAddDate") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("Bussines_CustomerAddDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Bussines_Customers]"></asp:SqlDataSource>
    </div>
    <div></div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
