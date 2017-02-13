using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace Delivers_CRM
{
    /// <summary>
    /// Summary description for Pdfhandler
    /// </summary>
    public class Pdfhandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            SqlConnection connection;
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
            int id = int.Parse(context.Request.QueryString["Id"]);
            byte[] bytes;
            string fileName, contentType;
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * FROM Motor_Bike WHERE Bike_Id = @Bike_Id"; 
                    cmd.Parameters.AddWithValue("@Bike_Id", id);
                    cmd.Connection = connection;
                    connection.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Car_License_Data"];
                        contentType = sdr["Car_License_Type"].ToString();
                        fileName = sdr["Car_License_Name"].ToString();
                    }
                    connection.Close();
                }
            }

            context.Response.Buffer = true;
            context.Response.Charset = "";
            if (context.Request.QueryString["download"] == "1")
            {
                context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            }
            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            context.Response.ContentType = "application/pdf";
            context.Response.BinaryWrite(bytes);
            context.Response.Flush();
            context.Response.End();
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}