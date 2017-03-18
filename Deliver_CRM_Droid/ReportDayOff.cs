using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Plugin.Geolocator;
using Android.Telephony;

namespace Deliver_CRM_Droid
{
    [Activity(Label = "דווח יום חופש")]
    public class ReportDayOff : Activity
    {
        string lat = "";
        string lng = "";
        string Mobile, date;
        DigitalClock _time;
        TextView _date, _mobile, _reportDayOff;
        Button _ReportDayOff, _Back2WHPage;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.ReportDayOff);
            // Create your application here

            GetMobileNumber();
            GetDateTime();
            GetreportDayOff();
            _time = (DigitalClock)FindViewById(Resource.Id.CurrentTime);
            _ReportDayOff = (Button)FindViewById(Resource.Id.btnReportDayOff);
            _ReportDayOff.Click += (o, e) => { SetReportSick(); };
            _Back2WHPage = (Button)FindViewById(Resource.Id.btnBack2WHPage);
            _Back2WHPage.Click += (o, e) => { ReturnWhPage(); };
        }
        private void GetreportDayOff()
        {
            string b = "";
            _reportDayOff = FindViewById<TextView>(Resource.Id.DayOffReport);
            _ReportDayOff = (Button)FindViewById(Resource.Id.btnReportDayOff);
            WebService.DeliverCRMWebService ws = new WebService.DeliverCRMWebService();
            b = ws.GetReportDayOffWH(_mobile.Text, _date.Text);
            if (string.IsNullOrEmpty(b) || (b == "-1"))
            {
                _reportDayOff.Text = "לא דווח חופש";
            }
            else
            {
                _reportDayOff.Text = "דווח יום : " + b;
                _ReportDayOff.Visibility = Android.Views.ViewStates.Invisible;
            }
        }
        /// <summary>
        /// when vutten reportin clicked data will send to web service for insert to the DB
        /// </summary>
        private void SetReportSick()
        {

            try
            {
                string value, _reportAbsence = "חופש";
                WebService.DeliverCRMWebService ws = new WebService.DeliverCRMWebService();
                value = ws.SetReportDayOffWH(_mobile.Text, _date.Text, "08:00", "17:00", _reportAbsence, lng, lat);
                Toast.MakeText(this, "data send to server", ToastLength.Short).Show();
                ReturnWhPage();
            }
            catch (Exception ex)
            {
                string okexerr = ex.ToString();
            }

        }
        private void ReturnWhPage()
        {
            var intent = new Intent(this, typeof(WH));
            StartActivity(intent);
            Finish();
        }
        private void GetMobileNumber()
        {
            TelephonyManager tm = (TelephonyManager)GetSystemService(Android.Content.Context.TelephonyService);
            Mobile = tm.Line1Number.ToString();
            string replacenumbers = Mobile;
            replacenumbers = Mobile.Replace("+972", "0");
            string dash = "-";
            Mobile = replacenumbers.Insert(3, dash);
            _mobile = FindViewById<TextView>(Resource.Id.Mobile);
            _mobile.Text = Mobile;
        }
        /// <summary>
        /// Get current today date & time to text view
        /// </summary>
        private void GetDateTime()
        {
            try
            {
                date = Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy"));
                _date = FindViewById<TextView>(Resource.Id.TodayDate);
                _date.Text = date;
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }
    }
}