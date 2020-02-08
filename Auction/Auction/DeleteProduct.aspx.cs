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
    public partial class DeleteProduct : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["auctionConn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(conn);

                string uid = null;
                if (Session["user"] != null)
                {
                    SqlCommand cmd2 = new SqlCommand("Select uid from users where username=@user",con);
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
                }
                con.Close();

                SqlCommand cmd = null;
                if((string)Session["role"]=="2")
                {
                    cmd = new SqlCommand("Select pid,cname,pname,pdesc,pimage,minBid,atime,bidEndtime,pvalid from products p join categories c on p.cid=c.cid where pvalid=1 and uid='"+uid+"'", con);
                }
                if ((string)Session["role"] == "1")
                {
                    cmd = new SqlCommand("Select pid,cname,pname,pdesc,pimage,minBid,atime,bidEndtime,pvalid from products p join categories c on p.cid=c.cid where pvalid=1", con);
                }
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                gvProducts.DataSource = dr;
                gvProducts.DataBind();
                con.Close();
            }
        }

        protected void gvProducts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string imgUrl = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "pimage"));
                System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)e.Row.FindControl("imgProduct");
                img.ImageUrl = "~/Upload/" + imgUrl;
            }
        }

        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                var id = Convert.ToInt32(e.CommandArgument);
                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Update products set pvalid=0 where pid='"+id+"'",con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //var id = Convert.ToInt32(e.RowIndex);
            //SqlConnection con = new SqlConnection(conn);
            //SqlCommand cmd = new SqlCommand("Update products set pvalid=0 where pid='" + id + "'", con);
            //con.Open();
            //cmd.ExecuteNonQuery();
            //con.Close();
            ScriptManager.RegisterStartupScript(this,GetType(),"alert","alert('Product deleted successfully')",true);
            gvProducts.DataBind();
        }
    }
}
