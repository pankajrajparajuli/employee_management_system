<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="lscorporation.Pages.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <style>
        body { font-family: Arial; padding: 30px; background-color: #f8f9fa; }
        h1 { color: #333; }
        .nav-link {
            display: inline-block;
            padding: 10px 15px;
            margin: 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .nav-link:hover { background-color: #0056b3; }

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
            margin-top: 30px;
            font-weight: bold;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>📊 Project Management Dashboard</h1>

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

        <!-- Navigation Links -->
        <div class="section-title">🔧 Basic Forms</div>
        <a class="nav-link" href="UserForm.aspx">User</a>
        <a class="nav-link" href="ProjectForm.aspx">Project</a>
        <a class="nav-link" href="TaskForm.aspx">Task</a>
        <a class="nav-link" href="SubTaskForm.aspx">SubTask</a>
        <a class="nav-link" href="MilestoneForm.aspx">Milestone</a>

        <div class="section-title">📈 Complex Forms</div>
        <a class="nav-link" href="UserProject.aspx">User Projects</a>
        <a class="nav-link" href="ProjectMilestone.aspx">Project Milestones</a>
        <a class="nav-link" href="TopPerformer.aspx">Top Performers</a>
    </form>
</body>
</html>
