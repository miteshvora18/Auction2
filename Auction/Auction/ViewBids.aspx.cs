using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace Auction
{
    public partial class ViewBids : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["auctionConn"].ConnectionString;
        public string pid
        {
            get
            {
                if (Request.QueryString["pid"] != null)
                {
                    return Request.QueryString["pid"];
                }
                else
                {
                    return "0";
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HyperLink2.NavigateUrl = "~/ProductDetail.aspx?pid="+pid;

                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select s.pid,pname,username,bidAmount from selling s join users u on u.uid=s.buyUser join products p on p.pid=s.pid where s.pid='"+pid+"'",con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                gvAllBids.DataSource = dr;
                gvAllBids.DataBind();
            }
        }
    }
}
