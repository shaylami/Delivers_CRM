using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

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

        [WebMethod]
        public DataSet login(string _mobile)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Deliver_Person WHERE Deliver_Mobile = '"+_mobile+"'", @"Server=soft.solveit.co.il,1433;Database=Weeles_100_DB;User ID=weeles100;Password=A123a123");
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}
