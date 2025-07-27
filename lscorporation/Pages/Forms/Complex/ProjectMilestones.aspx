<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMilestone.aspx.cs" Inherits="lscorporation.Pages.Forms.Complex.ProjectMilestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Milestones</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Project Milestones</h2>

        <!-- Select Project -->
        <asp:DropDownList ID="ddlProjects" runat="server" AutoPostBack="true"
            DataSourceID="SqlDataSourceProjects"
            DataTextField="PROJECT_NAME"
            DataValueField="PROJECT_ID" />

        <hr />

        <!-- Project Info -->
        <asp:DetailsView ID="ProjectDetailsView" runat="server"
            DataSourceID="SqlDataSourceProjectDetails"
            AutoGenerateRows="true" Width="400px">
        </asp:DetailsView>

        <br />

        <!-- Milestone List -->
        <asp:GridView ID="GridViewMilestones" runat="server"
            DataSourceID="SqlDataSourceMilestones"
            AutoGenerateColumns="true"
            Width="600px">
        </asp:GridView>

        <!-- All Projects for Dropdown -->
        <asp:SqlDataSource ID="SqlDataSourceProjects" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT PROJECT_ID, PROJECT_NAME FROM PROJECTS ORDER BY PROJECT_NAME">
        </asp:SqlDataSource>

        <!-- Selected Project Details -->
        <asp:SqlDataSource ID="SqlDataSourceProjectDetails" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT * FROM PROJECTS WHERE PROJECT_ID = :PROJECT_ID">
            <SelectParameters>
                <asp:ControlParameter Name="PROJECT_ID" ControlID="ddlProjects" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <!-- Milestones for Selected Project -->
        <asp:SqlDataSource ID="SqlDataSourceMilestones" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="
                SELECT M.MILESTONE_ID, M.MILESTONE_NAME, M.MILESTONE_DUE_DATE
                FROM MILESTONES M
                WHERE M.PROJECT_ID = :PROJECT_ID">
            <SelectParameters>
                <asp:ControlParameter Name="PROJECT_ID" ControlID="ddlProjects" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
