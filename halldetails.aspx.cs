using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kumaricinema
{
    public partial class halldetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            FormView1.PageIndex = e.NewPageIndex;
            FormView1.DataBind();
        }
    }
}