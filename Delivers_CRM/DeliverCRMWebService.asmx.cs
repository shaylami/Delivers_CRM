using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.Entity;

namespace Delivers_CRM
{
    /// <summary>
    /// Summary description for DeliverCRMWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class DeliverCRMWebService : System.Web.Services.WebService
    {
        SqlConnection connection;
        SqlCommand cmd;
        Weeles_100_DBEntities wde = new Weeles_100_DBEntities();
        [WebMethod]
        public string GetDeliverMobile(string _mobile)
        {
            string query = "", Error = "";
            try
            {

                query = wde.Login_Users.First(x => x.Mobile == _mobile).Mobile;
                return query;
            }
            catch (Exception ex)
            {
                Error = "-1";
                return Error;
            }

        }
        [WebMethod]
        public string GetReportInWH(string _mobile,string _date)
        {
            string result, error,xml;
            string a = _mobile;
            string b = _date;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                connection.Open();
                cmd = new SqlCommand("SELECT Mobile,Date,ReportIn,ReportOut FROM Deliver_WH WHERE Mobile ='" + _mobile + "' AND Date='" + _date + "'", connection);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                connection.Close();
                xml = ds.GetXml();
                result = ds.Tables[0].Rows[0]["ReportIn"].ToString();
                return result;
            }
            catch (Exception ex)
            {
                ex.ToString();
                connection.Close();
                return error = "-1";
            }
        }
        [WebMethod]
        public string GetReportOutWH(string _mobile, string _date)
        {
            string result, error, xml;
            string a = _mobile;
            string b = _date;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                connection.Open();
                cmd = new SqlCommand("SELECT Mobile,Date,ReportIn,ReportOut FROM Deliver_WH WHERE Mobile ='" + _mobile + "' AND Date='" + _date + "'", connection);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                connection.Close();
                xml = ds.GetXml();
                result = ds.Tables[0].Rows[0]["ReportOut"].ToString();
                return result;
            }
            catch (Exception ex)
            {
                ex.ToString();
                connection.Close();
                return error = "-1";
            }
        }
        [WebMethod]
        public string SetReportWH(string _mobile, string _date, string _reportIn, string _reportOut, string _lng, string _lat)
        {
            string error,result;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                using (cmd = new SqlCommand("INSERT INTO Deliver_WH (Mobile,Date,ReportIn,ReportOut,Lng,Lat) VALUES (@Mobile,@Date,@ReportIn,@ReportOut,@Lng,@Lat)",connection))
                {
                    cmd.Parameters.AddWithValue("@Mobile", _mobile);
                    cmd.Parameters.AddWithValue("@Date", _date);
                    cmd.Parameters.AddWithValue("@ReportIn", _reportIn);
                    cmd.Parameters.AddWithValue("@ReportOut", _reportOut);
                    cmd.Parameters.AddWithValue("@Lng", _lng);
                    cmd.Parameters.AddWithValue("@Lat", _lat);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
                return result = "0";
            }
            catch(Exception ex)
            {
                connection.Close();
                ex.ToString();
                return error = "-1";
            }


        }
    }
}
                


                //error = "-1";
                //return error;

        //public string ReportWHIn(string ReportIn)
        //{
        //    string query = "", Error = "";
        //    try
        //    {
                

        //    }
        //    catch
        //    {

        //    }
        //}
        //public DataSet login(string _mobile)
        //{
        //    connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
        //    SqlDataAdapter da = new SqlDataAdapter("SELECT Deliver_Mobile FROM Deliver_Person WHERE Deliver_Mobile = '" + _mobile+"'", connection);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    return ds;
        //}
