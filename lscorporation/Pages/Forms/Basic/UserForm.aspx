<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="lscorporation.Pages.Forms.Basic.UserForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            padding-top: 70px;
            background-color: #f8f9fa;
        }

        .form-section {
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .form-section h2 {
            margin-bottom: 20px;
        }

        .table td {
            padding: 8px;
        }

        .navbar-brand, .nav-link, .dropdown-item {
            color: #ffffff !important;
        }

        .dropdown-menu {
            background-color: #343a40;
        }

        .dropdown-item:hover {
            background-color: #495057;
        }

        .section-divider {
            margin: 40px 0 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="../../Dashboard/Dashboard.aspx">LS Corporation</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="../../Dashboard/Dashboard.aspx">Dashboard</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                Basic Forms
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="UserForm.aspx">User</a></li>
                                <li><a class="dropdown-item" href="ProjectForm.aspx">Project</a></li>
                                <li><a class="dropdown-item" href="TaskForm.aspx">Task</a></li>
                                <li><a class="dropdown-item" href="SubTaskForm.aspx">SubTask</a></li>
                                <li><a class="dropdown-item" href="MilestoneForm.aspx">Milestone</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                Complex Forms
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../Complex/UserProjects.aspx">User Projects</a></li>
                                <li><a class="dropdown-item" href="../Complex/ProjectMilestones.aspx">Project Milestones</a></li>
                                <li><a class="dropdown-item" href="../Complex/TopPerformers.aspx">Top Performers</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-4">
            <div class="form-section">
                <h2>User Management</h2>

                <!-- FormView Insert Form -->
                <asp:FormView ID="FormView1" runat="server"
                    DataSourceID="SqlDataSource1"
                    DefaultMode="Insert"
                    RenderOuterTable="false">
                    <InsertItemTemplate>
                        <table class="table table-borderless">
                            <tr><td>User ID:</td><td><asp:TextBox ID="txtUserId" runat="server" CssClass="form-control" Text='<%# Bind("USER_ID") %>' /></td></tr>
                            <tr><td>First Name:</td><td><asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" Text='<%# Bind("USER_FIRST_NAME") %>' /></td></tr>
                            <tr><td>Last Name:</td><td><asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" Text='<%# Bind("USER_LAST_NAME") %>' /></td></tr>
                            <tr><td>Email:</td><td><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Text='<%# Bind("EMAIL") %>' /></td></tr>
                            <tr><td>Contact:</td><td><asp:TextBox ID="txtContact" runat="server" CssClass="form-control" Text='<%# Bind("CONTACT") %>' /></td></tr>
                            <tr><td>Role:</td><td><asp:TextBox ID="txtRole" runat="server" CssClass="form-control" Text='<%# Bind("ROLE") %>' /></td></tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
                                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>

                <div class="section-divider">Existing Users</div>

                <!-- GridView Display -->
                <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="USER_ID"
                    DataSourceID="SqlDataSource1"
                    AllowPaging="True"
                    AllowSorting="True"
                    AutoGenerateEditButton="True"
                    AutoGenerateDeleteButton="True"
                    CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="USER_ID" HeaderText="ID" ReadOnly="True" SortExpression="USER_ID" />
                        <asp:BoundField DataField="USER_FIRST_NAME" HeaderText="First Name" SortExpression="USER_FIRST_NAME" />
                        <asp:BoundField DataField="USER_LAST_NAME" HeaderText="Last Name" SortExpression="USER_LAST_NAME" />
                        <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
                        <asp:BoundField DataField="CONTACT" HeaderText="Contact" SortExpression="CONTACT" />
                        <asp:BoundField DataField="ROLE" HeaderText="Role" SortExpression="ROLE" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- SQL DataSource -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT * FROM USERS ORDER BY USER_ID"
            InsertCommand="INSERT INTO USERS (USER_ID, USER_FIRST_NAME, USER_LAST_NAME, EMAIL, CONTACT, ROLE) VALUES (:USER_ID, :USER_FIRST_NAME, :USER_LAST_NAME, :EMAIL, :CONTACT, :ROLE)"
            UpdateCommand="UPDATE USERS SET USER_FIRST_NAME=:USER_FIRST_NAME, USER_LAST_NAME=:USER_LAST_NAME, EMAIL=:EMAIL, CONTACT=:CONTACT, ROLE=:ROLE WHERE USER_ID=:USER_ID"
            DeleteCommand="DELETE FROM USERS WHERE USER_ID=:USER_ID">
            <InsertParameters>
                <asp:Parameter Name="USER_ID" Type="String" />
                <asp:Parameter Name="USER_FIRST_NAME" Type="String" />
                <asp:Parameter Name="USER_LAST_NAME" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="ROLE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USER_FIRST_NAME" Type="String" />
                <asp:Parameter Name="USER_LAST_NAME" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="ROLE" Type="String" />
                <asp:Parameter Name="USER_ID" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="USER_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
