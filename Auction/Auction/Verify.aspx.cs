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
    public partial class Verify : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["auctionConn"].ConnectionString;
        
        public string uid
        {
            get
            {
                if (Request.QueryString["uid"] != null)
                {
                    return Request.QueryString["uid"];
                }
                else
                    return "0";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (uid != "0")
                {
                    lblVerify.Visible = true;
                    SqlConnection con = null;
                    try
                    {
                        con = new SqlConnection(conn);
                        SqlCommand cmd = new SqlCommand("Update users set uvalid=1 where uid="+uid,con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    catch (Exception e1)
                    {
                        con.Close();
                        ScriptManager.RegisterStartupScript(this,GetType(),"alert","alert('Error:"+e1.Message+"')",true);
                        lblVerify.Visible = false;
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }
    }
}
