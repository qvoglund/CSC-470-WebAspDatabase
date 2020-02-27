<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmSize.aspx.cs" Inherits="CSC_470_WebAspDatabase.frmSize" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 125px;
            width: 70px;
        }
    </style>
</head>
<body style="width: 70px; height: 125px">
    <form id="form1" runat="server">
        
        <asp:Button ID="btnSmall" runat="server" Text="Small" Width="66px" OnClick="btnSmall_Click" />
        <br />
        <br />
        <asp:Button ID="btnMedium" runat="server" Text="Medium" Width="66px" OnClick="btnMedium_Click" />
        <br />
        <br />
        <asp:Button ID="btnLarge" runat="server" Text="Large" Width="66px" OnClick="btnLarge_Click" />
    </form>
</body>
</html>
