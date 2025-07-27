<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MilestoneForm.aspx.cs" Inherits="lscorporation.Pages.Forms.Basic.MilestoneForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestone Management</title>
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

        <!-- Content -->
        <div class="container mt-4">
            <div class="form-section">
                <h2>Milestone Management</h2>

                <!-- Insert Milestone -->
                <asp:FormView ID="FormView1" runat="server"
                    DataSourceID="SqlDataSource1"
                    DefaultMode="Insert"
                    RenderOuterTable="false">
                    <InsertItemTemplate>
                        <table class="table table-borderless">
                            <tr><td>Milestone ID:</td><td><asp:TextBox ID="txtMilestoneId" runat="server" CssClass="form-control" Text='<%# Bind("MILESTONE_ID") %>' /></td></tr>
                            <tr><td>Project ID:</td><td><asp:TextBox ID="txtProjectId" runat="server" CssClass="form-control" Text='<%# Bind("PROJECT_ID") %>' /></td></tr>
                            <tr><td>Name:</td><td><asp:TextBox ID="txtMilestoneName" runat="server" CssClass="form-control" Text='<%# Bind("MILESTONE_NAME") %>' /></td></tr>
                            <tr><td>Due Date:</td><td><asp:TextBox ID="txtDueDate" runat="server" CssClass="form-control" Text='<%# Bind("MILESTONE_DUE_DATE") %>' /></td></tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
                                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>

                <div class="section-divider">Existing Milestones</div>

                <!-- GridView -->
                <asp:GridView ID="GridView1" runat="server"
                    DataSourceID="SqlDataSource1"
                    AutoGenerateColumns="False"
                    DataKeyNames="MILESTONE_ID"
                    AutoGenerateEditButton="true"
                    AutoGenerateDeleteButton="true"
                    AllowPaging="true"
                    AllowSorting="true"
                    CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="MILESTONE_ID" HeaderText="Milestone ID" ReadOnly="true" />
                        <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" />
                        <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Name" />
                        <asp:BoundField DataField="MILESTONE_DUE_DATE" HeaderText="Due Date" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- SqlDataSource -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT * FROM MILESTONES ORDER BY MILESTONE_ID"
            InsertCommand="INSERT INTO MILESTONES (MILESTONE_ID, PROJECT_ID, MILESTONE_NAME, MILESTONE_DUE_DATE) VALUES (:MILESTONE_ID, :PROJECT_ID, :MILESTONE_NAME, :MILESTONE_DUE_DATE)"
            UpdateCommand="UPDATE MILESTONES SET PROJECT_ID=:PROJECT_ID, MILESTONE_NAME=:MILESTONE_NAME, MILESTONE_DUE_DATE=:MILESTONE_DUE_DATE WHERE MILESTONE_ID=:MILESTONE_ID"
            DeleteCommand="DELETE FROM MILESTONES WHERE MILESTONE_ID=:MILESTONE_ID">
            <InsertParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="String" />
                <asp:Parameter Name="PROJECT_ID" Type="String" />
                <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                <asp:Parameter Name="MILESTONE_DUE_DATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECT_ID" Type="String" />
                <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                <asp:Parameter Name="MILESTONE_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="MILESTONE_ID" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>

    <!-- Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
