using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CSC_470_WebAspDatabase
{
    public partial class Default : System.Web.UI.Page
    {
        static SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Administrator" +
            "\\source\\repos\\CSC-470-WebAspDatabase\\CSC-470-WebAspDatabase\\comboDB.mdf;Integrated Security=True;Connect Timeout=30");
        SqlCommand cmd = new SqlCommand();

        String query;
        String size;
        String combo_num;
        
        int id = 0;
        double total = 0;
        double TAX = 0.097;

        HttpCookie idNum = new HttpCookie("idNum");
        HttpCookie lineItems = new HttpCookie("lineItems");
        HttpCookie subTotal = new HttpCookie("subTotal");
        HttpCookie origDue = new HttpCookie("origDue");
        HttpCookie due = new HttpCookie("due");

        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (Request.Cookies["idNum"] != null && Request.Cookies["comboNum"] != null && Request.Cookies["cookieSize"] != null)
            {
                size = Request.Cookies["cookieSize"].Value;
                combo_num = Request.Cookies["comboNum"].Value;
                id = Convert.ToInt16(Request.Cookies["idNum"].Value);
                checkInventory(combo_num, size);

                Response.Cookies["cookieSize"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["comboNum"].Expires = DateTime.Now.AddDays(-1);
            } else
            {
                newSale();
            }
        }

        public void newSale()
        {
            if (Request.Cookies["idNum"] == null)
            {
                query = "INSERT INTO sales (total) VALUES (0)";
                cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                query = "SELECT MAX(Id) FROM SALES";
                cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                id = Convert.ToInt32(reader[0].ToString());
                conn.Close();

                idNum.Value = Convert.ToString(id);
                idNum.Expires.Add(new TimeSpan(0, 1, 0));
                Response.Cookies.Add(idNum);
                System.Diagnostics.Debug.WriteLine("id: " + id);


                tbxLineItems.Text = "";
            }

        }

        protected void btnCombo1_Click(object sender, ImageClickEventArgs e) { addItems("1"); }
        protected void btnCombo2_Click(object sender, ImageClickEventArgs e) { addItems("2"); }
        protected void btnCombo3_Click(object sender, ImageClickEventArgs e) { addItems("3"); }
        protected void btnCombo4_Click(object sender, ImageClickEventArgs e) { addItems("4"); }
        protected void btnCombo5_Click(object sender, ImageClickEventArgs e) { addItems("6"); }
        protected void btnCombo6_Click(object sender, ImageClickEventArgs e) { addItems("5"); }
    
        private void addItems(String combo)
        {
            HttpCookie comboNum = new HttpCookie("comboNum");

            comboNum.Value = combo;
            comboNum.Expires.Add(new TimeSpan(0, 1, 0));
            Response.Cookies.Add(comboNum);

            String newWin = "window.open('frmSize.aspx', 'popup_window', 'width=20,height=150,left=100,top=100,resizable=no');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", newWin, true); 
        }

        private void checkInventory(String combo, String size)
        {
            int combo_num = Convert.ToInt32(combo);

            if (combo_num <= 3)
            {
                inv_helper("SELECT inventory.size, item, sum(count) AS count, quantity FROM line_items JOIN inventory ON line_items.size = inventory.size" +
                    " WHERE id = " + id + " AND item <> 'Fish' GROUP BY item, quantity, inventory.size", combo, size);
            }
            else if (combo_num == 4)
            {
                inv_helper("SELECT inventory.size, item, sum(count) AS count, quantity FROM line_items JOIN inventory ON line_items.size = inventory.size" +
                    " WHERE id = " + id + " AND item <> 'Burger' GROUP BY item, quantity, inventory.size", combo, size);
            }
            else if (combo_num == 5)
            {
                inv_helper("SELECT inventory.size, item, sum(count) AS count, quantity FROM line_items JOIN inventory ON line_items.size = inventory.size" +
                    " WHERE id = " + id + " AND item = 'French Fry' GROUP BY item, quantity, inventory.size", combo, size);
            }
            else
            {
                inv_helper("SELECT inventory.size, item, sum(count) AS count, quantity FROM line_items JOIN inventory ON line_items.size = inventory.size" +
                    " WHERE id = " + id + " AND item = 'Drink' GROUP BY item, quantity, inventory.size", combo, size);
            }


            updateLineText();
        }

        private void inv_helper(String query, String combo, String size)
        {
            //System.Diagnostics.Debug.WriteLine(query);
            SqlDataReader reader;
            cmd = new SqlCommand(query, conn);
            conn.Open();
            reader = cmd.ExecuteReader();

            int cmb = Convert.ToInt16(combo);
            if (true)//!reader.HasRows)
            {
                conn.Close();
                if(cmb <= 3)
                {
                    query = "SELECT * FROM inventory WHERE (size = '" + size + "' AND item = 'French Fry' OR item = 'Drink' AND size = '" + size + "') AND item <> 'Fish'";
                }
                else if (cmb == 4)
                {
                    query = "SELECT * FROM inventory WHERE (size = '" + size + "' AND item <> 'Burger')";
                }
                else if (cmb == 5)
                {
                    query = "SELECT * FROM inventory WHERE (size = '" + size + "' AND item = 'French Fry')";
                }
                else
                {
                    query = "SELECT * FROM inventory WHERE (size = '" + size + "' AND item = 'Drink')";
                }

                cmd.CommandText = query;
                conn.Open();
                reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    if (Convert.ToInt32(reader["quantity"]) < 1)
                    {
                        String inv = "Invalid number of " + reader["size"].ToString().Trim() + " " + reader["item"] + " in inventory.";
                        ClientScript.RegisterStartupScript(this.GetType(), "invalidInventoryAltert",
                            "alert('" + inv + "');", true);
                        /*****
                         * Insert a message box alerting that there isn't enough inventory
                         *****/
                        conn.Close();
                        return;
                    }
                }
            //} else
            //{
            //    System.Diagnostics.Debug.WriteLine(query);

            //    while (reader.Read())
            //    {
            //        if (reader.HasRows)
            //        {
            //            System.Diagnostics.Debug.WriteLine(reader["quantity"] + " " + reader["item"] + " " + reader["size"] + " " + Request.Cookies["cookieSize"].Value);
            //            if (Convert.ToInt32(reader["quantity"]) < Convert.ToInt32(reader["count"]))
            //            {
            //                /*****
            //                 * Insert a message box alerting invalid inventory
            //                 *****/
            //                //System.Diagnostics.Debug.WriteLine("Invalid number of " + reader["item"]);
            //                conn.Close();
            //                return;
            //            }
            //        }
            //    }
            }

            conn.Close();
            updateLineItems(combo, size);

        }

        private void updateLineItems(String combo, String size)
        {
            int count = 0;

            query = "SELECT count FROM line_items WHERE Id = " + id + " AND combo_num = '" + combo + "' AND size = '" + size + "'";
            cmd = new SqlCommand(query, conn);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                count = Convert.ToInt32(reader["count"].ToString());
                count++;
                query = "UPDATE line_items SET count = " + count + " WHERE id = " + id + " AND combo_num = '" + combo + "' AND size = '" + size + "'";
            }
            else
            {
                count = 1;
                query = "INSERT INTO line_items (id, combo_num, size, count) VALUES (" + id + ", '" + combo + "', '" + size + "', " + count + ")";
            }
            conn.Close();
            cmd = new SqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        private void updateLineText()
        {
            query = "SELECT * FROM combos, size_price, line_items WHERE combos.combo_num = line_items.combo_num AND size_price.combo_num = " +
                "combos.combo_num AND line_items.combo_num = size_price.combo_num AND size_price.size = line_items.size " +
                "AND line_items.Id = '" + id + "'";

            cmd = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            String menuItem = "";
             
            String price = "";
            String name = "";
            total = 0;

            int i = 0;
            while (reader.Read())
            {
                System.Diagnostics.Debug.WriteLine("READ: " + id);

                price = (Convert.ToDouble(reader["price"]) * Convert.ToDouble(reader["count"])).ToString("#.00");
                name = reader["name"].ToString();
                size = reader["size"].ToString().Trim();
                combo_num = reader["combo_num"].ToString();

                menuItem += "\r\n" + reader["count"].ToString().Trim() + " x (" + size + ") ";

                if (combo_num == "5" || combo_num == "6")
                {
                    menuItem += name + "\t\t\t$" + price + "\r\n";
                }
                else
                {
                    menuItem += "Combo #" + combo_num + "\t\t\t\t$" + price +
                            "\r\n-" + name + "\r\n-" + size + " fries\r\n-" + size + " coke\r\n";
                }
                //System.Diagnostics.Debug.WriteLine(menuItem);

                lineItems.Value = Convert.ToString(menuItem);
                lineItems.Expires.Add(new TimeSpan(0, 1, 0));
                Response.Cookies.Add(lineItems);

                tbxLineItems.Text = menuItem;
                total += Convert.ToDouble(price);
                i++;
            }
            conn.Close();

            txtTotal.Text = Math.Round(total * TAX, 2).ToString("C") + "\r\n" + Math.Round(total + total * TAX, 2).ToString("C");
            subTotal.Value = (Math.Round(total + total * TAX, 2, MidpointRounding.ToEven)).ToString("N2");
            subTotal.Expires.Add(new TimeSpan(0, 1, 0));
            Response.Cookies.Add(subTotal);
            origDue.Value = (Math.Round(total + total * TAX, 2, MidpointRounding.ToEven)).ToString("N2");
            origDue.Expires.Add(new TimeSpan(0, 1, 0));
            Response.Cookies.Add(origDue);
            due.Value = origDue.Value;
            due.Expires.Add(new TimeSpan(0, 1, 0));
            Response.Cookies.Add(due);
        }

        protected void btnCheckout_Click(object sender, ImageClickEventArgs e)
        {
            String newWin = "window.open('checkout.aspx', 'popup_window', 'width=450,height=400,left=100,top=100,resizable=no');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", newWin, true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String newWin = "window.open('updateInventory.aspx', 'popup_window', 'width=600,height=400,left=100,top=100,resizable=no');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", newWin, true);
        }
    }
}