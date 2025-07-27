<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="lscorporation.Pages.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial;
            background-color: #f8f9fa;
            padding-top: 70px;
        }

        .summary-box {
            display: inline-block;
            width: 180px;
            margin: 20px;
            padding: 15px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .summary-number {
            font-size: 24px;
            font-weight: bold;
            color: #28a745;
        }

        .section-title {
            margin-top: 40px;
            font-weight: bold;
            font-size: 18px;
        }

        .container-links a {
            display: inline-block;
            padding: 10px 15px;
            margin: 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .container-links a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">LS Corporation</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                        aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" href="../Dashboard/Dashboard.aspx">Dashboard</a></li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="basicDropdown" role="button" data-bs-toggle="dropdown">
                                Basic Forms
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="basicDropdown">
                                <li><a class="dropdown-item" href="../Forms/Basic/UserForm.aspx">User</a></li>
                                <li><a class="dropdown-item" href="../Forms/Basic/ProjectForm.aspx">Project</a></li>
                                <li><a class="dropdown-item" href="../Forms/Basic/TaskForm.aspx">Task</a></li>
                                <li><a class="dropdown-item" href="../Forms/Basic/SubTaskForm.aspx">SubTask</a></li>
                                <li><a class="dropdown-item" href="../Forms/Basic/MilestoneForm.aspx">Milestone</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="complexDropdown" role="button" data-bs-toggle="dropdown">
                                Complex Forms
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="complexDropdown">
                                <li><a class="dropdown-item" href="../Forms/Complex/UserProjects.aspx">User Projects</a></li>
                                <li><a class="dropdown-item" href="../Forms/Complex/ProjectMilestones.aspx">Project Milestones</a></li>
                                <li><a class="dropdown-item" href="../Forms/Complex/TopPerformers.aspx">Top Performers</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Content -->
        <div class="container">
            <h2 class="mb-4">📊 Project Management Dashboard</h2>

            <!-- Summary Stats -->
            <div class="summary-box">
                <div class="summary-number"><asp:Label ID="lblUsers" runat="server" Text="0" /></div>
                <div>Total Users</div>
            </div>
            <div class="summary-box">
                <div class="summary-number"><asp:Label ID="lblProjects" runat="server" Text="0" /></div>
                <div>Total Projects</div>
            </div>
            <div class="summary-box">
                <div class="summary-number"><asp:Label ID="lblTasks" runat="server" Text="0" /></div>
                <div>Total Tasks</div>
            </div>
            <div class="summary-box">
                <div class="summary-number"><asp:Label ID="lblMilestones" runat="server" Text="0" /></div>
                <div>Total Milestones</div>
            </div>

            <!-- Quick Access Links -->
            <div class="section-title">🔗 Quick Access</div>
            <div class="container-links">
                <a href="../Forms/Basic/UserForm.aspx">User</a>
                <a href="../Forms/Basic/ProjectForm.aspx">Project</a>
                <a href="../Forms/Basic/TaskForm.aspx">Task</a>
                <a href="../Forms/Basic/SubTaskForm.aspx">SubTask</a>
                <a href="../Forms/Basic/MilestoneForm.aspx">Milestone</a>
                <a href="../Forms/Complex/UserProjects.aspx">User Projects</a>
                <a href="../Forms/Complex/ProjectMilestones.aspx">Project Milestones</a>
                <a href="../Forms/Complex/TopPerformers.aspx">Top Performers</a>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
