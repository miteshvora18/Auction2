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
    public partial class AdminFeedback : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["auctionConn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select username,subject,description,fdate from users u join feedback f on u.uid=f.uid order by fdate desc",con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                gvFeedback.DataSource = dr;
                gvFeedback.DataBind();
                con.Close();
            }
        }
    }
}
