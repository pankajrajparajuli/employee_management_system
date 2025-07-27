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
                                <li><a class="dropdown-item" href="UserForm.aspx">User</a></li>
                                <li><a class="dropdown-item" href="ProjectForm.aspx">Project</a></li>
                                <li><a class="dropdown-item" href="TaskForm.aspx">Task</a></li>
                                <li><a class="dropdown-item" href="SubTaskForm.aspx">SubTask</a></li>
                                <li><a class="dropdown-item" href="MilestoneForm.aspx">Milestone</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Complex Forms</a>
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
            <!-- Task Section -->
            <div class="form-section">
                <h2>Task Management</h2>

                <asp:FormView ID="FormView1" runat="server"
                    DataSourceID="SqlDataSourceTasks"
                    DefaultMode="Insert"
                    RenderOuterTable="false">
                    <InsertItemTemplate>
                        <table class="table table-borderless">
                            <tr><td>Task ID:</td><td><asp:TextBox ID="txtTaskId" runat="server" CssClass="form-control" Text='<%# Bind("TASK_ID") %>' /></td></tr>
                            <tr><td>Name:</td><td><asp:TextBox ID="txtName" runat="server" CssClass="form-control" Text='<%# Bind("TASK_NAME") %>' /></td></tr>
                            <tr><td>Start Date:</td><td><asp:TextBox ID="txtStart" runat="server" CssClass="form-control" Text='<%# Bind("TASK_START_DATE") %>' /></td></tr>
                            <tr><td>Due Date:</td><td><asp:TextBox ID="txtDue" runat="server" CssClass="form-control" Text='<%# Bind("TASK_DUE_DATE") %>' /></td></tr>
                            <tr><td>Status:</td><td><asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" Text='<%# Bind("TASK_STATUS") %>' /></td></tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button runat="server" CommandName="Insert" Text="Insert Task" CssClass="btn btn-success" />
                                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>

                <asp:GridView ID="GridView1" runat="server"
                    DataSourceID="SqlDataSourceTasks"
                    AutoGenerateColumns="False"
                    DataKeyNames="TASK_ID"
                    AutoGenerateEditButton="true"
                    AutoGenerateDeleteButton="true"
                    CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="TASK_ID" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="TASK_NAME" HeaderText="Name" />
                        <asp:BoundField DataField="TASK_START_DATE" HeaderText="Start" />
                        <asp:BoundField DataField="TASK_DUE_DATE" HeaderText="Due" />
                        <asp:BoundField DataField="TASK_STATUS" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
            </div>

            <!-- SubTask Section -->
            <div class="form-section">
                <h2>SubTask Management</h2>

                <asp:FormView ID="FormView2" runat="server"
                    DataSourceID="SqlDataSourceSubTasks"
                    DefaultMode="Insert"
                    RenderOuterTable="false">
                    <InsertItemTemplate>
                        <table class="table table-borderless">
                            <tr><td>SubTask ID:</td><td><asp:TextBox ID="txtSTID" runat="server" CssClass="form-control" Text='<%# Bind("SUBTASK_ID") %>' /></td></tr>
                            <tr><td>Task ID:</td><td><asp:TextBox ID="txtTaskIdST" runat="server" CssClass="form-control" Text='<%# Bind("TASK_ID") %>' /></td></tr>
                            <tr><td>Name:</td><td><asp:TextBox ID="txtNameST" runat="server" CssClass="form-control" Text='<%# Bind("SUBTASK_NAME") %>' /></td></tr>
                            <tr><td>Description:</td><td><asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" Text='<%# Bind("SUBTASK_DESCRIPTION") %>' /></td></tr>
                            <tr><td>Status:</td><td><asp:TextBox ID="txtStat" runat="server" CssClass="form-control" Text='<%# Bind("SUBTASK_STATUS") %>' /></td></tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button runat="server" CommandName="Insert" Text="Insert SubTask" CssClass="btn btn-success" />
                                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>

                <asp:GridView ID="GridView2" runat="server"
                    DataSourceID="SqlDataSourceSubTasks"
                    AutoGenerateColumns="False"
                    DataKeyNames="SUBTASK_ID"
                    AutoGenerateEditButton="true"
                    AutoGenerateDeleteButton="true"
                    CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="SUBTASK_ID" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="TASK_ID" HeaderText="Task ID" />
                        <asp:BoundField DataField="SUBTASK_NAME" HeaderText="Name" />
                        <asp:BoundField DataField="SUBTASK_DESCRIPTION" HeaderText="Description" />
                        <asp:BoundField DataField="SUBTASK_STATUS" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- SQL Data Sources -->
        <asp:SqlDataSource ID="SqlDataSourceTasks" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT * FROM TASKS"
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

        <asp:SqlDataSource ID="SqlDataSourceSubTasks" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT * FROM SUBTASKS"
            InsertCommand="INSERT INTO SUBTASKS (SUBTASK_ID, TASK_ID, SUBTASK_NAME, SUBTASK_DESCRIPTION, SUBTASK_STATUS) VALUES (:SUBTASK_ID, :TASK_ID, :SUBTASK_NAME, :SUBTASK_DESCRIPTION, :SUBTASK_STATUS)"
            UpdateCommand="UPDATE SUBTASKS SET TASK_ID=:TASK_ID, SUBTASK_NAME=:SUBTASK_NAME, SUBTASK_DESCRIPTION=:SUBTASK_DESCRIPTION, SUBTASK_STATUS=:SUBTASK_STATUS WHERE SUBTASK_ID=:SUBTASK_ID"
            DeleteCommand="DELETE FROM SUBTASKS WHERE SUBTASK_ID=:SUBTASK_ID">
            <InsertParameters>
                <asp:Parameter Name="SUBTASK_ID" Type="String" />
                <asp:Parameter Name="TASK_ID" Type="String" />
                <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="SUBTASK_DESCRIPTION" Type="String" />
                <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASK_ID" Type="String" />
                <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="SUBTASK_DESCRIPTION" Type="String" />
                <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
                <asp:Parameter Name="SUBTASK_ID" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="SUBTASK_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>a
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
