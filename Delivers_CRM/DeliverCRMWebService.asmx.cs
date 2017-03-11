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
        //SqlConnection connection;
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
            catch(Exception ex)
            {
                Error = "-1";
                return Error;
            }
            
        }

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
    }
}
