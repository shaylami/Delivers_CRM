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
        <asp:Button ID="BtnFullListCustomers" runat="server" Text="רשימת כל הלקוחות" OnClick="BtnFullListCustomers_Click" />&nbsp&nbsp&nbsp
        <asp:Button ID="BtnAddNewCustomer" runat="server" Text="הוסף לקוח חדש" OnClick="BtnAddNewCustomer_Click" />
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
    </div>
    <div id="DivSearch">
      <asp:Label ID="lblBussinesSerach" runat="server" Text="חפש עסק : "></asp:Label>  <asp:TextBox ID="tbSearchBussines" Width="300px" runat="server"></asp:TextBox><asp:Button ID="BtnSearchBussines" runat="server" Text="חפש עכשיו" OnClick="BtnSearchBussines_Click" />
    </div>
    <div id="DivSearchResult" style="width: 50%; float: right;">
        <input type="hidden" runat="server" id="lng" value="" />
        <input type="hidden" runat="server" id="lat" value="" />
        <asp:DetailsView ID="DVSearchResult" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSourceSearchResult" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                <asp:TemplateField HeaderText="Bussines_Name" SortExpression="Bussines_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Bussines_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Bussines_Name") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Bussines_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Phone" SortExpression="Bussines_Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Bussines_Phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Bussines_Phone") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Bussines_Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Mobile" SortExpression="Bussines_Mobile">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Bussines_Mobile") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Bussines_Mobile") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Bussines_Mobile") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Fax" SortExpression="Bussines_Fax">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Bussines_Fax") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Bussines_Fax") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Bussines_Fax") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Address" SortExpression="Bussines_Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Bussines_Address") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Bussines_Address") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCustomerAddress" runat="server" Text='<%# Bind("Bussines_Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Owner" SortExpression="Bussines_Owner">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Bussines_Owner") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Bussines_Owner") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Bussines_Owner") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Ownre_Mobile" SortExpression="Bussines_Ownre_Mobile">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Bussines_Ownre_Mobile") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Bussines_Ownre_Mobile") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Bussines_Ownre_Mobile") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_WorkingHouers" SortExpression="Bussines_WorkingHouers">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Bussines_WorkingHouers") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Bussines_WorkingHouers") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Bussines_WorkingHouers") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_Type" SortExpression="Bussines_Type">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Bussines_Type") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Bussines_Type") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Bussines_Type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_LogoName" SortExpression="Bussines_LogoName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Bussines_LogoName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Bussines_LogoName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Bussines_LogoName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_LogoType" SortExpression="Bussines_LogoType">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Bussines_LogoType") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Bussines_LogoType") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Bussines_LogoType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bussines_CustomerAddDate" SortExpression="Bussines_CustomerAddDate">
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
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>
    <div id="map_populate" runat="server" style="width: 45%; height: 300px; float: left; border: 5px solid #5E5454;"></div>>
        <script id="GoogleMap">
            var long = null
            var lat = null
            lat = document.getElementById("MainContent_lat").value;
            long = document.getElementById("MainContent_lng").value;
            
            function initMap()
            {

                if ((lat != "" && long != "") || (lat== null && long == null))
                {
                    GetMap();
                }
                else
                {
                    return false;               
                }
            }
            function GetMap()
            {
                //var uluru = { lat: 34.01, lng: 32.09 };
                var uluru = { lat: parseFloat(lat), lng: parseFloat(long) };
                var map = new google.maps.Map(document.getElementById("MainContent_map_populate"), { zoom: 16, center: uluru });
                var marker = new google.maps.Marker({ position: uluru, map: map });
            }
        </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDKS3wLu6L5f5LztAn65PQtPIHXY0O9xt4&callback=initMap"></script>
    <%--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script--%>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:SqlDataSource ID="SqlDataSourceSearchResult" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Bussines_Customers] WHERE [ID] = @original_ID AND (([Bussines_Name] = @original_Bussines_Name) OR ([Bussines_Name] IS NULL AND @original_Bussines_Name IS NULL)) AND (([Bussines_Phone] = @original_Bussines_Phone) OR ([Bussines_Phone] IS NULL AND @original_Bussines_Phone IS NULL)) AND (([Bussines_Mobile] = @original_Bussines_Mobile) OR ([Bussines_Mobile] IS NULL AND @original_Bussines_Mobile IS NULL)) AND (([Bussines_Fax] = @original_Bussines_Fax) OR ([Bussines_Fax] IS NULL AND @original_Bussines_Fax IS NULL)) AND (([Bussines_Address] = @original_Bussines_Address) OR ([Bussines_Address] IS NULL AND @original_Bussines_Address IS NULL)) AND (([Bussines_Owner] = @original_Bussines_Owner) OR ([Bussines_Owner] IS NULL AND @original_Bussines_Owner IS NULL)) AND (([Bussines_Ownre_Mobile] = @original_Bussines_Ownre_Mobile) OR ([Bussines_Ownre_Mobile] IS NULL AND @original_Bussines_Ownre_Mobile IS NULL)) AND (([Bussines_WorkingHouers] = @original_Bussines_WorkingHouers) OR ([Bussines_WorkingHouers] IS NULL AND @original_Bussines_WorkingHouers IS NULL)) AND (([Bussines_Type] = @original_Bussines_Type) OR ([Bussines_Type] IS NULL AND @original_Bussines_Type IS NULL)) AND (([Bussines_LogoName] = @original_Bussines_LogoName) OR ([Bussines_LogoName] IS NULL AND @original_Bussines_LogoName IS NULL)) AND (([Bussines_LogoType] = @original_Bussines_LogoType) OR ([Bussines_LogoType] IS NULL AND @original_Bussines_LogoType IS NULL)) AND (([Bussines_LogoData] = @original_Bussines_LogoData) OR ([Bussines_LogoData] IS NULL AND @original_Bussines_LogoData IS NULL)) AND (([Bussines_CustomerAddDate] = @original_Bussines_CustomerAddDate) OR ([Bussines_CustomerAddDate] IS NULL AND @original_Bussines_CustomerAddDate IS NULL))" InsertCommand="INSERT INTO [Bussines_Customers] ([Bussines_Name], [Bussines_Phone], [Bussines_Mobile], [Bussines_Fax], [Bussines_Address], [Bussines_Owner], [Bussines_Ownre_Mobile], [Bussines_WorkingHouers], [Bussines_Type], [Bussines_LogoName], [Bussines_LogoType], [Bussines_LogoData], [Bussines_CustomerAddDate]) VALUES (@Bussines_Name, @Bussines_Phone, @Bussines_Mobile, @Bussines_Fax, @Bussines_Address, @Bussines_Owner, @Bussines_Ownre_Mobile, @Bussines_WorkingHouers, @Bussines_Type, @Bussines_LogoName, @Bussines_LogoType, @Bussines_LogoData, @Bussines_CustomerAddDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Bussines_Customers] WHERE ([Bussines_Name] LIKE '%' + @Bussines_Name + '%')" UpdateCommand="UPDATE [Bussines_Customers] SET [Bussines_Name] = @Bussines_Name, [Bussines_Phone] = @Bussines_Phone, [Bussines_Mobile] = @Bussines_Mobile, [Bussines_Fax] = @Bussines_Fax, [Bussines_Address] = @Bussines_Address, [Bussines_Owner] = @Bussines_Owner, [Bussines_Ownre_Mobile] = @Bussines_Ownre_Mobile, [Bussines_WorkingHouers] = @Bussines_WorkingHouers, [Bussines_Type] = @Bussines_Type, [Bussines_LogoName] = @Bussines_LogoName, [Bussines_LogoType] = @Bussines_LogoType, [Bussines_LogoData] = @Bussines_LogoData, [Bussines_CustomerAddDate] = @Bussines_CustomerAddDate WHERE [ID] = @original_ID AND (([Bussines_Name] = @original_Bussines_Name) OR ([Bussines_Name] IS NULL AND @original_Bussines_Name IS NULL)) AND (([Bussines_Phone] = @original_Bussines_Phone) OR ([Bussines_Phone] IS NULL AND @original_Bussines_Phone IS NULL)) AND (([Bussines_Mobile] = @original_Bussines_Mobile) OR ([Bussines_Mobile] IS NULL AND @original_Bussines_Mobile IS NULL)) AND (([Bussines_Fax] = @original_Bussines_Fax) OR ([Bussines_Fax] IS NULL AND @original_Bussines_Fax IS NULL)) AND (([Bussines_Address] = @original_Bussines_Address) OR ([Bussines_Address] IS NULL AND @original_Bussines_Address IS NULL)) AND (([Bussines_Owner] = @original_Bussines_Owner) OR ([Bussines_Owner] IS NULL AND @original_Bussines_Owner IS NULL)) AND (([Bussines_Ownre_Mobile] = @original_Bussines_Ownre_Mobile) OR ([Bussines_Ownre_Mobile] IS NULL AND @original_Bussines_Ownre_Mobile IS NULL)) AND (([Bussines_WorkingHouers] = @original_Bussines_WorkingHouers) OR ([Bussines_WorkingHouers] IS NULL AND @original_Bussines_WorkingHouers IS NULL)) AND (([Bussines_Type] = @original_Bussines_Type) OR ([Bussines_Type] IS NULL AND @original_Bussines_Type IS NULL)) AND (([Bussines_LogoName] = @original_Bussines_LogoName) OR ([Bussines_LogoName] IS NULL AND @original_Bussines_LogoName IS NULL)) AND (([Bussines_LogoType] = @original_Bussines_LogoType) OR ([Bussines_LogoType] IS NULL AND @original_Bussines_LogoType IS NULL)) AND (([Bussines_LogoData] = @original_Bussines_LogoData) OR ([Bussines_LogoData] IS NULL AND @original_Bussines_LogoData IS NULL)) AND (([Bussines_CustomerAddDate] = @original_Bussines_CustomerAddDate) OR ([Bussines_CustomerAddDate] IS NULL AND @original_Bussines_CustomerAddDate IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int64" />
                <asp:Parameter Name="original_Bussines_Name" Type="String" />
                <asp:Parameter Name="original_Bussines_Phone" Type="String" />
                <asp:Parameter Name="original_Bussines_Mobile" Type="String" />
                <asp:Parameter Name="original_Bussines_Fax" Type="String" />
                <asp:Parameter Name="original_Bussines_Address" Type="String" />
                <asp:Parameter Name="original_Bussines_Owner" Type="String" />
                <asp:Parameter Name="original_Bussines_Ownre_Mobile" Type="String" />
                <asp:Parameter Name="original_Bussines_WorkingHouers" Type="String" />
                <asp:Parameter Name="original_Bussines_Type" Type="String" />
                <asp:Parameter Name="original_Bussines_LogoName" Type="String" />
                <asp:Parameter Name="original_Bussines_LogoType" Type="String" />
                <asp:Parameter Name="original_Bussines_LogoData" Type="Object" />
                <asp:Parameter Name="original_Bussines_CustomerAddDate" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Bussines_Name" Type="String" />
                <asp:Parameter Name="Bussines_Phone" Type="String" />
                <asp:Parameter Name="Bussines_Mobile" Type="String" />
                <asp:Parameter Name="Bussines_Fax" Type="String" />
                <asp:Parameter Name="Bussines_Address" Type="String" />
                <asp:Parameter Name="Bussines_Owner" Type="String" />
                <asp:Parameter Name="Bussines_Ownre_Mobile" Type="String" />
                <asp:Parameter Name="Bussines_WorkingHouers" Type="String" />
                <asp:Parameter Name="Bussines_Type" Type="String" />
                <asp:Parameter Name="Bussines_LogoName" Type="String" />
                <asp:Parameter Name="Bussines_LogoType" Type="String" />
                <asp:Parameter Name="Bussines_LogoData" Type="Object" />
                <asp:Parameter Name="Bussines_CustomerAddDate" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="tbSearchBussines" Name="Bussines_Name" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Bussines_Name" Type="String" />
                <asp:Parameter Name="Bussines_Phone" Type="String" />
                <asp:Parameter Name="Bussines_Mobile" Type="String" />
                <asp:Parameter Name="Bussines_Fax" Type="String" />
                <asp:Parameter Name="Bussines_Address" Type="String" />
                <asp:Parameter Name="Bussines_Owner" Type="String" />
                <asp:Parameter Name="Bussines_Ownre_Mobile" Type="String" />
                <asp:Parameter Name="Bussines_WorkingHouers" Type="String" />
                <asp:Parameter Name="Bussines_Type" Type="String" />
                <asp:Parameter Name="Bussines_LogoName" Type="String" />
                <asp:Parameter Name="Bussines_LogoType" Type="String" />
                <asp:Parameter Name="Bussines_LogoData" Type="Object" />
                <asp:Parameter Name="Bussines_CustomerAddDate" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int64" />
                <asp:Parameter Name="original_Bussines_Name" Type="String" />
                <asp:Parameter Name="original_Bussines_Phone" Type="String" />
                <asp:Parameter Name="original_Bussines_Mobile" Type="String" />
                <asp:Parameter Name="original_Bussines_Fax" Type="String" />
                <asp:Parameter Name="original_Bussines_Address" Type="String" />
                <asp:Parameter Name="original_Bussines_Owner" Type="String" />
                <asp:Parameter Name="original_Bussines_Ownre_Mobile" Type="String" />
                <asp:Parameter Name="original_Bussines_WorkingHouers" Type="String" />
                <asp:Parameter Name="original_Bussines_Type" Type="String" />
                <asp:Parameter Name="original_Bussines_LogoName" Type="String" />
                <asp:Parameter Name="original_Bussines_LogoType" Type="String" />
                <asp:Parameter Name="original_Bussines_LogoData" Type="Object" />
                <asp:Parameter Name="original_Bussines_CustomerAddDate" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
