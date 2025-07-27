<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPerformer.aspx.cs" Inherits="lscorporation.Pages.Forms.Complex.TopPerformer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performers</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Top 3 Performers by Completed Tasks</h2>

        <asp:GridView ID="GridViewTop" runat="server"
            DataSourceID="SqlDataSourceTop"
            AutoGenerateColumns="true"
            Width="600px">
        </asp:GridView>

        <!-- SqlDataSource with SQL JOIN + GROUP + FILTER + RANKING -->
        <asp:SqlDataSource ID="SqlDataSourceTop" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="System.Data.OracleClient"
            SelectCommand="
                SELECT *
                FROM (
                    SELECT 
                        U.USER_ID,
                        U.USER_FIRST_NAME || ' ' || U.USER_LAST_NAME AS FULL_NAME,
                        COUNT(*) AS COMPLETED_TASKS
                    FROM USERS U
                    INNER JOIN USERPROJECTTASK UPT ON U.USER_ID = UPT.USER_ID
                    INNER JOIN TASKS T ON UPT.TASK_ID = T.TASK_ID
                    WHERE T.TASK_STATUS != 'Pending'
                    GROUP BY U.USER_ID, U.USER_FIRST_NAME, U.USER_LAST_NAME
                    ORDER BY COMPLETED_TASKS DESC
                )
                WHERE ROWNUM <= 3">
        </asp:SqlDataSource>
    </form>
</body>
</html>
