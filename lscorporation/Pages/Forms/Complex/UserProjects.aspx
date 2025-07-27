<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProjects.aspx.cs" Inherits="lscorporation.Pages.Forms.Complex.UserProjects" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Projects</title>
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
                        <li class="nav-item"><a class="nav-link" href="../../Dashboard/Dashboard.aspx">Dashboard</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Basic Forms</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../Basic/UserForm.aspx">User</a></li>
                                <li><a class="dropdown-item" href="../Basic/ProjectForm.aspx">Project</a></li>
                                <li><a class="dropdown-item" href="../Basic/TaskForm.aspx">Task</a></li>
                                <li><a class="dropdown-item" href="../Basic/SubTaskForm.aspx">SubTask</a></li>
                                <li><a class="dropdown-item" href="../Basic/MilestoneForm.aspx">Milestone</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Complex Forms</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="UserProjects.aspx">User Projects</a></li>
                                <li><a class="dropdown-item" href="ProjectMilestones.aspx">Project Milestones</a></li>
                                <li><a class="dropdown-item" href="TopPerformers.aspx">Top Performers</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-4">
            <div class="form-section">
                <h2>User Projects</h2>

                <!-- Dropdown to select user -->
                <asp:DropDownList ID="ddlUsers" runat="server" AutoPostBack="True"
                    CssClass="form-select mb-3"
                    DataSourceID="SqlDataSourceUsers"
                    DataTextField="FULL_NAME"
                    DataValueField="USER_ID" />

                <!-- User details -->
                <asp:DetailsView ID="UserDetailsView" runat="server"
                    DataSourceID="SqlDataSourceUserDetails"
                    AutoGenerateRows="true"
                    CssClass="table table-bordered mb-4"
                    Width="100%" />

                <div class="section-divider">Assigned Projects</div>

                <!-- Project list -->
                <asp:GridView ID="GridViewProjects" runat="server"
                    DataSourceID="SqlDataSourceUserProjects"
                    AutoGenerateColumns="true"
                    CssClass="table table-striped table-bordered"
                    Width="100%" />
            </div>
        </div>

        <!-- DataSources -->

        <!-- Distinct Users with full name -->
        <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT DISTINCT USER_ID, USER_FIRST_NAME || ' ' || USER_LAST_NAME AS FULL_NAME FROM USERS ORDER BY FULL_NAME" />

        <!-- Selected user details -->
        <asp:SqlDataSource ID="SqlDataSourceUserDetails" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT * FROM USERS WHERE USER_ID = :USER_ID">
            <SelectParameters>
                <asp:ControlParameter Name="USER_ID" ControlID="ddlUsers" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <!-- Projects assigned to selected user -->
        <asp:SqlDataSource ID="SqlDataSourceUserProjects" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="
                SELECT P.PROJECT_ID, P.PROJECT_NAME, P.PROJECT_START_DATE, P.PROJECT_DUE_DATE, P.PROJECT_STATUS
                FROM PROJECTS P
                INNER JOIN USERPROJECTS UP ON P.PROJECT_ID = UP.PROJECT_ID
                WHERE UP.USER_ID = :USER_ID">
            <SelectParameters>
                <asp:ControlParameter Name="USER_ID" ControlID="ddlUsers" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
