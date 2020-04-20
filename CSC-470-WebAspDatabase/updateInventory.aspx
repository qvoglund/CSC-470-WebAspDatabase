<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateInventory.aspx.cs" Inherits="CSC_470_WebAspDatabase.updateInventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 392px; width: 680px;">
    <form id="form1" style="white-space: nowrap;overflow:auto" runat="server">
        <div style="display:inline-block;overflow:auto; margin-top:0px;width:112%; height:500px">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="item_id" DataSourceID="SqlDataSource2" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFF8DC;">
                        <td>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("size") %>' />
                        </td>
                        <td>
                            <asp:Label ID="itemLabel" runat="server" Text='<%# Eval("item") %>' />
                        </td>
                        <td>
                            <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                        </td>
                        <td>
                            <asp:Label ID="item_idLabel" runat="server" Text='<%# Eval("item_id") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #008A8C; color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="sizeTextBox" runat="server" Text='<%# Bind("size") %>' ReadOnly="True" />
                        </td>
                        <td>
                            <asp:TextBox ID="itemTextBox" runat="server" Text='<%# Bind("item") %>' ReadOnly="True" />
                        </td>
                        <td>
                            <asp:TextBox ID="quantityTextBox" runat="server" Text='<%# Bind("quantity") %>' />
                        </td>
                        <td>
                            <asp:Label ID="item_idLabel1" runat="server" Text='<%# Eval("item_id") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="sizeTextBox" runat="server" Text='<%# Bind("size") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="itemTextBox" runat="server" Text='<%# Bind("item") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="quantityTextBox" runat="server" Text='<%# Bind("quantity") %>' />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #DCDCDC; color: #000000;">
                        <td>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("size") %>' />
                        </td>
                        <td>
                            <asp:Label ID="itemLabel" runat="server" Text='<%# Eval("item") %>' />
                        </td>
                        <td>
                            <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                        </td>
                        <td>
                            <asp:Label ID="item_idLabel" runat="server" Text='<%# Eval("item_id") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                        <th runat="server"></th>
                                        <th runat="server">size</th>
                                        <th runat="server">item</th>
                                        <th runat="server">quantity</th>
                                        <th runat="server">item_id</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #008A8C; font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("size") %>' />
                        </td>
                        <td>
                            <asp:Label ID="itemLabel" runat="server" Text='<%# Eval("item") %>' />
                        </td>
                        <td>
                            <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                        </td>
                        <td>
                            <asp:Label ID="item_idLabel" runat="server" Text='<%# Eval("item_id") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [inventory] WHERE [item_id] = @item_id" InsertCommand="INSERT INTO [inventory] ([size], [item], [quantity]) VALUES (@size, @item, @quantity)" SelectCommand="SELECT * FROM [inventory]" UpdateCommand="UPDATE [inventory] SET [size] = @size, [item] = @item, [quantity] = @quantity WHERE [item_id] = @item_id">
                <DeleteParameters>
                    <asp:Parameter Name="item_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="size" Type="String" />
                    <asp:Parameter Name="item" Type="String" />
                    <asp:Parameter Name="quantity" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="size" Type="String" />
                    <asp:Parameter Name="item" Type="String" />
                    <asp:Parameter Name="quantity" Type="String" />
                    <asp:Parameter Name="item_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:comboDBConnectionString %>" DeleteCommand="DELETE FROM [inventory] WHERE [item_id] = @item_id" InsertCommand="INSERT INTO [inventory] ([size], [item], [quantity]) VALUES (@size, @item, @quantity)" SelectCommand="SELECT * FROM [inventory]" UpdateCommand="UPDATE [inventory] SET [size] = @size, [item] = @item, [quantity] = @quantity WHERE [item_id] = @item_id">
                <DeleteParameters>
                    <asp:Parameter Name="item_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="size" Type="String" />
                    <asp:Parameter Name="item" Type="String" />
                    <asp:Parameter Name="quantity" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="size" Type="String" />
                    <asp:Parameter Name="item" Type="String" />
                    <asp:Parameter Name="quantity" Type="String" />
                    <asp:Parameter Name="item_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

        
    </form>
</body>
</html>
