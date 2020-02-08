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
    public partial class AddProduct : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["auctionConn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string uid = null;
            string cid = null;
            if (FileUpload1.HasFile)
            {
                SqlConnection con = null;
                con = new SqlConnection(conn);
                #region get user id
                    SqlCommand cmd2 = new SqlCommand("Select uid from users where username=@user",con);
                    cmd2.Parameters.AddWithValue("@user",(string)Session["user"]);
                    con.Open();
                    SqlDataReader dr = cmd2.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            uid = dr[0].ToString();
                        }
                    }
                    con.Close();
                #endregion
                #region get category id
                    SqlCommand cmd3 = new SqlCommand("Select cid from categories where cname=@cname",con);
                    cmd3.Parameters.AddWithValue("@cname",ddlCategory.Text);
                    con.Open();
                    SqlDataReader dr2 = cmd3.ExecuteReader();
                    if (dr2.HasRows)
                    {
                        while (dr2.Read())
                        {
                            cid = dr2[0].ToString();
                        }
                    }
                    con.Close();
                #endregion
                try
                {
                    con = new SqlConnection(conn);
                    SqlCommand cmd = new SqlCommand("Insert into Products values(@uid,@cid,@pname,@pdesc,@pimage,@minBid,@atime,@bidEndtime,1)",con);
                    cmd.Parameters.AddWithValue("@uid", uid);
                    cmd.Parameters.AddWithValue("@cid", cid);
                    cmd.Parameters.AddWithValue("@pname", txtPName.Text);
                    cmd.Parameters.AddWithValue("@pdesc", txtPDesc.Text);
                    cmd.Parameters.AddWithValue("@pimage", FileUpload1.FileName);
                    cmd.Parameters.AddWithValue("@minBid", txtMinBid.Text);
                    cmd.Parameters.AddWithValue("@atime", txtATime.Text);
                    cmd.Parameters.AddWithValue("@bidEndtime", DateTime.Now.AddMinutes(Convert.ToInt32(txtATime.Text)));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    FileUpload1.SaveAs(Server.MapPath("~/Upload/") + FileUpload1.FileName);
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('You have successfully added product')", true);
                    txtPName.Text = txtPDesc.Text = txtMinBid.Text = txtATime.Text = "";
                    ddlCategory.SelectedIndex = 0;
                    con.Close();
                }
                catch (Exception e1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Error:"+e1.Message+"')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Image is required')", true);
            }
        }
    }
}
