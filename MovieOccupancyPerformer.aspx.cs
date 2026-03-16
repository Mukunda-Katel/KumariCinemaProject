using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kumaricinema
{
    public partial class MovieOccupancyPerformer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
      if (!IsPostBack)
        {
       // Hide panels initially
    pnlMovieDetails.Visible = false;
        pnlTopPerformers.Visible = false;
           pnlAllPerformers.Visible = false;
         pnlMovieStats.Visible = false;
   }
        }

      protected void ddlMovies_SelectedIndexChanged(object sender, EventArgs e)
        {
        if (!string.IsNullOrEmpty(ddlMovies.SelectedValue))
    {
    ShowResults();
    }
      else
        {
          HideAllPanels();
     }
        }

      protected void btnSearch_Click(object sender, EventArgs e)
    {
            if (string.IsNullOrEmpty(ddlMovies.SelectedValue))
       {
              lblResultMessage.Text = "Please select a movie to view occupancy data.";
         lblResultMessage.CssClass = "text-danger font-weight-bold";
             pnlTopPerformers.Visible = true;
                pnlMovieDetails.Visible = false;
      pnlAllPerformers.Visible = false;
     pnlMovieStats.Visible = false;
      return;
}

            ShowResults();
        }

        private void ShowResults()
 {
            // Show all panels
    pnlMovieDetails.Visible = true;
   pnlTopPerformers.Visible = true;
   pnlAllPerformers.Visible = true;
         pnlMovieStats.Visible = true;

            // Rebind data sources
            fvMovieDetails.DataBind();
        gvTopPerformers.DataBind();
       gvAllPerformers.DataBind();
       gvMovieStats.DataBind();

    // Update result message
      int resultCount = gvTopPerformers.Rows.Count;
 if (resultCount > 0)
    {
       lblResultMessage.Text = string.Format("Showing top {0} theatre/hall performer(s) for the selected movie based on paid ticket occupancy.", resultCount);
      lblResultMessage.CssClass = "text-success font-weight-bold";
        }
   else
            {
        lblResultMessage.Text = "No occupancy data found for this movie. This movie may not have any paid bookings yet.";
  lblResultMessage.CssClass = "text-warning font-weight-bold";
    }
        }

  private void HideAllPanels()
        {
          pnlMovieDetails.Visible = false;
     pnlTopPerformers.Visible = false;
            pnlAllPerformers.Visible = false;
      pnlMovieStats.Visible = false;
     }

    // Helper method to get badge style based on rank
        protected string GetRankBadgeStyle(int rank)
        {
       switch (rank)
       {
        case 1:
  return "background-color: #FFD700; color: #000; font-size: 14px; padding: 8px 12px;"; // Gold
         case 2:
         return "background-color: #C0C0C0; color: #000; font-size: 14px; padding: 8px 12px;"; // Silver
  case 3:
      return "background-color: #CD7F32; color: #fff; font-size: 14px; padding: 8px 12px;"; // Bronze
     default:
           return "background-color: #6c757d; color: #fff; font-size: 14px; padding: 8px 12px;"; // Gray
   }
        }

// Helper method to get progress bar color based on occupancy percentage
        protected string GetOccupancyColor(decimal occupancyPercent)
   {
       if (occupancyPercent >= 80)
                return "#28a745"; // Green - Excellent
            else if (occupancyPercent >= 60)
     return "#17a2b8"; // Blue - Good
            else if (occupancyPercent >= 40)
    return "#ffc107"; // Yellow - Average
     else if (occupancyPercent >= 20)
     return "#fd7e14"; // Orange - Below Average
            else
         return "#dc3545"; // Red - Poor
        }
    }
}
