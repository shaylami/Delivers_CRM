﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivers_CRM.Pages
{
    public partial class transportation : System.Web.UI.Page
    {
        System.Timers.Timer t = new System.Timers.Timer();
        protected void Page_Load(object sender, EventArgs e)
        {
            t.Enabled = true;
            Clock();
            string fname = Request.QueryString["FullName"];
            lblUserName.Text = Application["FullName"].ToString();
        }
        private void Clock()
        {
            DateTime dt = DateTime.Now;
            string datetimeformat = "dd/MM/yyyy HH:mm:ss";
            lblCurrentDateTime.Text = dt.ToString(datetimeformat);
        }

        protected void AddNewBike_Click(object sender, EventArgs e)
        {
            DVAddBike.Visible = true;
            GVAllBikes.Visible = false;
        }

        protected void ViewAllBikes_Click(object sender, EventArgs e)
        {
            DVAddBike.Visible = false;
            GVAllBikes.Visible = true;
        }

        protected void DVAddBike_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            string filePath = DVAddBike.Fields..PostedFile.FileName;          // getting the file path of uploaded file
            string filename1 = Path.GetFileName(filePath);               // getting the file name of uploaded file
            string ext = Path.GetExtension(filename1);                      // getting the file extension of uploaded file
            string type = String.Empty;
        }
    }
}