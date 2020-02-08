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
    public partial class _Default : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["auctionConn"].ConnectionString;
        string adminEmail = ConfigurationSettings.AppSettings["adminEmail"];
        string adminPass = ConfigurationSettings.AppSettings["adminEmail"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["msg"] == "logout")
                {
                    Session["user"] = null;
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('You are logged out')", true);
                }
            }

            #region Send mail after bid ends
            //To send mail after end time to highest bidder
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select pid from products where pvalid=1 and bidEndtime<@now", con);
            cmd.Parameters.AddWithValue("@now", DateTime.Now);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            string[] pids = new string[60];
            int i = 0;
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    pids[i] = dr[0].ToString();
                    i++;
                }
            }
            con.Close();
            foreach (string pid in pids)
            {
                if (pid != null)
                {
                    string buyuid = null, buyuser = null, bidamount = null, selluser = null, selluid = null, pname = null, sellemail = null, buyemail = null;
                    SqlCommand cmd2 = new SqlCommand("Select top 1 buyuser,bidamount,username,pname,email,u.uid from selling s join products p on s.pid=p.pid join users u on p.uid=u.uid where p.pid=@pid order by bidamount desc", con);
                    cmd2.Parameters.AddWithValue("@pid", pid);
                    con.Open();
                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    if (dr2.HasRows)
                    {
                        while (dr2.Read())
                        {
                            buyuid = dr2[0].ToString();
                            bidamount = dr2[1].ToString();
                            selluser = dr2[2].ToString();
                            pname = dr2[3].ToString();
                            sellemail = dr2[4].ToString();
                            selluid = dr2[5].ToString();
                        }
                    }
                    else
                    {
                        con.Close();
                        SqlCommand cmd3 = new SqlCommand("Select username,pname,email,u.uid from users u join products p on u.uid=p.uid where p.pid='" + pid + "'", con);
                        con.Open();
                        SqlDataReader dr3 = cmd3.ExecuteReader();
                        if (dr3.HasRows)
                        {
                            while (dr3.Read())
                            {
                                selluser = dr3[0].ToString();
                                pname = dr3[1].ToString();
                                sellemail = dr3[2].ToString();
                                selluid = dr3[3].ToString();

                                MailMessage mail = new MailMessage();
                                mail.IsBodyHtml = true;
                                mail.From = new MailAddress(adminEmail, "Admin,BestBid.com");
                                mail.To.Add(adminEmail);

                                //mail.To.Add(sellemail); //Actual Email Id to be sent
                                mail.Subject = "Bid end in BestBid.com";
                                mail.Body = "Dear " + selluser + ", <br/><br/> Thank you for placing product to bid with BestBid.com.<br> Your bid has ended and there were no bidders for your product " + pname + ". Bid status has been set to closed.<br/><br/>Thanks,<br/>Admin,BestBid.com";

                                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                                smtp.EnableSsl = true;
                                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                                smtp.Credentials = new NetworkCredential(adminEmail, adminPass);
                                smtp.Timeout = 20000;
                                //ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
                                smtp.Send(mail);
                            }
                        }
                    }
                    con.Close();
                    if (buyuid != null)
                    {
                        SqlCommand cmd4 = new SqlCommand("Select email,username from users where uid=@buyuid", con);
                        cmd4.Parameters.AddWithValue("@buyuid", buyuid);
                        con.Open();
                        SqlDataReader dr4 = cmd4.ExecuteReader();
                        if (dr4.HasRows)
                        {
                            while (dr4.Read())
                            {
                                buyemail = dr4[0].ToString();
                                buyuser = dr4[1].ToString();

                                //Send mail to sell user
                                MailMessage mail = new MailMessage();
                                mail.IsBodyHtml = true;
                                mail.From = new MailAddress(adminEmail, "Admin,BestBid.com");
                                mail.To.Add(adminEmail);

                                //mail.To.Add(sellemail); //Actual Email Id to be sent
                                mail.Subject = "Bid end in BestBid.com";
                                mail.Body = "Dear " + selluser + ", <br/><br/> Thank you for placing product to bid with BestBid.com.<br> Your bid has ended and highest bidder for your product " + pname + " is " + buyuser + ", his/her email id is " + buyemail + ", with bidamount Rs." + bidamount + ". Bid status has been set to closed.<br/><br/>Thanks,<br/>Admin,BestBid.com";

                                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                                smtp.EnableSsl = true;
                                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                                smtp.Credentials = new NetworkCredential(adminEmail, adminPass);
                                smtp.Timeout = 20000;
                                //ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
                                smtp.Send(mail);

                                //Send mail to buy user
                                MailMessage mail2 = new MailMessage();
                                mail2.IsBodyHtml = true;
                                mail2.From = new MailAddress(adminEmail, "Admin,BestBid.com");
                                mail2.To.Add(adminEmail);

                                //mail.To.Add(buyemail); //Actual Email Id to be sent
                                mail2.Subject = "Bid end in BestBid.com";
                                mail2.Body = "Dear " + buyuser + ", <br/><br/> Thank you for bidding with BestBid.com.<br> Your bid for product " + pname + " has been won and product was placed by " + selluser + ", his/her email id is " + buyemail + ", with bidamount Rs." + bidamount + ".<br/><br/>Thanks,<br/>Admin,BestBid.com";

                                SmtpClient smtp2 = new SmtpClient("smtp.gmail.com", 587);
                                smtp2.EnableSsl = true;
                                smtp2.DeliveryMethod = SmtpDeliveryMethod.Network;
                                smtp2.Credentials = new NetworkCredential(adminEmail, adminPass);
                                smtp2.Timeout = 20000;
                                //ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
                                smtp2.Send(mail2);
                            }
                        }
                    }
                    con.Close();
                    SqlCommand cmd5 = new SqlCommand("Insert into Bidsorder values(@pid,@buyuser,@selluser,@bidamount,@date)", con);
                    cmd5.Parameters.AddWithValue("@pid", pid);
                    cmd5.Parameters.AddWithValue("@selluser", selluid);
                    cmd5.Parameters.AddWithValue("@date", DateTime.Now);
                    if (buyuser != null)
                    {
                        cmd5.Parameters.AddWithValue("@buyuser", selluid);
                        cmd5.Parameters.AddWithValue("@bidamount", bidamount);
                    }
                    else
                    {
                        cmd5.Parameters.AddWithValue("@buyuser", 1);
                        cmd5.Parameters.AddWithValue("@bidamount", 0);
                    }
                    con.Open();
                    cmd5.ExecuteNonQuery();
                    con.Close();

                    SqlCommand cmd6 = new SqlCommand("Update products set pvalid=0 where pid='" + pid + "'", con);
                    con.Open();
                    cmd6.ExecuteNonQuery();
                    con.Close();
                }
            }
            #endregion
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select rid from users where username=@user and password=@pass and uvalid=1",con);
                cmd.Parameters.AddWithValue("@user",txtUsername.Text);
                cmd.Parameters.AddWithValue("@pass", txtPassword.Text);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["user"] = txtUsername.Text;
                        if (dr[0].ToString() == "1")
                        {
                            Session["role"] = "1";
                            con.Close();
                            Response.Redirect("Home.aspx");
                        }
                        else if (dr[0].ToString() == "2")
                        {
                            Session["role"] = "2";
                            con.Close();
                            Response.Redirect("Home.aspx");
                        }
                    }
                }
                else
                {
                    con.Close();
                    ScriptManager.RegisterStartupScript(this,GetType(),"alert","alert('Invalid username/password or you are not verified')",true);
                }
            }
            catch (Exception e1)
            {
                con.Close();
                ScriptManager.RegisterStartupScript(this,GetType(),"alert","alert('Error:"+e1.Message+"')",true);
            }
        }
    }
}
