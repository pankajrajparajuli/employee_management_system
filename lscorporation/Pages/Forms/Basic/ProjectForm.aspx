<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectForm.aspx.cs" Inherits="lscorporation.Pages.Forms.Basic.ProjectForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management</title>
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
                <h2>Project Management</h2>

                <!-- Insert Form -->
                <asp:FormView ID="FormView1" runat="server"
                    DataSourceID="SqlDataSource1"
                    DefaultMode="Insert"
                    RenderOuterTable="false">
                    <InsertItemTemplate>
                        <table class="table table-borderless">
                            <tr><td>Project ID:</td><td><asp:TextBox ID="txtProjectId" runat="server" CssClass="form-control" Text='<%# Bind("PROJECT_ID") %>' /></td></tr>
                            <tr><td>Name:</td><td><asp:TextBox ID="txtProjectName" runat="server" CssClass="form-control" Text='<%# Bind("PROJECT_NAME") %>' /></td></tr>
                            <tr><td>Start Date:</td><td><asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" Text='<%# Bind("PROJECT_START_DATE") %>' /></td></tr>
                            <tr><td>Due Date:</td><td><asp:TextBox ID="txtDueDate" runat="server" CssClass="form-control" Text='<%# Bind("PROJECT_DUE_DATE") %>' /></td></tr>
                            <tr><td>Status:</td><td><asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" Text='<%# Bind("PROJECT_STATUS") %>' /></td></tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
                                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>

                <div class="section-divider">Existing Projects</div>

                <!-- GridView -->
                <asp:GridView ID="GridView1" runat="server"
                    DataSourceID="SqlDataSource1"
                    AutoGenerateColumns="False"
                    DataKeyNames="PROJECT_ID"
                    AutoGenerateEditButton="true"
                    AutoGenerateDeleteButton="true"
                    AllowPaging="true"
                    AllowSorting="true"
                    CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="PROJECT_ID" HeaderText="ID" ReadOnly="true" />
                        <asp:BoundField DataField="PROJECT_NAME" HeaderText="Name" />
                        <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="Start Date" />
                        <asp:BoundField DataField="PROJECT_DUE_DATE" HeaderText="Due Date" />
                        <asp:BoundField DataField="PROJECT_STATUS" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- SQL DataSource -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT * FROM PROJECTS"
            InsertCommand="INSERT INTO PROJECTS (PROJECT_ID, PROJECT_NAME, PROJECT_START_DATE, PROJECT_DUE_DATE, PROJECT_STATUS) VALUES (:PROJECT_ID, :PROJECT_NAME, :PROJECT_START_DATE, :PROJECT_DUE_DATE, :PROJECT_STATUS)"
            UpdateCommand="UPDATE PROJECTS SET PROJECT_NAME=:PROJECT_NAME, PROJECT_START_DATE=:PROJECT_START_DATE, PROJECT_DUE_DATE=:PROJECT_DUE_DATE, PROJECT_STATUS=:PROJECT_STATUS WHERE PROJECT_ID=:PROJECT_ID"
            DeleteCommand="DELETE FROM PROJECTS WHERE PROJECT_ID=:PROJECT_ID">
            <InsertParameters>
                <asp:Parameter Name="PROJECT_ID" Type="String" />
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_STATUS" Type="String" />
                <asp:Parameter Name="PROJECT_ID" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="PROJECT_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
