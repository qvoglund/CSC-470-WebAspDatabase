using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSC_470_WebAspDatabase
{
    public partial class frmSize : System.Web.UI.Page
    {
        HttpCookie cookieSize = new HttpCookie("cookieSize");
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSmall_Click(object sender, EventArgs e)
        {
            cookieSize.Value = "SML";
            close();
        }

        protected void btnMedium_Click(object sender, EventArgs e)
        {
            cookieSize.Value = "MED";
            close();
        }

        protected void btnLarge_Click(object sender, EventArgs e)
        {
            cookieSize.Value = "LRG";
            close();
        }

        private void close()
        {
            cookieSize.Expires.Add(new TimeSpan(0, 1, 0));
            Response.Cookies.Add(cookieSize);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "close",
                "<script language=javascript>window.opener.location.href=\"Default.aspx\";window.close();</script>");
        }
    }
}