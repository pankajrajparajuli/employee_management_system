<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPerformer.aspx.cs" Inherits="lscorporation.Pages.Forms.Complex.TopPerformers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performers</title>
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
                                <li><a class="dropdown-item" href="TopPerformer.aspx">Top Performers</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-4">
            <div class="form-section">
                <h2>Top 3 Performers by Completed Tasks</h2>

                <asp:GridView ID="GridViewTop" runat="server"
                    DataSourceID="SqlDataSourceTop"
                    AutoGenerateColumns="true"
                    CssClass="table table-striped table-bordered"
                    Width="100%">
                </asp:GridView>
            </div>
        </div>

        <!-- SqlDataSource -->
        <asp:SqlDataSource ID="SqlDataSourceTop" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="
                SELECT * FROM (
                    SELECT 
                        U.USER_ID,
                        U.USER_FIRST_NAME || ' ' || U.USER_LAST_NAME AS FULL_NAME,
                        COUNT(*) AS COMPLETED_TASKS
                    FROM USERS U
                    INNER JOIN USERPROJECTTASKS UPT ON U.USER_ID = UPT.USER_ID
                    INNER JOIN TASKS T ON UPT.TASK_ID = T.TASK_ID
                    WHERE T.TASK_STATUS != 'Pending'
                    GROUP BY U.USER_ID, U.USER_FIRST_NAME, U.USER_LAST_NAME
                    ORDER BY COMPLETED_TASKS DESC
                )
                WHERE ROWNUM <= 3">
        </asp:SqlDataSource>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
