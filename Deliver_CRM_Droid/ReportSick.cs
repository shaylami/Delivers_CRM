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
using Android.Telephony;
using Plugin.Geolocator;

namespace Deliver_CRM_Droid
{
    [Activity(Label = "דווח מחלה")]
    public class ReportSick : Activity
    {
        string lat = "";
        string lng = "";
        string Mobile, date;
        DigitalClock _time;
        TextView _date, _mobile,_reportSick;
        Button _ReportSick,_Back2WHPage;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.ReportSick);
            // Create your application here

            GetMobileNumber();
            GetDateTime();
            GetCurrentLocation();
            GetreportSick();
            _time = (DigitalClock)FindViewById(Resource.Id.CurrentTime);
            _ReportSick = (Button)FindViewById(Resource.Id.btnReportSick);
            _ReportSick.Click += (o, e) => { SetReportSick(); };
            _Back2WHPage = (Button)FindViewById(Resource.Id.btnBack2WHPage);
            _Back2WHPage.Click += (o, e) => { ReturnWhPage(); };


        }
        private void GetreportSick()
        {
            string b = "";
            _reportSick = FindViewById<TextView>(Resource.Id.SickReport);
            _ReportSick = (Button)FindViewById(Resource.Id.btnReportSick);
            WebService.DeliverCRMWebService ws = new WebService.DeliverCRMWebService();
            b = ws.GetReportSickWH(_mobile.Text, _date.Text);
            if (string.IsNullOrEmpty(b) || (b == "-1"))
            {
                _reportSick.Text = "לא דווח מחלה";
            }
            else
            {
                _reportSick.Text = "דווח יום : " + b;
                _ReportSick.Visibility = Android.Views.ViewStates.Invisible;
            }
        }
        /// <summary>
        /// when vutten reportin clicked data will send to web service for insert to the DB
        /// </summary>
        private void SetReportSick()
        {

            try
            {
                string value, _reportAbsence = "מחלה";
                WebService.DeliverCRMWebService ws = new WebService.DeliverCRMWebService();
                value = ws.SetReportSickWH(_mobile.Text, _date.Text,"08:00","17:00", _reportAbsence, lng, lat);
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
        /// <summary>
        /// return curreent location based on lat lng from gps device
        /// </summary>
        private async void GetCurrentLocation()
        {
            try
            {
                var locator = CrossGeolocator.Current;
                locator.DesiredAccuracy = 100; //100 is new default
                var position = await locator.GetPositionAsync(timeoutMilliseconds: 10000);
                lat = position.Longitude.ToString();
                lng = position.Latitude.ToString();
            }
            catch(Exception ex)
            {
                ex.ToString();
            }
        }

    }
}