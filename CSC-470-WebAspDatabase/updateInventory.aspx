<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateInventory.aspx.cs" Inherits="CSC_470_WebAspDatabase.updateInventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 392px; width: 580px;">
    <form id="form1" style="white-space: nowrap;overflow:auto" runat="server">
        <div style="display:inline-block;overflow:auto; margin-top:0px;width:40%; height:500px">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="item_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="size" HeaderText="size" SortExpression="size" />
                    <asp:BoundField DataField="item" HeaderText="item" SortExpression="item" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="item_id" HeaderText="item_id" InsertVisible="False" ReadOnly="True" SortExpression="item_id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:comboDBConnectionString %>" SelectCommand="SELECT * FROM [inventory]"></asp:SqlDataSource>
        </div>

        <div style="display:inline-block; overflow:auto;margin-top: 0px;width: 40%; height: 500px">
            <asp:Label ID="Label1" runat="server" Text="size:" Width="2em"></asp:Label>
            <asp:TextBox ID="txtSize" style="margin-left: 1em" runat="server" Width="131px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="item:" Width="2em"></asp:Label>
            <asp:TextBox ID="txtItem" style="margin-left: 1em" runat="server" Width="131px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="qty:" Width="2em"></asp:Label>
            <asp:TextBox ID="txtQuantity" style="margin-left: 1em" runat="server" Width="131px"></asp:TextBox>
            <br />
            <br />
            &nbsp;<asp:Button ID="btnAdd" runat="server" style="margin-left:3em" Text="Add Item" Width="149px" />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="size:" Width="2em"></asp:Label>
            <asp:TextBox ID="sizeTextBox" style="margin-left: 1em" runat="server" Width="131px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="item:" Width="2em"></asp:Label>
            <asp:TextBox ID="itemTextBox" style="margin-left: 1em" runat="server" Width="131px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="qty:" Width="2em"></asp:Label>
            <asp:TextBox ID="quantityTextBox" style="margin-left: 1em" runat="server" Width="131px"></asp:TextBox>
            <br />
            <br />
            &nbsp;<asp:Button ID="btnUpdate" runat="server" style="margin-left:3em" Text="Update Inventory" Width="149px" />
        </div>
    </form>
</body>
</html>
