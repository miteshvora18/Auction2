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
using System.Net.Mail;
using System.Net;

namespace Auction
{
    public partial class Regsiter : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["auctionConn"].ConnectionString;
        string adminEmail = ConfigurationSettings.AppSettings["adminEmail"];
        string adminPass = ConfigurationSettings.AppSettings["adminEmail"];
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(conn);

                SqlCommand cmdCheck = new SqlCommand("Select username from users where username=@user",con);
                cmdCheck.Parameters.AddWithValue("@user",txtUsername.Text);
                con.Open();
                SqlDataReader dr2 = cmdCheck.ExecuteReader();
                if (dr2.HasRows)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Username exists..try different one')", true);
                    con.Close();
                }
                else
                {
                    con.Close();
                    SqlCommand cmd = new SqlCommand("Insert into users values(2,@username,@pass,@email,0)", con);
                    cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@pass", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    SqlCommand cmd2 = new SqlCommand("Select top 1 uid from users order by uid desc", con);
                    con.Open();
                    SqlDataReader dr = cmd2.ExecuteReader();
                    string uid = "";
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            uid = dr[0].ToString();
                        }
                    }
                    con.Close();
                    try
                    {
                        string root = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath; 
                        //Send Mail
                        MailMessage mail = new MailMessage();
                        mail.IsBodyHtml = true;
                        mail.From = new MailAddress(adminEmail, "Admin,BestBid.com");
                        mail.To.Add(adminEmail);

                        //mail.To.Add(txtEmail.Text); //Actual Email Id to be sent
                        mail.Subject = "Verify email on BestBid.com";
                        mail.Body = "Dear " + txtUsername.Text + ", <br/><br/> Thank you for registering with BestBid.com.<br> Click on link <a href='"+root+"Verify.aspx?uid=" + uid + "'>here</a> to verify email.<br/><br/>Thanks,<br/>Admin,BestBid.com";

                        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                        smtp.EnableSsl = true;
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                        smtp.Credentials = new NetworkCredential(adminEmail, adminPass);
                        smtp.Timeout = 20000;
                        //ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
                        smtp.Send(mail);
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Thank you for registering... check your e-mail and click on link to complete registration process..')", true);
                    }
                    catch (Exception e2)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Error:could not send email..contact admin')", true);
                    }
                }
                txtUsername.Text = txtEmail.Text="";
            }
            catch (Exception e1)
            {
                con.Close();
                ScriptManager.RegisterStartupScript(this,GetType(),"alert","alert('Error:"+e1.Message+"')",true);
            }
        }
    }
}
