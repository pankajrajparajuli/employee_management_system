<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="lscorporation.UserForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>User Management</h2>

        <asp:SqlDataSource ID="UserDataSource" runat="server"
            ConnectionString="<%$ ConnectionStrings:OracleDbContext %>"
            SelectCommand="SELECT * FROM USERS"
            InsertCommand="INSERT INTO USERS (User_ID, User_First_Name, User_Last_Name, Email, Contact, Role) VALUES (:User_ID, :User_First_Name, :User_Last_Name, :Email, :Contact, :Role)"
            UpdateCommand="UPDATE USERS SET User_First_Name = :User_First_Name, User_Last_Name = :User_Last_Name, Email = :Email, Contact = :Contact, Role = :Role WHERE User_ID = :User_ID"
            DeleteCommand="DELETE FROM USERS WHERE User_ID = :User_ID">
            <InsertParameters>
                <asp:Parameter Name="User_ID" Type="String" />
                <asp:Parameter Name="User_First_Name" Type="String" />
                <asp:Parameter Name="User_Last_Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Role" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_First_Name" Type="String" />
                <asp:Parameter Name="User_Last_Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Role" Type="String" />
                <asp:Parameter Name="User_ID" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="User_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="UserGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="User_ID"
            DataSourceID="UserDataSource" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="User_ID" HeaderText="User ID" ReadOnly="True" SortExpression="User_ID" />
                <asp:BoundField DataField="User_First_Name" HeaderText="First Name" SortExpression="User_First_Name" />
                <asp:BoundField DataField="User_Last_Name" HeaderText="Last Name" SortExpression="User_Last_Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        <h3>Add New User</h3>
        <asp:DetailsView ID="UserDetailsView" runat="server" AutoGenerateRows="False"
            DataSourceID="UserDataSource" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="User_ID" HeaderText="User ID" />
                <asp:BoundField DataField="User_First_Name" HeaderText="First Name" />
                <asp:BoundField DataField="User_Last_Name" HeaderText="Last Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" />
                <asp:BoundField DataField="Role" HeaderText="Role" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </form>
</body>
</html>
