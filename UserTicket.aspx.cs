using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kumaricinema
{
    public partial class UserTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
{
            if (!IsPostBack)
        {
     // Hide panels initially
                pnlUserDetails.Visible = false;
       pnlTickets.Visible = false;
            pnlSummary.Visible = false;
    }
        }

   protected void ddlUsers_SelectedIndexChanged(object sender, EventArgs e)
      {
            if (!string.IsNullOrEmpty(ddlUsers.SelectedValue))
            {
   // Show all panels when a user is selected
                pnlUserDetails.Visible = true;
            pnlTickets.Visible = true;
             pnlSummary.Visible = true;

                // Rebind the data sources
                fvUserDetails.DataBind();
                gvUserTickets.DataBind();
                gvSummary.DataBind();

     // Update ticket count label
        int ticketCount = gvUserTickets.Rows.Count;
         if (ticketCount > 0)
 {
 lblTicketCount.Text = $"Found {ticketCount} ticket(s) for the selected user in the last 6 months.";
        lblTicketCount.CssClass = "text-success font-weight-bold";
       }
  else
                {
                    lblTicketCount.Text = "No tickets found for this user in the last 6 months.";
             lblTicketCount.CssClass = "text-warning font-weight-bold";
         }
    }
            else
   {
             // Hide panels when no user is selected
    pnlUserDetails.Visible = false;
      pnlTickets.Visible = false;
         pnlSummary.Visible = false;
          }
        }
    }
}
