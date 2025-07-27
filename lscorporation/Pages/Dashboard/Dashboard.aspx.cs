using System;
using System.Collections.Generic;
using Oracle.ManagedDataAccess.Client;

namespace lscorporation.Pages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (OracleConnection conn = new OracleConnection(connStr))
                {
                    conn.Open();

                    // Summary stats
                    lblUsers.Text = GetCount(conn, "USERS");
                    lblProjects.Text = GetCount(conn, "PROJECTS");
                    lblTasks.Text = GetCount(conn, "TASKS");
                    lblCompletedTasks.Text = GetCount(conn, "TASKS WHERE TASK_STATUS = 'Completed'");
                    lblMilestones.Text = GetCount(conn, "MILESTONES");
                    lblMilestonesMonth.Text = GetMilestonesThisMonth(conn);
                    lblTopPerformer.Text = GetTopPerformer(conn);

                    // Chart data
                    LoadProjectTaskChart(conn);      // bar + line
                    LoadTaskStatusChart(conn);       // pie

                    conn.Close();
                }
            }
        }

        private string GetCount(OracleConnection conn, string tableOrCondition)
        {
            string query = tableOrCondition.Contains("WHERE")
                ? $"SELECT COUNT(*) FROM {tableOrCondition.Split(new[] { "WHERE" }, StringSplitOptions.None)[0]} WHERE {tableOrCondition.Split(new[] { "WHERE" }, StringSplitOptions.None)[1]}"
                : $"SELECT COUNT(*) FROM {tableOrCondition}";

            using (OracleCommand cmd = new OracleCommand(query, conn))
            {
                return cmd.ExecuteScalar().ToString();
            }
        }

        private string GetMilestonesThisMonth(OracleConnection conn)
        {
            string query = @"
                SELECT COUNT(*) FROM MILESTONES
                WHERE EXTRACT(MONTH FROM MILESTONE_DUE_DATE) = :month
                  AND EXTRACT(YEAR FROM MILESTONE_DUE_DATE) = :year";

            using (OracleCommand cmd = new OracleCommand(query, conn))
            {
                cmd.Parameters.Add(":month", DateTime.Now.Month);
                cmd.Parameters.Add(":year", DateTime.Now.Year);
                return cmd.ExecuteScalar().ToString();
            }
        }

        private string GetTopPerformer(OracleConnection conn)
        {
            string query = @"
                SELECT * FROM (
                    SELECT 
                        U.USER_FIRST_NAME || ' ' || U.USER_LAST_NAME AS FullName,
                        COUNT(*) AS TaskCount
                    FROM USERS U
                    JOIN USERPROJECTTASKS UPT ON U.USER_ID = UPT.USER_ID
                    JOIN TASKS T ON UPT.TASK_ID = T.TASK_ID
                    WHERE T.TASK_STATUS = 'Completed'
                    GROUP BY U.USER_ID, U.USER_FIRST_NAME, U.USER_LAST_NAME
                    ORDER BY COUNT(*) DESC
                ) WHERE ROWNUM = 1";

            using (OracleCommand cmd = new OracleCommand(query, conn))
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    return reader["FullName"].ToString();
                }
                else
                {
                    return "-";
                }
            }
        }

        private void LoadProjectTaskChart(OracleConnection conn)
        {
            string query = @"
                SELECT P.PROJECT_NAME, COUNT(T.TASK_ID)
                FROM PROJECTS P
                JOIN USERPROJECTTASKS UPT ON P.PROJECT_ID = UPT.PROJECT_ID
                JOIN TASKS T ON UPT.TASK_ID = T.TASK_ID
                GROUP BY P.PROJECT_NAME
                ORDER BY P.PROJECT_NAME";

            using (OracleCommand cmd = new OracleCommand(query, conn))
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                List<string> labels = new List<string>();
                List<string> counts = new List<string>();

                while (reader.Read())
                {
                    labels.Add(reader.GetString(0));
                    counts.Add(reader.GetInt32(1).ToString());
                }

                hfProjectLabels.Value = string.Join(",", labels);
                hfTaskCounts.Value = string.Join(",", counts);
            }
        }

        private void LoadTaskStatusChart(OracleConnection conn)
        {
            string query = @"
                SELECT TASK_STATUS, COUNT(*) 
                FROM TASKS 
                GROUP BY TASK_STATUS
                ORDER BY TASK_STATUS";

            using (OracleCommand cmd = new OracleCommand(query, conn))
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                List<string> labels = new List<string>();
                List<string> counts = new List<string>();

                while (reader.Read())
                {
                    labels.Add(reader.GetString(0));
                    counts.Add(reader.GetInt32(1).ToString());
                }

                hfTaskStatusLabels.Value = string.Join(",", labels);
                hfTaskStatusCounts.Value = string.Join(",", counts);
            }
        }
    }
}
