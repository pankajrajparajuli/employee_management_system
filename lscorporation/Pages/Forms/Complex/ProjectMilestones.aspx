<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMilestone.aspx.cs" Inherits="lscorporation.Pages.Forms.Complex.ProjectMilestones" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Milestones</title>
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
                                <li><a class="dropdown-item" href="../Basic/UserForm.aspx">User</a></li>
                                <li><a class="dropdown-item" href="../Basic/ProjectForm.aspx">Project</a></li>
                                <li><a class="dropdown-item" href="../Basic/TaskForm.aspx">Task</a></li>
                                <li><a class="dropdown-item" href="../Basic/SubTaskForm.aspx">SubTask</a></li>
                                <li><a class="dropdown-item" href="../Basic/MilestoneForm.aspx">Milestone</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown">
                                Complex Forms
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="UserProjects.aspx">User Projects</a></li>
                                <li><a class="dropdown-item active" href="ProjectMilestone.aspx">Project Milestones</a></li>
                                <li><a class="dropdown-item" href="TopPerformers.aspx">Top Performers</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="container mt-4">
            <div class="form-section">
                <h2>Project Milestones</h2>

                <!-- Project Dropdown -->
                <div class="mb-3">
                    <label for="ddlProjects" class="form-label">Select Project:</label>
                    <asp:DropDownList ID="ddlProjects" runat="server" CssClass="form-select" AutoPostBack="true"
                        DataSourceID="SqlDataSourceProjects"
                        DataTextField="PROJECT_NAME"
                        DataValueField="PROJECT_ID" />
                </div>

                <!-- Project Details -->
                <div class="mt-4">
                    <h5>Project Information</h5>
                    <asp:DetailsView ID="ProjectDetailsView" runat="server"
                        CssClass="table table-bordered"
                        DataSourceID="SqlDataSourceProjectDetails"
                        AutoGenerateRows="true"
                        Width="100%" />
                </div>

                <!-- Milestone Grid -->
                <div class="mt-5">
                    <h5>Milestones</h5>
                    <asp:GridView ID="GridViewMilestones" runat="server"
                        CssClass="table table-striped table-hover"
                        DataSourceID="SqlDataSourceMilestones"
                        AutoGenerateColumns="False"
                        Width="100%">
                        <Columns>
                            <asp:BoundField DataField="MILESTONE_ID" HeaderText="Milestone ID" />
                            <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Milestone Name" />
                            <asp:BoundField DataField="MILESTONE_DUE_DATE" HeaderText="Due Date" DataFormatString="{0:dd-MMM-yyyy}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Data Sources -->
        <asp:SqlDataSource ID="SqlDataSourceProjects" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT PROJECT_ID, PROJECT_NAME FROM PROJECTS ORDER BY PROJECT_NAME" />

        <asp:SqlDataSource ID="SqlDataSourceProjectDetails" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT PROJECT_NAME, PROJECT_START_DATE, PROJECT_DUE_DATE, PROJECT_STATUS FROM PROJECTS WHERE PROJECT_ID = :PROJECT_ID">
            <SelectParameters>
                <asp:ControlParameter Name="PROJECT_ID" ControlID="ddlProjects" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceMilestones" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT MILESTONE_ID, MILESTONE_NAME, MILESTONE_DUE_DATE FROM MILESTONES WHERE PROJECT_ID = :PROJECT_ID ORDER BY MILESTONE_DUE_DATE ASC">
            <SelectParameters>
                <asp:ControlParameter Name="PROJECT_ID" ControlID="ddlProjects" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
