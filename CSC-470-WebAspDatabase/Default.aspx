<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSC_470_WebAspDatabase.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form{
            overflow: auto;
            margin: 0 auto;
            white-space: nowrap;
        }
        textarea{
            resize:none;
        }
        .column1{
            width:525px;
            display:inline-block;
        }
        .column2{
            width:100px;
            display:inline-block;
        }
        .column3{
            width:45px;
            margin-top:350px;
            margin-left:225px;
            display:inline-block;
        }
    </style> 
</head>
<body>
    <form id="form1" runat="server">
        <div id="form">
        
        <div class="row">
            <div class="column1">

            
        <asp:ImageButton ID="btnCombo1" runat="server" BorderColor="Black" BorderStyle="Solid" Height="150px" ImageUrl="~/Imgs/h-mcdonalds-Big-Mac-Extra-Value-Meals.jpg" OnClick="btnCombo1_Click" Width="263px" />
&nbsp;<asp:ImageButton ID="btnCombo2" runat="server" BorderColor="Black" BorderStyle="Solid" Height="150px" ImageUrl="~/Imgs/h-mcdonalds-2-Cheeseburger-Extra-Value-Meals.jpg" Width="263px" OnClick="btnCombo2_Click" />
        <br />
        <asp:ImageButton ID="btnCombo3" runat="server" BorderColor="Black" BorderStyle="Solid" Height="150px" ImageUrl="~/Imgs/h-mcdonalds-Quarter-Pounder-with-Cheese-Extra-Value-Meals.jpg" OnClick="btnCombo3_Click" />
&nbsp;<asp:ImageButton ID="btnCombo4" runat="server" BorderColor="Black" BorderStyle="Solid" Height="150px" ImageUrl="~/Imgs/h-mcdonalds-Filet-O-Fish-Extra-Value-Meals.jpg" OnClick="btnCombo4_Click" />
            <br />
            <asp:ImageButton ID="btnCombo6" runat="server" BorderStyle="Solid" ImageUrl="~/Imgs/t-mcdonalds-Fries-Small-Medium.jpg" Width="126px" OnClick="btnCombo6_Click" />
            <asp:ImageButton ID="btnCombo5" runat="server" BorderStyle="Solid" ImageUrl="~/Imgs/t-mcdonalds-Coca-Cola-Classic-Small.jpg" Width="126px" OnClick="btnCombo5_Click" />
            <asp:ImageButton ID="btnCheckout" runat="server" style="margin-bottom:45px;margin-left:180px;" ImageUrl="~/Imgs/checkout-button.png" Width="100px" OnClick="btnCheckout_Click" />
        </div>
            <div class="column2">
                &nbsp;&nbsp;
                &nbsp;&nbsp; <asp:TextBox ID="tbxLineItems" runat="server" Height="363px" TextMode="MultiLine" Width="450px" ReadOnly="True" BorderStyle="Solid"></asp:TextBox>
                <br />
                                <asp:TextBox ID="txtTotal" runat="server" Height="30px" Width="100px" style="margin-bottom:0px;margin-left:374px;text-align:right;overflow:hidden" ReadOnly="True" BorderStyle="Solid" TextMode="MultiLine"></asp:TextBox>

                <br />
                </div>
                <div class="column3">
                <asp:Label ID="Label1" runat="server" Text="Tax:" style="margin-bottom:25px"></asp:Label>
                    <br />
                <asp:Label ID="Label2" runat="server" Text="Total:" style="margin-bottom:25px"></asp:Label>
                    </div>
            


            


            </div>
        </div>
       
    </form>
</body>
</html>
