<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProject.aspx.cs" Inherits="lscorporation.Pages.Forms.Complex.UserProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Projects</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>User Projects</h2>

        <asp:DropDownList ID="ddlUsers" runat="server" AutoPostBack="true"
            DataSourceID="SqlDataSourceUsers"
            DataTextField="USER_FIRST_NAME"
            DataValueField="USER_ID" />
        
        <hr />

        <asp:DetailsView ID="UserDetailsView" runat="server"
            DataSourceID="SqlDataSourceUserDetails"
            AutoGenerateRows="true" Height="50px" Width="400px">
        </asp:DetailsView>

        <br />

        <asp:GridView ID="GridViewProjects" runat="server"
            DataSourceID="SqlDataSourceUserProjects"
            AutoGenerateColumns="true" Width="600px">
        </asp:GridView>

        <!-- SqlDataSource: Users -->
        <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT USER_ID, USER_FIRST_NAME FROM USERS ORDER BY USER_FIRST_NAME">
        </asp:SqlDataSource>

        <!-- SqlDataSource: Selected User Info -->
        <asp:SqlDataSource ID="SqlDataSourceUserDetails" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="SELECT * FROM USERS WHERE USER_ID = :USER_ID">
            <SelectParameters>
                <asp:ControlParameter Name="USER_ID" ControlID="ddlUsers" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <!-- SqlDataSource: User's Projects -->
        <asp:SqlDataSource ID="SqlDataSourceUserProjects" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="
                SELECT P.PROJECT_ID, P.PROJECT_NAME, P.PROJECT_START_DATE, P.PROJECT_DUE_DATE, P.PROJECT_STATUS
                FROM PROJECTS P
                INNER JOIN USERPROJECT U ON P.PROJECT_ID = U.PROJECT_ID
                WHERE U.USER_ID = :USER_ID">
            <SelectParameters>
                <asp:ControlParameter Name="USER_ID" ControlID="ddlUsers" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
