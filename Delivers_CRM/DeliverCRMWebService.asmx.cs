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
        public string SetConnectionIsAlive(string _date,string _time,string _mobile,string _connectionType, string _isAlive)
        {
            string error, result;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                using (cmd = new SqlCommand("INSERT INTO ConnectionStatus (Date,Time,Mobile,ConnectionType,IsAlive) VALUES (@Date,@Time,@Mobile,@ConnectionType,@IsAlive)", connection))
                {
                    cmd.Parameters.AddWithValue("@Date", _date);
                    cmd.Parameters.AddWithValue("@Time", _time);
                    cmd.Parameters.AddWithValue("@Mobile", _mobile);
                    cmd.Parameters.AddWithValue("@ConnectionType", _connectionType);
                    cmd.Parameters.AddWithValue("@IsAlive", _isAlive);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
                return result = _isAlive;
            }
            catch (Exception ex)
            {
                connection.Close();
                ex.ToString();
                return error = "-1";
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
        public string GetReportWH(string _mobile, string _date)
        {
            string result, error, xml;
            string a = _mobile;
            string b = _date;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                connection.Open();
                cmd = new SqlCommand("SELECT Mobile,Date,ReportIn,ReportOut,ReportAbsence,Lng,Lat FROM Deliver_WH WHERE Mobile ='" + _mobile + "' AND Date='" + _date + "'", connection);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                connection.Close();
                xml = ds.GetXml();
                result = xml;
                //result = ds.Tables[0].Rows[0]["ReportIn"].ToString();
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
        public string GetReportOutWH(string _mobile, string _date,string _reportAbsence)
        {
            string result, error, xml;
            string a = _mobile;
            string b = _date;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                connection.Open();
                cmd = new SqlCommand("SELECT * FROM Deliver_WH WHERE Mobile ='" + _mobile + "' AND Date='" + _date + "'", connection);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                connection.Close();
                xml = ds.GetXml();
                result = ds.Tables[0].Rows[1]["ReportOut"].ToString();
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
        public string GetReportSickWH(string _mobile, string _date)
        {
            string result, error, xml;
            string a = _mobile;
            string b = _date;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                connection.Open();
                cmd = new SqlCommand("SELECT Mobile,Date,ReportAbsence FROM Deliver_WH WHERE Mobile ='" + _mobile + "' AND Date='" + _date + "'", connection);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                connection.Close();
                xml = ds.GetXml();
                result = ds.Tables[0].Rows[0]["ReportAbsence"].ToString();
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
        public string GetReportDayOffWH(string _mobile, string _date)
        {
            string result, error, xml;
            string a = _mobile;
            string b = _date;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                connection.Open();
                cmd = new SqlCommand("SELECT Mobile,Date,ReportAbsence FROM Deliver_WH WHERE Mobile ='" + _mobile + "' AND Date='" + _date + "'", connection);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                connection.Close();
                xml = ds.GetXml();
                result = ds.Tables[0].Rows[0]["ReportAbsence"].ToString();
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
        public string SetReportInWH(string _mobile, string _date, string _reportIn,string _reportAbsence, string _lng, string _lat)
        {
            string error,result;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                using (cmd = new SqlCommand("INSERT INTO Deliver_WH (Mobile,Date,ReportIn,ReportAbsence,Lng,Lat) VALUES (@Mobile,@Date,@ReportIn,@ReportAbsence,@Lng,@Lat)", connection))
                {
                    cmd.Parameters.AddWithValue("@Mobile", _mobile);
                    cmd.Parameters.AddWithValue("@Date", _date);
                    cmd.Parameters.AddWithValue("@ReportIn", _reportIn);
                    cmd.Parameters.AddWithValue("@ReportAbsence", _reportAbsence);
                    cmd.Parameters.AddWithValue("@Lng", _lng);
                    cmd.Parameters.AddWithValue("@Lat", _lat);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
                return result = _reportIn; ;
            }
            catch(Exception ex)
            {
                connection.Close();
                ex.ToString();
                return error = "-1";
            }
        }
        [WebMethod]
        public string SetReportOutWH(string _mobile, string _date, string _reportOut, string _reportAbsence, string _lng, string _lat)
        {
            string error, result;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                using (cmd = new SqlCommand("INSERT INTO Deliver_WH (Mobile,Date,ReportOut,ReportAbsence,Lng,Lat) VALUES (@Mobile,@Date,@ReportOut,@ReportAbsence,@Lng,@Lat)", connection))
                {
                    cmd.Parameters.AddWithValue("@Mobile", _mobile);
                    cmd.Parameters.AddWithValue("@Date", _date);
                    cmd.Parameters.AddWithValue("@ReportOut", _reportOut);
                    cmd.Parameters.AddWithValue("@ReportAbsence", _reportAbsence);
                    cmd.Parameters.AddWithValue("@Lng", _lng);
                    cmd.Parameters.AddWithValue("@Lat", _lat);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
                return result = _reportOut; ;
            }
            catch (Exception ex)
            {
                connection.Close();
                ex.ToString();
                return error = ex.ToString();
            }
        }
        [WebMethod]
        public string SetReportSickWH(string _mobile, string _date, string _reportIn, string _reportOut, string _reportAbsence, string _lng, string _lat)
        {
            string error, result;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                using (cmd = new SqlCommand("INSERT INTO Deliver_WH (Mobile,Date,ReportIn,ReportOut,ReportAbsence,Lng,Lat) VALUES (@Mobile,@Date,@ReportIn,@ReportOut,@ReportAbsence,@Lng,@Lat)", connection))
                {
                    cmd.Parameters.AddWithValue("@Mobile", _mobile);
                    cmd.Parameters.AddWithValue("@Date", _date);
                    cmd.Parameters.AddWithValue("@ReportIn", _reportIn);
                    cmd.Parameters.AddWithValue("@ReportOut", _reportOut);
                    cmd.Parameters.AddWithValue("@ReportAbsence", _reportAbsence);
                    cmd.Parameters.AddWithValue("@Lng", _lng);
                    cmd.Parameters.AddWithValue("@Lat", _lat);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
                return result = _reportAbsence; ;
            }
            catch (Exception ex)
            {
                connection.Close();
                ex.ToString();
                return error = ex.ToString();
            }
        }
        [WebMethod]
        public string SetReportDayOffWH(string _mobile, string _date, string _reportIn, string _reportOut, string _reportAbsence, string _lng, string _lat)
        {
            string error, result;
            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
                using (cmd = new SqlCommand("INSERT INTO Deliver_WH (Mobile,Date,ReportIn,ReportOut,ReportAbsence,Lng,Lat) VALUES (@Mobile,@Date,@ReportIn,@ReportOut,@ReportAbsence,@Lng,@Lat)", connection))
                {
                    cmd.Parameters.AddWithValue("@Mobile", _mobile);
                    cmd.Parameters.AddWithValue("@Date", _date);
                    cmd.Parameters.AddWithValue("@ReportIn", _reportIn);
                    cmd.Parameters.AddWithValue("@ReportOut", _reportOut);
                    cmd.Parameters.AddWithValue("@ReportAbsence", _reportAbsence);
                    cmd.Parameters.AddWithValue("@Lng", _lng);
                    cmd.Parameters.AddWithValue("@Lat", _lat);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
                return result = _reportAbsence; ;
            }
            catch (Exception ex)
            {
                connection.Close();
                ex.ToString();
                return error = ex.ToString();
            }
        }
    }
}
                
