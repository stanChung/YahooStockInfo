using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestHAP
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DataAccess.GetYahooStockInfo("2002");
        }

        /// <summary>
        /// 取得網站的url
        /// </summary>
        /// <returns></returns>
        protected string appURL()
        {
            var strURL = "http://" + Request.Url.Host + ":" + Request.Url.Port +
                (Request.ApplicationPath.EndsWith("/") ? string.Empty : Request.ApplicationPath);
            return strURL;

        }
    }
}