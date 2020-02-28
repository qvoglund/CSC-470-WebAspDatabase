<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateInventory.aspx.cs" Inherits="CSC_470_WebAspDatabase.updateInventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="item_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="size" HeaderText="size" SortExpression="size" />
                    <asp:BoundField DataField="item" HeaderText="item" SortExpression="item" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="item_id" HeaderText="item_id" InsertVisible="False" ReadOnly="True" SortExpression="item_id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:comboDBConnectionString %>" SelectCommand="SELECT * FROM [inventory]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;
        </div>
    </form>
</body>
</html>
