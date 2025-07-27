<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="lscorporation.Pages.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f1f3f6;
            padding-top: 70px;
        }

        .summary-card {
            background-color: #fff;
            padding: 15px 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: center;
            margin-bottom: 20px;
        }

        .summary-number {
            font-size: 26px;
            font-weight: 600;
            color: #0d6efd;
        }

        .summary-label {
            font-size: 14px;
            color: #666;
        }

        .section-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .chart-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 40px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.08);
        }

        canvas {
            max-width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">LS Corporation</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" href="Dashboard.aspx">Dashboard</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Basic Forms</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../Forms/Basic/UserForm.aspx">User</a></li>
                                <li><a class="dropdown-item" href="../Forms/Basic/ProjectForm.aspx">Project</a></li>
                                <li><a class="dropdown-item" href="../Forms/Basic/TaskForm.aspx">Task</a></li>
                                <li><a class="dropdown-item" href="../Forms/Basic/SubTaskForm.aspx">SubTask</a></li>
                                <li><a class="dropdown-item" href="../Forms/Basic/MilestoneForm.aspx">Milestone</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Complex Forms</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../Forms/Complex/UserProjects.aspx">User Projects</a></li>
                                <li><a class="dropdown-item" href="../Forms/Complex/ProjectMilestones.aspx">Project Milestones</a></li>
                                <li><a class="dropdown-item" href="../Forms/Complex/TopPerformers.aspx">Top Performers</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-4">
            <!-- Summary Cards -->
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="summary-card">
                        <div class="summary-number"><asp:Label ID="lblUsers" runat="server" /></div>
                        <div class="summary-label">👥 Total Users</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="summary-card">
                        <div class="summary-number"><asp:Label ID="lblProjects" runat="server" /></div>
                        <div class="summary-label">📦 Total Projects</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="summary-card">
                        <div class="summary-number"><asp:Label ID="lblTasks" runat="server" /></div>
                        <div class="summary-label">🗂️ Total Tasks</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="summary-card">
                        <div class="summary-number"><asp:Label ID="lblCompletedTasks" runat="server" /></div>
                        <div class="summary-label">✅ Completed Tasks</div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="summary-card">
                        <div class="summary-number"><asp:Label ID="lblMilestones" runat="server" /></div>
                        <div class="summary-label">📅 Total Milestones</div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="summary-card">
                        <div class="summary-number"><asp:Label ID="lblMilestonesMonth" runat="server" /></div>
                        <div class="summary-label">📅 Milestones This Month</div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <div class="summary-card">
                        <div class="summary-number"><asp:Label ID="lblTopPerformer" runat="server" /></div>
                        <div class="summary-label">🏆 Top Performer</div>
                    </div>
                </div>
            </div>

            <!-- Charts -->
            <div class="chart-container">
                <div class="section-title">📊 Tasks per Project (Bar Chart)</div>
                <canvas id="barChart"></canvas>
            </div>

            <div class="chart-container">
                <div class="section-title">📈 Task Distribution Over Projects (Line Chart)</div>
                <canvas id="lineChart"></canvas>
            </div>

            <div class="chart-container">
                <div class="section-title">🟢 Task Status Breakdown (Pie Chart)</div>
                <canvas id="pieChart"></canvas>
            </div>

            <!-- Hidden Fields for Chart Data -->
            <asp:HiddenField ID="hfProjectLabels" runat="server" />
            <asp:HiddenField ID="hfTaskCounts" runat="server" />
            <asp:HiddenField ID="hfTaskStatusLabels" runat="server" />
            <asp:HiddenField ID="hfTaskStatusCounts" runat="server" />
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        window.onload = function () {
            const labels = document.getElementById('<%= hfProjectLabels.ClientID %>').value.split(',');
            const counts = document.getElementById('<%= hfTaskCounts.ClientID %>').value.split(',').map(Number);
            const statusLabels = document.getElementById('<%= hfTaskStatusLabels.ClientID %>').value.split(',');
            const statusCounts = document.getElementById('<%= hfTaskStatusCounts.ClientID %>').value.split(',').map(Number);

            new Chart(document.getElementById('barChart'), {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Tasks per Project',
                        data: counts,
                        backgroundColor: 'rgba(54, 162, 235, 0.6)'
                    }]
                },
                options: {
                    responsive: true,
                    scales: { y: { beginAtZero: true } }
                }
            });

            new Chart(document.getElementById('lineChart'), {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Tasks per Project',
                        data: counts,
                        borderColor: 'rgba(75, 192, 192, 1)',
                        fill: false,
                        tension: 0.3
                    }]
                },
                options: {
                    responsive: true,
                    scales: { y: { beginAtZero: true } }
                }
            });

            new Chart(document.getElementById('pieChart'), {
                type: 'pie',
                data: {
                    labels: statusLabels,
                    datasets: [{
                        data: statusCounts,
                        backgroundColor: ['#198754', '#ffc107', '#dc3545']
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: { position: 'bottom' }
                    }
                }
            });
        };
    </script>
</body>
</html>
