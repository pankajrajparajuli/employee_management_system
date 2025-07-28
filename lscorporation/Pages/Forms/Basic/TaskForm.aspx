<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskForm.aspx.cs" Inherits="lscorporation.Pages.Forms.Basic.TaskForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Management</title>
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
            margin-bottom: 40px;
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
                                <li><a class="dropdown-item" href="../Complex/UserProjects.aspx">User Projects</a></li>
                                <li><a class="dropdown-item" href="../Complex/ProjectMilestones.aspx">Project Milestones</a></li>
                                <li><a class="dropdown-item" href="../Complex/TopPerformers.aspx">Top Performers</a></li>
                                <li><a class="dropdown-item" href="../Complex/TaskManagement.aspx">Task Management</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-4">
            <div class="form-section">
                <h2>Task Management</h2>

                <!-- Insert Form -->
                <asp:FormView ID="FormView1" runat="server"
                    DataSourceID="SqlDataSource1"
                    DefaultMode="Insert"
                    RenderOuterTable="false">
                    <InsertItemTemplate>
                        <table class="table table-borderless">
                            <tr><td>Task ID:</td><td><asp:TextBox ID="txtTaskId" runat="server" CssClass="form-control" Text='<%# Bind("TASK_ID") %>' /></td></tr>
                            <tr><td>Task Name:</td><td><asp:TextBox ID="txtTaskName" runat="server" CssClass="form-control" Text='<%# Bind("TASK_NAME") %>' /></td></tr>
                            <tr><td>Start Date:</td>
                                <td><asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date" Text='<%# Bind("TASK_START_DATE") %>' /></td>
                            </tr>
                            <tr><td>Due Date:</td>
                                <td><asp:TextBox ID="txtDueDate" runat="server" CssClass="form-control" TextMode="Date" Text='<%# Bind("TASK_DUE_DATE") %>' /></td>
                            </tr>
                            <tr><td>Status:</td><td><asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" Text='<%# Bind("TASK_STATUS") %>' /></td></tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
                                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>

                <div class="section-divider">Existing Tasks</div>

                <!-- GridView -->
                <asp:GridView ID="GridView1" runat="server"
                    DataSourceID="SqlDataSource1"
                    AutoGenerateColumns="False"
                    DataKeyNames="TASK_ID"
                    AutoGenerateEditButton="true"
                    AutoGenerateDeleteButton="true"
                    AllowPaging="true"
                    AllowSorting="true"
                    CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="TASK_ID" HeaderText="Task ID" ReadOnly="True" />
                        <asp:BoundField DataField="TASK_NAME" HeaderText="Task Name" />
                        <asp:BoundField DataField="TASK_START_DATE" HeaderText="Start Date" />
                        <asp:BoundField DataField="TASK_DUE_DATE" HeaderText="Due Date" />
                        <asp:BoundField DataField="TASK_STATUS" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- SQL DataSource -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT TASK_ID, TASK_NAME, TASK_START_DATE, TASK_DUE_DATE, TASK_STATUS FROM TASKS ORDER BY TASK_ID"
            InsertCommand="INSERT INTO TASKS (TASK_ID, TASK_NAME, TASK_START_DATE, TASK_DUE_DATE, TASK_STATUS) VALUES (:TASK_ID, :TASK_NAME, :TASK_START_DATE, :TASK_DUE_DATE, :TASK_STATUS)"
            UpdateCommand="UPDATE TASKS SET TASK_NAME=:TASK_NAME, TASK_START_DATE=:TASK_START_DATE, TASK_DUE_DATE=:TASK_DUE_DATE, TASK_STATUS=:TASK_STATUS WHERE TASK_ID=:TASK_ID"
            DeleteCommand="DELETE FROM TASKS WHERE TASK_ID=:TASK_ID">
            <InsertParameters>
                <asp:Parameter Name="TASK_ID" Type="String" />
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="TASK_ID" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="TASK_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
