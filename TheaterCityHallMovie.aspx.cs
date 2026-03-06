using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kumaricinema
{
    public partial class TheaterCityHallMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         if (!IsPostBack)
        {
     // Hide panels initially
       pnlTheatreDetails.Visible = false;
    pnlHallDetails.Visible = false;
        pnlMovieShowtime.Visible = false;
              pnlMovieSummary.Visible = false;
            }
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
          // Clear dependent dropdowns
            ddlTheatre.Items.Clear();
    ddlTheatre.Items.Add(new ListItem("-- Select Theatre --", ""));
     ddlTheatre.DataBind();

            ddlHall.Items.Clear();
  ddlHall.Items.Add(new ListItem("-- All Halls --", ""));

     // Hide panels when city changes
            HideAllPanels();
  }

    protected void ddlTheatre_SelectedIndexChanged(object sender, EventArgs e)
     {
            // Clear hall dropdown and rebind
            ddlHall.Items.Clear();
            ddlHall.Items.Add(new ListItem("-- All Halls --", ""));
         ddlHall.DataBind();

   // Hide panels when theatre changes
         HideAllPanels();
}

        protected void ddlHall_SelectedIndexChanged(object sender, EventArgs e)
        {
        // Optionally auto-search when hall changes
if (!string.IsNullOrEmpty(ddlTheatre.SelectedValue))
            {
           ShowResults();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
      {
            if (string.IsNullOrEmpty(ddlTheatre.SelectedValue))
          {
  lblResultCount.Text = "Please select a City and Theatre to search.";
         lblResultCount.CssClass = "text-danger font-weight-bold";
        pnlMovieShowtime.Visible = true;
    pnlTheatreDetails.Visible = false;
 pnlHallDetails.Visible = false;
 pnlMovieSummary.Visible = false;
    return;
            }

            ShowResults();
        }

    private void ShowResults()
        {
     // Show all panels
    pnlTheatreDetails.Visible = true;
            pnlHallDetails.Visible = true;
     pnlMovieShowtime.Visible = true;
     pnlMovieSummary.Visible = true;

   // Rebind data sources
  fvTheatreDetails.DataBind();
            gvHallDetails.DataBind();
gvMovieShowtime.DataBind();
       gvMovieSummary.DataBind();

            // Update result count label
            int resultCount = gvMovieShowtime.Rows.Count;
   string hallText = string.IsNullOrEmpty(ddlHall.SelectedValue) ? "all halls" : ddlHall.SelectedItem.Text;
          
       if (resultCount > 0)
       {
    lblResultCount.Text = $"Found {resultCount} show(s) in {hallText} at {ddlTheatre.SelectedItem.Text}, {ddlCity.SelectedValue}.";
      lblResultCount.CssClass = "text-success font-weight-bold";
      }
     else
   {
          lblResultCount.Text = $"No shows found in {hallText} at {ddlTheatre.SelectedItem.Text}, {ddlCity.SelectedValue}.";
      lblResultCount.CssClass = "text-warning font-weight-bold";
            }
        }

        private void HideAllPanels()
     {
         pnlTheatreDetails.Visible = false;
  pnlHallDetails.Visible = false;
        pnlMovieShowtime.Visible = false;
 pnlMovieSummary.Visible = false;
        }
    }
}
