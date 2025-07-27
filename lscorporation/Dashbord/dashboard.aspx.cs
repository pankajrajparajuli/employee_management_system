using System;
using System.Data;
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

                    lblUsers.Text = GetCount(conn, "USERS");
                    lblProjects.Text = GetCount(conn, "PROJECTS");
                    lblTasks.Text = GetCount(conn, "TASKS");
                    lblMilestones.Text = GetCount(conn, "MILESTONES");

                    conn.Close();
                }
            }
        }

        private string GetCount(OracleConnection conn, string table)
        {
            OracleCommand cmd = new OracleCommand($"SELECT COUNT(*) FROM {table}", conn);
            return cmd.ExecuteScalar().ToString();
        }
    }
}
