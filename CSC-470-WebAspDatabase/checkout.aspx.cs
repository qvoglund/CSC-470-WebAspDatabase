﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace CSC_470_WebAspDatabase.Imgs
{
    public partial class checkout : System.Web.UI.Page
    {
        Default dflt = new Default();
        double orig_due;
        String query;
        static SqlConnection conn = new SqlConnection("Data Source=470AQVOGL22019;Initial Catalog=test;Persist Security Info=True;User ID=sa;Password=p@ssw0rd");
        SqlCommand cmd = new SqlCommand();
        int id;
        HttpCookie subTotal;
        HttpCookie due;

        protected void Page_Load(object sender, EventArgs e)
        {
            due = Request.Cookies["due"];
            subTotal = Request.Cookies["subTotal"];
            id = Convert.ToInt16(Request.Cookies["idNum"].Value);
            txtDue.Text = Request.Cookies["subTotal"].Value;
            orig_due = Convert.ToDouble(Request.Cookies["origDue"].Value);
        }

        private Boolean dec_count(String text)
        {
            if (text.Contains("."))
            {
                String[] splitTxt = text.Split('.');
                if(splitTxt[1].Length == 2)
                {
                    return false;
                }
            }
            else if (text.Equals("0"))
            {
                txtInput.Text = "";
            }
            return true;
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            if (dec_count(txtInput.Text)) { txtInput.Text += "1"; }
        }

        protected void btn2_Click(object sender, EventArgs e)
        {
           if (dec_count(txtInput.Text)) { txtInput.Text += "2"; }
        }

        protected void btn3_Click(object sender, EventArgs e)
        {
            if (dec_count(txtInput.Text)) { txtInput.Text += "3"; }
        }

        protected void btn4_Click(object sender, EventArgs e)
        {
            if (dec_count(txtInput.Text)) { txtInput.Text += "4"; }
        }

        protected void btn5_Click(object sender, EventArgs e)
        {
            if (dec_count(txtInput.Text)) { txtInput.Text += "5"; }
        }

        protected void btn6_Click(object sender, EventArgs e)
        {
            if (dec_count(txtInput.Text)) { txtInput.Text += "6"; }
        }

        protected void btn7_Click(object sender, EventArgs e)
        {
            if (dec_count(txtInput.Text)) { txtInput.Text += "7"; }
        }

        protected void btn8_Click(object sender, EventArgs e)
        {
            if (dec_count(txtInput.Text)) { txtInput.Text += "8"; }
        }

        protected void btn9_Click(object sender, EventArgs e)
        {
            if (dec_count(txtInput.Text)) { txtInput.Text += "9"; }
        }

        protected void btn0_Click(object sender, EventArgs e)
        {
            if (dec_count(txtInput.Text)) { txtInput.Text += "0"; }
        }

        protected void btnPeriod_Click(object sender, EventArgs e)
        {
            if (!txtInput.Text.Contains("."))
            {
                txtInput.Text += ".";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtInput.Text = "0";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            double input, due, paid;
            input = Convert.ToDouble(txtInput.Text);
            due = Convert.ToDouble(txtDue.Text);
            paid = Convert.ToDouble(txtPaid.Text);

            if (input > due && due > 0)
            {
                paid += Convert.ToDouble(txtInput.Text);
                txtPaid.Text = paid.ToString("N2");
                txtChange.Text = (paid - orig_due).ToString("N2");
                txtDue.Text = "0.00";
                this.due.Value = "0.00";
                subTotal.Value = "0.00";
            }
            else if (due > 0)
            {
                due -= input;
                txtPaid.Text = (Convert.ToDouble(txtPaid.Text) + input).ToString("N2");
                txtDue.Text = due.ToString("N2");
                subTotal.Value = due.ToString("N2");                
                this.due.Value = due.ToString("N2");
            }
            subTotal.Expires.Add(new TimeSpan(0, 1, 0));
            Response.Cookies.Add(subTotal);
            this.due.Expires.Add(new TimeSpan(0, 1, 0));
            Response.Cookies.Add(this.due);
            System.Diagnostics.Debug.WriteLine(this.due.Value);

            txtInput.Text = "0";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            close();
        }
        private void close()
        {
            subTotal.Value = Request.Cookies["origDue"].Value;
            Response.Cookies.Add(subTotal);

            Page.ClientScript.RegisterStartupScript(this.GetType(), "close",
                "<script language=javascript>window.close();</script>");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (due.Value == "0.00")
            {
                query = "UPDATE sales SET total = '" + orig_due + "', sale_complete = 1 WHERE id = " + id;

                cmd.Connection = conn;
                cmd.CommandText = query;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                update_inventory();

                Response.Cookies["idNum"].Expires = DateTime.Now.AddDays(-1);
                System.Diagnostics.Debug.WriteLine(Response.Cookies["idNum"].Value + " TEST");

                Page.ClientScript.RegisterStartupScript(this.GetType(), "close",
                "<script language=javascript>window.opener.location.href=\"Default.aspx\";window.close();</script>");
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("due.Value: " + due.Value);

                //DISPLAY AMOUNT DUE
            }
        }

        private void update_inventory()
        {
            query = "WITH counts AS (" +
                "SELECT burger * count AS burger_count, line_items.combo_num, line_items.size, count FROM\n " +
                "line_items RIGHT OUTER JOIN combos ON line_items.combo_num = combos.combo_num WHERE id = \n" + id +
                "GROUP BY burger, line_items.combo_num, line_items.size, line_items.count)\n" +
                "UPDATE inventory SET quantity = (SELECT quantity FROM inventory WHERE item = 'Burger' AND size = 'NA') \n" +
                "- (SELECT sum(counts.burger_count) FROM counts) WHERE(item = 'BURGER' AND size ='NA');\n" +
                "WITH counts AS(SELECT fish * count AS fish_count, line_items.combo_num, line_items.size, count FROM \n" +
                "line_items RIGHT OUTER JOIN combos ON line_items.combo_num = combos.combo_num WHERE id = " + id + "GROUP BY \n" +
                "fish, line_items.combo_num, line_items.size, line_items.count)\n" +
                "UPDATE inventory SET quantity = (SELECT quantity FROM inventory WHERE item = 'Fish' AND size = 'NA') \n" +
                "- (SELECT sum(counts.fish_count) FROM counts) WHERE (item = 'Fish' AND size = 'NA');\n";
            String[] sizes = { "SML", "MED", "LRG" };
            foreach (String item_size in sizes)
            {
                query += "WITH COUNTS AS(\n" +
                    "SELECT french_fry * count AS fry_count, drink * count AS drink_count, line_items.size FROM line_items \n" +
                    "RIGHT OUTER JOIN combos ON line_items.combo_num = combos.combo_num WHERE id = " + id + " GROUP BY french_fry, \n" +
                    "drink, line_items.combo_num, line_items.size, line_items.count)\n" +
                    "UPDATE inventory SET quantity = (SELECT quantity FROM inventory WHERE item = 'French Fry' AND size = '" + item_size + "') \n" +
                    "-(SELECT sum(counts.fry_count) FROM counts WHERE size = '" + item_size + "') WHERE size = '" + item_size + "' AND item = 'French Fry';\n";
                query += "WITH COUNTS AS(\n" +
                    "SELECT french_fry * count AS fry_count, drink * count AS drink_count, line_items.size FROM line_items \n" +
                    "RIGHT OUTER JOIN combos ON line_items.combo_num = combos.combo_num WHERE id = " + id + " GROUP BY french_fry, \n" +
                    "drink, line_items.combo_num, line_items.size, line_items.count)\n" +
                    "UPDATE inventory SET quantity = (SELECT quantity FROM inventory WHERE item = 'Drink' AND size = '" + item_size + "') \n" +
                    "-(SELECT sum(counts.drink_count) FROM counts WHERE size = '" + item_size + "') WHERE size = '" + item_size + "' AND item = 'Drink';\n";
            }
            cmd.Connection = conn;
            cmd.CommandText = query;
            conn.Open();

            try
            {
                cmd.ExecuteNonQuery();
            }catch (Exception e)
            {
            }
            conn.Close();
        }

    }
}