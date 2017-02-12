using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivers_CRM.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        System.Timers.Timer t = new System.Timers.Timer();
        protected void Page_Load(object sender, EventArgs e)
        {
            t.Enabled = true;
            Clock();
            string fname = Request.QueryString["FullName"];
            lblUserName.Text = fname;
        }
        private void Clock()
        {
            DateTime dt = DateTime.Now;
            string datetimeformat = "dd/MM/yyyy HH:mm:ss";
            lblCurrentDateTime.Text = dt.ToString(datetimeformat);
        }
        protected void TimerClock_Tick(object sender, EventArgs e)
        {
            
            int counter = 0;
            if (counter >= 1)
            {
                t.Enabled = false;
            }
            else
            {
                //do something here
                Clock();
                counter++;
            }
        }
    }
}