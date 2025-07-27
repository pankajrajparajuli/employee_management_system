namespace lscorporation.Pages
{
    public partial class Dashboard
    {
        protected global::System.Web.UI.HtmlControls.HtmlForm form1;

        protected global::System.Web.UI.WebControls.Label lblUsers;
        protected global::System.Web.UI.WebControls.Label lblProjects;
        protected global::System.Web.UI.WebControls.Label lblTasks;
        protected global::System.Web.UI.WebControls.Label lblCompletedTasks;
        protected global::System.Web.UI.WebControls.Label lblMilestones;
        protected global::System.Web.UI.WebControls.Label lblMilestonesMonth;
        protected global::System.Web.UI.WebControls.Label lblTopPerformer;

        protected global::System.Web.UI.WebControls.HiddenField hfProjectLabels;
        protected global::System.Web.UI.WebControls.HiddenField hfTaskCounts;

        // New hidden fields for pie chart
        protected global::System.Web.UI.WebControls.HiddenField hfTaskStatusLabels;
        protected global::System.Web.UI.WebControls.HiddenField hfTaskStatusCounts;
    }
}
