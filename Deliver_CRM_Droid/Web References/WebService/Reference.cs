﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.42000.
// 
#pragma warning disable 1591

namespace Deliver_CRM_Droid.WebService {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1586.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="DeliverCRMWebServiceSoap", Namespace="http://tempuri.org/")]
    public partial class DeliverCRMWebService : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback GetDeliverMobileOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetReportInWHOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetReportOutWHOperationCompleted;
        
        private System.Threading.SendOrPostCallback SetReportWHOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public DeliverCRMWebService() {
            this.Url = "http://soft.solveit.co.il:8081/delivercrmwebservice.asmx";
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event GetDeliverMobileCompletedEventHandler GetDeliverMobileCompleted;
        
        /// <remarks/>
        public event GetReportInWHCompletedEventHandler GetReportInWHCompleted;
        
        /// <remarks/>
        public event GetReportOutWHCompletedEventHandler GetReportOutWHCompleted;
        
        /// <remarks/>
        public event SetReportWHCompletedEventHandler SetReportWHCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetDeliverMobile", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string GetDeliverMobile(string _mobile) {
            object[] results = this.Invoke("GetDeliverMobile", new object[] {
                        _mobile});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void GetDeliverMobileAsync(string _mobile) {
            this.GetDeliverMobileAsync(_mobile, null);
        }
        
        /// <remarks/>
        public void GetDeliverMobileAsync(string _mobile, object userState) {
            if ((this.GetDeliverMobileOperationCompleted == null)) {
                this.GetDeliverMobileOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetDeliverMobileOperationCompleted);
            }
            this.InvokeAsync("GetDeliverMobile", new object[] {
                        _mobile}, this.GetDeliverMobileOperationCompleted, userState);
        }
        
        private void OnGetDeliverMobileOperationCompleted(object arg) {
            if ((this.GetDeliverMobileCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetDeliverMobileCompleted(this, new GetDeliverMobileCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetReportInWH", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string GetReportInWH(string _mobile, string _date) {
            object[] results = this.Invoke("GetReportInWH", new object[] {
                        _mobile,
                        _date});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void GetReportInWHAsync(string _mobile, string _date) {
            this.GetReportInWHAsync(_mobile, _date, null);
        }
        
        /// <remarks/>
        public void GetReportInWHAsync(string _mobile, string _date, object userState) {
            if ((this.GetReportInWHOperationCompleted == null)) {
                this.GetReportInWHOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetReportInWHOperationCompleted);
            }
            this.InvokeAsync("GetReportInWH", new object[] {
                        _mobile,
                        _date}, this.GetReportInWHOperationCompleted, userState);
        }
        
        private void OnGetReportInWHOperationCompleted(object arg) {
            if ((this.GetReportInWHCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetReportInWHCompleted(this, new GetReportInWHCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetReportOutWH", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string GetReportOutWH(string _mobile, string _date) {
            object[] results = this.Invoke("GetReportOutWH", new object[] {
                        _mobile,
                        _date});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void GetReportOutWHAsync(string _mobile, string _date) {
            this.GetReportOutWHAsync(_mobile, _date, null);
        }
        
        /// <remarks/>
        public void GetReportOutWHAsync(string _mobile, string _date, object userState) {
            if ((this.GetReportOutWHOperationCompleted == null)) {
                this.GetReportOutWHOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetReportOutWHOperationCompleted);
            }
            this.InvokeAsync("GetReportOutWH", new object[] {
                        _mobile,
                        _date}, this.GetReportOutWHOperationCompleted, userState);
        }
        
        private void OnGetReportOutWHOperationCompleted(object arg) {
            if ((this.GetReportOutWHCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetReportOutWHCompleted(this, new GetReportOutWHCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SetReportWH", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string SetReportWH(string _mobile, string _date, string _reportIn, string _reportOut, string _lng, string _lat) {
            object[] results = this.Invoke("SetReportWH", new object[] {
                        _mobile,
                        _date,
                        _reportIn,
                        _reportOut,
                        _lng,
                        _lat});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void SetReportWHAsync(string _mobile, string _date, string _reportIn, string _reportOut, string _lng, string _lat) {
            this.SetReportWHAsync(_mobile, _date, _reportIn, _reportOut, _lng, _lat, null);
        }
        
        /// <remarks/>
        public void SetReportWHAsync(string _mobile, string _date, string _reportIn, string _reportOut, string _lng, string _lat, object userState) {
            if ((this.SetReportWHOperationCompleted == null)) {
                this.SetReportWHOperationCompleted = new System.Threading.SendOrPostCallback(this.OnSetReportWHOperationCompleted);
            }
            this.InvokeAsync("SetReportWH", new object[] {
                        _mobile,
                        _date,
                        _reportIn,
                        _reportOut,
                        _lng,
                        _lat}, this.SetReportWHOperationCompleted, userState);
        }
        
        private void OnSetReportWHOperationCompleted(object arg) {
            if ((this.SetReportWHCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.SetReportWHCompleted(this, new SetReportWHCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1586.0")]
    public delegate void GetDeliverMobileCompletedEventHandler(object sender, GetDeliverMobileCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1586.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetDeliverMobileCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetDeliverMobileCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1586.0")]
    public delegate void GetReportInWHCompletedEventHandler(object sender, GetReportInWHCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1586.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetReportInWHCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetReportInWHCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1586.0")]
    public delegate void GetReportOutWHCompletedEventHandler(object sender, GetReportOutWHCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1586.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetReportOutWHCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetReportOutWHCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1586.0")]
    public delegate void SetReportWHCompletedEventHandler(object sender, SetReportWHCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1586.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class SetReportWHCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal SetReportWHCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591