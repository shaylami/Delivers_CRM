using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Delivers_CRM.Pages
{
    public partial class Business : System.Web.UI.Page
    {
        SqlConnection connection;
        System.Timers.Timer t = new System.Timers.Timer();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            DVAddNewCustomer.Visible = false;
            t.Enabled = true;
            Clock();
            lblUserName.Text = "שלום : " + Application["FullName"].ToString();
            map_populate.Visible = false;
        }
        private void DBCon()
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
        }
        private void Clock()
        {
            DateTime dt = DateTime.Now;
            string datetimeformat = "dd/MM/yyyy HH:mm:ss";
            lblCurrentDateTime.Text = dt.ToString(datetimeformat);
        }

        protected void DVAddNewCustomer_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            try
            {
                byte[] bytes;
                string Bussines_Name, Bussines_Phone, Bussines_Mobile, Bussines_Fax, Bussines_Address, Bussines_Owner, Bussines_Ownre_Mobile, Bussines_WorkingHouers, Bussines_Type, Bussines_LogoName, Bussines_LogoType, Bussines_LogoData, Bussines_CustomerAddDate;
                TextBox _Bussines_Name = DVAddNewCustomer.FindControl("TBBussines_Name") as TextBox;
                TextBox _Bussines_Phone = DVAddNewCustomer.FindControl("TBBussines_Phone") as TextBox;
                TextBox _Bussines_Mobile = DVAddNewCustomer.FindControl("TBBussines_Mobile") as TextBox;
                TextBox _Bussines_Fax = DVAddNewCustomer.FindControl("TBBussines_Fax") as TextBox;
                TextBox _Bussines_Address = DVAddNewCustomer.FindControl("TBBussines_Address") as TextBox;
                TextBox _Bussines_Owner = DVAddNewCustomer.FindControl("TBBussines_Owner") as TextBox;
                TextBox _Bussines_Ownre_Mobile = DVAddNewCustomer.FindControl("TBBussines_Owner_Mobile") as TextBox;
                TextBox _Bussines_WorkingHouers = DVAddNewCustomer.FindControl("TBBussines_WorkingHouers") as TextBox;
                TextBox _Bussines_Type = DVAddNewCustomer.FindControl("TBBussines_Type") as TextBox;
                FileUpload _FULogo = DVAddNewCustomer.FindControl("FP_Logo") as FileUpload;

                Bussines_LogoName = System.IO.Path.GetFileName(_FULogo.PostedFile.FileName);
                Bussines_LogoType = _FULogo.PostedFile.ContentType;
                Bussines_Name = _Bussines_Name.Text.ToString();
                Bussines_Phone = _Bussines_Phone.Text.ToString();
                Bussines_Mobile = _Bussines_Mobile.Text.ToString();
                Bussines_Fax = _Bussines_Fax.Text.ToString();
                Bussines_Address = _Bussines_Address.Text.ToString();
                Bussines_Owner = _Bussines_Owner.Text.ToString();
                Bussines_Ownre_Mobile = _Bussines_Ownre_Mobile.Text.ToString();
                Bussines_WorkingHouers = _Bussines_WorkingHouers.Text.ToString();
                Bussines_Type = _Bussines_Type.Text.ToString();
                Bussines_CustomerAddDate = lblCurrentDateTime.Text;
                using (Stream fs = _FULogo.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        bytes = br.ReadBytes((Int32)fs.Length);
                    }
                }
                DBCon();
                string query = "INSERT INTO Bussines_Customers(Bussines_Name,Bussines_Phone,Bussines_Mobile,Bussines_Fax,Bussines_Address,Bussines_Owner,Bussines_Ownre_Mobile,Bussines_WorkingHouers,Bussines_LogoName,Bussines_Type,Bussines_LogoType,Bussines_LogoData,Bussines_CustomerAddDate) VALUES (@Bussines_Name,@Bussines_Phone,@Bussines_Mobile,@Bussines_Fax,@Bussines_Address,@Bussines_Owner,@Bussines_Ownre_Mobile,@Bussines_WorkingHouers,@Bussines_Type,@Bussines_LogoName,@Bussines_LogoType,@Bussines_LogoData,@Bussines_CustomerAddDate)";
                using (cmd = new SqlCommand(query))
                {
                    cmd.Connection = connection;
                    cmd.Parameters.AddWithValue("@Bussines_Name", Bussines_Name);
                    cmd.Parameters.AddWithValue("@Bussines_Phone", Bussines_Phone);
                    cmd.Parameters.AddWithValue("@Bussines_Mobile", Bussines_Mobile);
                    cmd.Parameters.AddWithValue("@Bussines_Fax", Bussines_Fax);
                    cmd.Parameters.AddWithValue("@Bussines_Address", Bussines_Address);
                    cmd.Parameters.AddWithValue("@Bussines_Owner", Bussines_Owner);
                    cmd.Parameters.AddWithValue("@Bussines_Ownre_Mobile", Bussines_Ownre_Mobile);
                    cmd.Parameters.AddWithValue("@Bussines_WorkingHouers", Bussines_WorkingHouers);
                    cmd.Parameters.AddWithValue("@Bussines_Type", Bussines_Type);
                    cmd.Parameters.AddWithValue("@Bussines_LogoName", Bussines_LogoName);
                    cmd.Parameters.AddWithValue("@Bussines_LogoType", Bussines_LogoType);
                    cmd.Parameters.AddWithValue("@Bussines_LogoData", bytes);
                    cmd.Parameters.AddWithValue("@Bussines_CustomerAddDate", Bussines_CustomerAddDate);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
                Response.Write("<script>alert('Data inserted successfully')</script>");
            }
            catch (Exception ex)
            {
                string exeption = ex.ToString();
                Response.Write("<script>alert(" + exeption + ")</script>");
            }

        }

        protected void DVAddNewCustomer_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            DVAddNewCustomer.Visible = false;
            Response.Write("<script>alert('הפעולה בוטלה !!')</script>");
            //GVCustomers.Visible = true;
            //GVCustomers.DataBind();
        }

        protected void BtnFullListCustomers_Click(object sender, EventArgs e)
        {
            DVAddNewCustomer.Visible = false;
            DivSearch.Visible = true;
            tbSearchBussines.Text = string.Empty;
        }

        protected void BtnAddNewCustomer_Click(object sender, EventArgs e)
        {
            DVAddNewCustomer.Visible = true;
            DivSearch.Visible = false;
            DivSearchResult.Visible = false;
        }

        public void MapValue()
        {
            string address = "";
            string add = "", lo = "", lt = "";
            //Label _Bussines_Address = DVSearchResult.FindControl("lblCustomerAddress") as Label;
            DVSearchResult.DataBind();
            //address = _Bussines_Address.Text.ToString();
            for (int i = 0; i < DVSearchResult.Rows.Count; i++)
            {
                Label _Bussines_Address = (Label)DVSearchResult.Rows[i].FindControl("lblCustomerAddress");
                address = _Bussines_Address.Text.ToString();
                if (string.IsNullOrEmpty(address))
                {
                    return;
                }
            }
            if(address == "")
            {
                map_populate.Visible = false;
                Response.Write("<script>alert('אין מידע תואם לנתונים שחיפשת !!!!')</script>");
                return;
            }

            string url = "http://maps.google.com/maps/api/geocode/xml?address=" + address + "&sensor=false";
            WebRequest request = WebRequest.Create(url);

            using (WebResponse response = (HttpWebResponse)request.GetResponse())
            {
                using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                {
                    DataSet dsResult = new DataSet();
                    dsResult.ReadXml(reader);
                    DataTable dtCoordinates = new DataTable();
                    dtCoordinates.Columns.AddRange(new DataColumn[4] { new DataColumn("Id", typeof(int)), new DataColumn("Address", typeof(string)), new DataColumn("Latitude", typeof(string)), new DataColumn("Longitude", typeof(string)) });
                    foreach (DataRow row in dsResult.Tables["result"].Rows)
                    {
                        string geometry_id = dsResult.Tables["geometry"].Select("result_id = " + row["result_id"].ToString())[0]["geometry_id"].ToString();
                        DataRow location = dsResult.Tables["location"].Select("geometry_id = " + geometry_id)[0];
                        dtCoordinates.Rows.Add(row["result_id"], row["formatted_address"], location["lat"], location["lng"]);
                        add = row[1].ToString();
                        lo = location[0].ToString();
                        lt = location[1].ToString();
                        lng.Value = lo;
                        lat.Value = lt;
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "GoogleMap", "initMap", true);
                    }

                }
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "GoogleMap", "initMap("+add+")", true);
                //string jsFunc = "getmap(" + add + ")";
                //string jsFunc = "getmap()";
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ss", jsFunc, true);

                //DBCon();
                //string _Add=null, _lo=null, _lt=null;
                //string select = "SELECT * FROM GIS_Data";
                //connection.Open();
                //cmd = new SqlCommand(select, connection);
                //dataReader = cmd.ExecuteReader();
                //if (dataReader.Read())
                //{
                //    _Add = (string)dataReader["Address"];
                //    _lt = (string)dataReader["Latitude"];
                //    _lo = (string)dataReader["Longitude"];
                //}
                //dataReader.Close();
                //connection.Close();
                //if((string.IsNullOrEmpty(_Add)) && (string.IsNullOrEmpty(_lt)) && (string.IsNullOrEmpty(_lo)))
                //{
                //    string query = "INSERT INTO GIS_Data(Address,Latitude,Longitude) VALUES (@Address,@Latitude,@Longitude)";
                //    using (cmd = new SqlCommand(query))
                //    {
                //        cmd.Connection = connection;
                //        cmd.Parameters.AddWithValue("@Address", add);
                //        cmd.Parameters.AddWithValue("@Latitude", lt);
                //        cmd.Parameters.AddWithValue("@Longitude", lo);
                //        connection.Open();
                //        cmd.ExecuteNonQuery();
                //        connection.Close();

                //    }
                //}

            }
        }

        protected void BtnSearchBussines_Click(object sender, EventArgs e)
        {
            map_populate.Visible = true;
            MapValue();
        }
    }
}