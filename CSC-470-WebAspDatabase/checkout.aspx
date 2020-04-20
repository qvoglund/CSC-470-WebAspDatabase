<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="CSC_470_WebAspDatabase.Imgs.checkout" %>

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
        .column1{
            width:250px;
            display:inline-block;
            height: 367px;
        }
        .column2{
            width:173px;
            display:inline-block;
            height: 367px;
        }
        .column3{
            width:45px;
            margin-top:350px;
            margin-left:225px;
        }
    </style> 
</head>
<body>
    <form id="form1" runat="server">
        <div id="form">
        <div class="column1"">
            <asp:TextBox ID="txtInput" runat="server" Height="16px" Width="229px" style="text-align:right">0</asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn1" runat="server" Height="75px" Text="1" Width="75px" OnClick="btn1_Click" />
            <asp:Button ID="btn2" runat="server" Height="75px" Text="2" Width="75px" OnClick="btn2_Click" />
            <asp:Button ID="btn3" runat="server" Height="75px" Text="3" Width="75px" OnClick="btn3_Click" />
            <br />
            <asp:Button ID="btn4" runat="server" Height="75px" Text="4" Width="75px" OnClick="btn4_Click" />
            <asp:Button ID="btn5" runat="server" Height="75px" Text="5" Width="75px" OnClick="btn5_Click" />
            <asp:Button ID="btn6" runat="server" Height="75px" Text="6" Width="75px" OnClick="btn6_Click" />
            <br />
            <asp:Button ID="btn7" runat="server" Height="75px" Text="7" Width="75px" OnClick="btn7_Click" />
            <asp:Button ID="btn8" runat="server" Height="75px" Text="8" Width="75px" OnClick="btn8_Click" />
            <asp:Button ID="btn9" runat="server" Height="75px" Text="9" Width="75px" OnClick="btn9_Click" />
            <br />
            <asp:Button ID="btnPeriod" runat="server" Height="75px" Text="." Width="75px" OnClick="btnPeriod_Click" />
            <asp:Button ID="btn0" runat="server" Height="75px" Text="0" Width="75px" OnClick="btn0_Click" />
            <asp:Button ID="btnAdd" runat="server" Height="75px" style="margin-top:1px" Text="Add" Width="75px" OnClick="btnAdd_Click" />
        </div>

            <div class="column2">

                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Due:"></asp:Label>
                <br />
&nbsp; $&nbsp;&nbsp;<asp:TextBox ID="txtDue" runat="server" Width="128px" style="text-align:right" ReadOnly="True">0</asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Paid:"></asp:Label>
                <br />
&nbsp; $&nbsp;&nbsp;<asp:TextBox ID="txtPaid" runat="server" Width="128px" style="text-align:right" ReadOnly="True">0</asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="Change:"></asp:Label>
                <br />
&nbsp; $&nbsp;
                <asp:TextBox ID="txtChange" runat="server" Width="128px" style="text-align:right" ReadOnly="True">0</asp:TextBox>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCheckout" runat="server" Height="37px" style="margin-bottom:0px" Text="Checkout" Width="128px" OnClick="btnCheckout_Click" />

                            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" Height="37px" style="margin-top:10px" Text="Cancel" Width="128px" OnClick="btnCancel_Click" />

           
            </div>
    </form>
</body>
</html>
