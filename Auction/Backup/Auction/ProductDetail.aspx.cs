using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Auction
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["auctionConn"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sellUid = null;
                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select cname,pname,pdesc,pimage,minBid,bidEndTime,uid from products p join categories c on c.cid=p.cid where pid=@pid", con);
                cmd.Parameters.AddWithValue("@pid",Request.QueryString["pid"].ToString());
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblCategory.Text = dr[0].ToString();
                        lblPname.Text = dr[1].ToString();
                        lblPDesc.Text = dr[2].ToString();
                        imgProduct.ImageUrl = "~/Upload/"+dr[3].ToString();
                        lblMinBid.Text = dr[4].ToString();
                        lblBidEndTime.Text = dr[5].ToString();
                        sellUid = dr[6].ToString();
                    }
                }
                con.Close();

                string uid = null;
                SqlCommand cmd2 = new SqlCommand("Select uid from users where username=@user",con);
                cmd2.Parameters.AddWithValue("@user",(string)Session["user"]);
                con.Open();
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.HasRows)
                {
                    while (dr2.Read())
                    {
                        uid = dr2[0].ToString();
                        if (dr2[0].ToString() == sellUid)
                        {
                            lblAmount.Visible = false;
                            txtBidAmount.Visible = false;
                            btnSubmit.Visible = false;
                            note.Visible = false;
                        }
                    }
                }
                con.Close();

                hyViewBid.NavigateUrl = "~/ViewBids.aspx?pid="+Request.QueryString["pid"].ToString();

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(lblMinBid.Text.Remove(lblMinBid.Text.Length - 5, 5)) <= Convert.ToInt32(txtBidAmount.Text))
            {
                SqlConnection con = new SqlConnection(conn);

                string uid = null;
                SqlCommand cmd2 = new SqlCommand("Select uid from users where username=@user", con);
                cmd2.Parameters.AddWithValue("@user", (string)Session["user"]);
                con.Open();
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.HasRows)
                {
                    while (dr2.Read())
                    {
                        uid = dr2[0].ToString();
                    }
                }
                con.Close();

                SqlCommand cmd = new SqlCommand("Insert into selling values(@pid,1,@buyUser,@bidAmount)",con);
                cmd.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
                cmd.Parameters.AddWithValue("@buyUser", uid);
                cmd.Parameters.AddWithValue("@bidAmount",Convert.ToInt32(txtBidAmount.Text));
                con.Open();
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Your bid has been registered.')", true);
                con.Close();
                txtBidAmount.Text = "";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Bid amount is less than minimum bid')", true);
            }
        }
    }
}
