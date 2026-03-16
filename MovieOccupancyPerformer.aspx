<%@ Page Title="Movie Occupancy Performers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieOccupancyPerformer.aspx.cs" Inherits="kumaricinema.MovieOccupancyPerformer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Movie Theatre Occupancy Performers</h2>
        <p>View the top 3 Theatre/City/Hall combinations with maximum seat occupancy for any movie. Only paid tickets are counted.</p>
        
    <!-- Movie Selection -->
      <div class="row mb-4">
            <div class="col-md-5">
      <label class="form-label"><strong>Select Movie:</strong></label>
    <asp:DropDownList ID="ddlMovies" runat="server" CssClass="form-control" AutoPostBack="true" 
           DataSourceID="SqlDataSourceMovies" DataTextField="TITLE" DataValueField="MOVIEID"
        OnSelectedIndexChanged="ddlMovies_SelectedIndexChanged" AppendDataBoundItems="true">
         <asp:ListItem Text="-- Select a Movie --" Value="" />
     </asp:DropDownList>
   <asp:SqlDataSource ID="SqlDataSourceMovies" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
  ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
          SelectCommand="SELECT MOVIEID, TITLE || ' (' || &quot;LANGUAGE&quot; || ', ' || GENRE || ')' AS TITLE FROM MOVIE ORDER BY TITLE">
      </asp:SqlDataSource>
            </div>
            <div class="col-md-3 d-flex align-items-end">
<asp:Button ID="btnSearch" runat="server" Text="Show Top Performers" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
            </div>
        </div>

        <!-- Movie Details Panel -->
   <asp:Panel ID="pnlMovieDetails" runat="server" Visible="false" CssClass="mb-4">
            <div class="card">
            <div class="card-header bg-dark text-white">
 <h4>Movie Information</h4>
     </div>
            <div class="card-body">
           <asp:FormView ID="fvMovieDetails" runat="server" DataSourceID="SqlDataSourceMovieDetails" 
CellPadding="4" ForeColor="Black" BackColor="White" BorderColor="#DEDFDE" 
     BorderStyle="None" BorderWidth="1px" GridLines="Vertical" Width="100%" DataKeyNames="MOVIEID">
               <InsertItemTemplate>
                   MOVIEID:
                   <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                   <br />
                   TITLE:
                   <asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' />
                   <br />
                   GENRE:
                   <asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' />
                   <br />
                   LANGUAGE:
                   <asp:TextBox ID="LANGUAGETextBox" runat="server" Text='<%# Bind("LANGUAGE") %>' />
                   <br />
                   DURATION:
                   <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' />
                   <br />
                   RELEASEDATE:
                   <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                   <br />
                   <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                   &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
               </InsertItemTemplate>
               <ItemTemplate>
                   MOVIEID:
                   <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Eval("MOVIEID") %>' />
                   <br />
                   TITLE:
                   <asp:Label ID="TITLELabel" runat="server" Text='<%# Bind("TITLE") %>' />
                   <br />
                   GENRE:
                   <asp:Label ID="GENRELabel" runat="server" Text='<%# Bind("GENRE") %>' />
                   <br />
                   LANGUAGE:
                   <asp:Label ID="LANGUAGELabel" runat="server" Text='<%# Bind("LANGUAGE") %>' />
                   <br />
                   DURATION:
                   <asp:Label ID="DURATIONLabel" runat="server" Text='<%# Bind("DURATION") %>' />
                   <br />
                   RELEASEDATE:
                   <asp:Label ID="RELEASEDATELabel" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                   <br />
               </ItemTemplate>
               <EditItemTemplate>
                   MOVIEID:
                   <asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>' />
                   <br />
                   TITLE:
                   <asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' />
                   <br />
                   GENRE:
                   <asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' />
                   <br />
                   LANGUAGE:
                   <asp:TextBox ID="LANGUAGETextBox" runat="server" Text='<%# Bind("LANGUAGE") %>' />
                   <br />
                   DURATION:
                   <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' />
                   <br />
                   RELEASEDATE:
                   <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                   <br />
                   <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                   &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
               </EditItemTemplate>
      <EmptyDataTemplate>
     <p>No movie details found.</p>
         </EmptyDataTemplate>
           <RowStyle BackColor="#F7F7DE" />
      </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSourceMovieDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
     ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
       SelectCommand="SELECT MOVIEID, TITLE, GENRE, &quot;LANGUAGE&quot;, DURATION, RELEASEDATE FROM MOVIE WHERE (MOVIEID = :MOVIEID)">
          <SelectParameters>
                <asp:ControlParameter ControlID="ddlMovies" Name="MOVIEID" PropertyName="SelectedValue" Type="Decimal" DefaultValue="1" />
             </SelectParameters>
        </asp:SqlDataSource>
             </div>
            </div>
        </asp:Panel>

     <!-- Top 3 Occupancy Performers -->
        <asp:Panel ID="pnlTopPerformers" runat="server" Visible="false">
    <div class="card">
      <div class="card-header bg-success text-white">
      <h4>Top 3 Theatre/City/Hall - Maximum Seat Occupancy (Paid Tickets Only)</h4>
                </div>
       <div class="card-body">
 <asp:Label ID="lblResultMessage" runat="server" CssClass="mb-3 d-block"></asp:Label>
        <asp:GridView ID="gvTopPerformers" runat="server" AutoGenerateColumns="False" 
     DataSourceID="SqlDataSourceTopPerformers" CellPadding="4" GridLines="None" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
       CellSpacing="1" CssClass="table table-striped" 
          EmptyDataText="No occupancy data found for this movie.">
              <Columns>
        <asp:TemplateField HeaderText="Rank">
         <ItemTemplate>
           <span class="badge badge-pill" style='<%# GetRankBadgeStyle(Container.DataItemIndex + 1) %>'>
          <%# Container.DataItemIndex + 1 %>
    </span>
              </ItemTemplate>
       <ItemStyle HorizontalAlign="Center" Width="60px" />
</asp:TemplateField>
            <asp:BoundField DataField="THEATRENAME" HeaderText="Theatre" SortExpression="THEATRENAME" />
     <asp:BoundField DataField="THEATRECITY" HeaderText="City" SortExpression="THEATRECITY" />
          <asp:BoundField DataField="HALLNAME" HeaderText="Hall" SortExpression="HALLNAME" />
       <asp:BoundField DataField="EXPERIENCETYPE" HeaderText="Experience" SortExpression="EXPERIENCETYPE" />
               <asp:BoundField DataField="HALLCAPACITY" HeaderText="Hall Capacity" SortExpression="HALLCAPACITY" />
   <asp:BoundField DataField="TOTALSHOWS" HeaderText="Total Shows" SortExpression="TOTALSHOWS" />
    <asp:BoundField DataField="PAIDTICKETS" HeaderText="Paid Tickets" SortExpression="PAIDTICKETS" />
  <asp:BoundField DataField="TOTALSEATS" HeaderText="Total Seats Available" SortExpression="TOTALSEATS" />
     <asp:TemplateField HeaderText="Occupancy %">
   <ItemTemplate>
        <div class="progress" style="height: 25px; min-width: 100px;">
    <div class="progress-bar" role="progressbar" 
           style='<%# "width: " + Eval("OCCUPANCYPERCENT") + "%; background-color: " + GetOccupancyColor(Convert.ToDecimal(Eval("OCCUPANCYPERCENT"))) %>'
 aria-valuenow='<%# Eval("OCCUPANCYPERCENT") %>' aria-valuemin="0" aria-valuemax="100">
           <%# Eval("OCCUPANCYPERCENT", "{0:N2}") %>%
            </div>
        </div>
     </ItemTemplate>
        <ItemStyle Width="150px" />
        </asp:TemplateField>
        </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
      <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
  <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
      <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
      <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
 <asp:SqlDataSource ID="SqlDataSourceTopPerformers" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
     ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
           SelectCommand="SELECT * FROM ( SELECT TH.THEATREID, TH.THEATRENAME, TH.THEATRECITY, H.HALLID, H.HALLNAME, H.HALLCAPACITY, H.EXPERIENCETYPE, COUNT(DISTINCT S.SHOWID) AS TOTALSHOWS, COUNT(T.TICKETID) AS PAIDTICKETS, COUNT(DISTINCT S.SHOWID) * H.HALLCAPACITY AS TOTALSEATS, ROUND((COUNT(T.TICKETID) * 100.0) / NULLIF(COUNT(DISTINCT S.SHOWID) * H.HALLCAPACITY, 0), 2) AS OCCUPANCYPERCENT FROM THEATRE TH INNER JOIN HALL H ON TH.THEATREID = H.THEATREID INNER JOIN SHOWS S ON H.HALLID = S.HALLID INNER JOIN MOVIE M ON S.MOVIEID = M.MOVIEID LEFT JOIN BOOKING B ON S.SHOWID = B.SHOWID LEFT JOIN PAYMENT PY ON B.PAYMENTID = PY.PAYMENTID AND PY.PAYMENTSTATUS = 'Completed' LEFT JOIN TICKET T ON B.BOOKINGID = T.BOOKINGID AND T.TICKETSTATUS = 'Booked' AND PY.PAYMENTSTATUS = 'Completed' WHERE M.MOVIEID = :MOVIEID GROUP BY TH.THEATREID, TH.THEATRENAME, TH.THEATRECITY, H.HALLID, H.HALLNAME, H.HALLCAPACITY, H.EXPERIENCETYPE ORDER BY OCCUPANCYPERCENT DESC NULLS LAST ) WHERE ROWNUM &lt;= 3">
  <SelectParameters>
            <asp:ControlParameter ControlID="ddlMovies" Name="MOVIEID" PropertyName="SelectedValue" Type="Decimal" DefaultValue="1" />
   </SelectParameters>
     </asp:SqlDataSource>
             </div>
            </div>
  </asp:Panel>

        <!-- All Theatre Performance Summary -->
      <asp:Panel ID="pnlAllPerformers" runat="server" Visible="false" CssClass="mt-4">
   <div class="card">
 <div class="card-header bg-info text-white">
       <h4>All Theatre/Hall Performance Summary</h4>
          </div>
   <div class="card-body">
      <asp:GridView ID="gvAllPerformers" runat="server" AutoGenerateColumns="False" 
     DataSourceID="SqlDataSourceAllPerformers" CellPadding="4" GridLines="None" 
       BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellSpacing="1" CssClass="table" EmptyDataText="No performance data available."
          AllowPaging="True" PageSize="10" AllowSorting="True">
       <Columns>
   <asp:BoundField DataField="THEATRENAME" HeaderText="Theatre" SortExpression="THEATRENAME" />
                  <asp:BoundField DataField="THEATRECITY" HeaderText="City" SortExpression="THEATRECITY" />
   <asp:BoundField DataField="HALLNAME" HeaderText="Hall" SortExpression="HALLNAME" />
             <asp:BoundField DataField="TOTALSHOWS" HeaderText="Shows" SortExpression="TOTALSHOWS" />
    <asp:BoundField DataField="PAIDTICKETS" HeaderText="Paid Tickets" SortExpression="PAIDTICKETS" />
   <asp:BoundField DataField="OCCUPANCYPERCENT" HeaderText="Occupancy %" SortExpression="OCCUPANCYPERCENT" DataFormatString="{0:N2}%" />
           </Columns>
        <HeaderStyle BackColor="#17a2b8" Font-Bold="True" ForeColor="White" />
         <RowStyle BackColor="#E3F2FD" ForeColor="Black" />
        <AlternatingRowStyle BackColor="#d1ecf1" />
     <PagerStyle BackColor="#17a2b8" ForeColor="White" HorizontalAlign="Center" />
 </asp:GridView>
       <asp:SqlDataSource ID="SqlDataSourceAllPerformers" runat="server" 
       ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
      SelectCommand="SELECT TH.THEATRENAME, TH.THEATRECITY, H.HALLNAME, COUNT(DISTINCT S.SHOWID) AS TOTALSHOWS, COUNT(T.TICKETID) AS PAIDTICKETS, ROUND((COUNT(T.TICKETID) * 100.0) / NULLIF(COUNT(DISTINCT S.SHOWID) * H.HALLCAPACITY, 0), 2) AS OCCUPANCYPERCENT FROM THEATRE TH INNER JOIN HALL H ON TH.THEATREID = H.THEATREID INNER JOIN SHOWS S ON H.HALLID = S.HALLID INNER JOIN MOVIE M ON S.MOVIEID = M.MOVIEID LEFT JOIN BOOKING B ON S.SHOWID = B.SHOWID LEFT JOIN PAYMENT PY ON B.PAYMENTID = PY.PAYMENTID AND PY.PAYMENTSTATUS = 'Completed' LEFT JOIN TICKET T ON B.BOOKINGID = T.BOOKINGID AND T.TICKETSTATUS = 'Booked' AND PY.PAYMENTSTATUS = 'Completed' WHERE M.MOVIEID = :MOVIEID GROUP BY TH.THEATRENAME, TH.THEATRECITY, H.HALLNAME, H.HALLCAPACITY ORDER BY OCCUPANCYPERCENT DESC NULLS LAST">
     <SelectParameters>
           <asp:ControlParameter ControlID="ddlMovies" Name="MOVIEID" PropertyName="SelectedValue" Type="Decimal" DefaultValue="1" />
   </SelectParameters>
   </asp:SqlDataSource>
           </div>
            </div>
        </asp:Panel>

        <!-- Overall Movie Statistics -->
     <asp:Panel ID="pnlMovieStats" runat="server" Visible="false" CssClass="mt-4">
<div class="card">
         <div class="card-header bg-warning text-dark">
           <h4>Overall Movie Statistics</h4>
        </div>
       <div class="card-body">
      <asp:GridView ID="gvMovieStats" runat="server" AutoGenerateColumns="False" 
              DataSourceID="SqlDataSourceMovieStats" CellPadding="4" GridLines="None" 
    BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
  CellSpacing="1" CssClass="table" EmptyDataText="No statistics available.">
      <Columns>
   <asp:BoundField DataField="TOTALTHEATRES" HeaderText="Theatres Screening" />
      <asp:BoundField DataField="TOTALHALLS" HeaderText="Halls Used" />
              <asp:BoundField DataField="TOTALSHOWS" HeaderText="Total Shows" />
          <asp:BoundField DataField="TOTALPAIDTICKETS" HeaderText="Total Paid Tickets" />
           <asp:BoundField DataField="OVERALLOCCUPANCY" HeaderText="Overall Occupancy %" DataFormatString="{0:N2}%" />
 </Columns>
            <HeaderStyle BackColor="#ffc107" Font-Bold="True" ForeColor="#212529" />
              <RowStyle BackColor="#fff3cd" ForeColor="Black" />
       </asp:GridView>
   <asp:SqlDataSource ID="SqlDataSourceMovieStats" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
   ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
              SelectCommand="SELECT 
        COUNT(DISTINCT TH.THEATREID) AS TOTALTHEATRES,
  COUNT(DISTINCT H.HALLID) AS TOTALHALLS,
              COUNT(DISTINCT S.SHOWID) AS TOTALSHOWS,
         COUNT(T.TICKETID) AS TOTALPAIDTICKETS,
               ROUND((COUNT(T.TICKETID) * 100.0) / NULLIF(SUM(DISTINCT S.SHOWID * H.HALLCAPACITY), 0), 2) AS OVERALLOCCUPANCY
     FROM THEATRE TH
   INNER JOIN HALL H ON TH.THEATREID = H.THEATREID
    INNER JOIN SHOWS S ON H.HALLID = S.HALLID
     INNER JOIN MOVIE M ON S.MOVIEID = M.MOVIEID
        LEFT JOIN BOOKING B ON S.SHOWID = B.SHOWID
              LEFT JOIN PAYMENT PY ON B.PAYMENTID = PY.PAYMENTID AND PY.PAYMENTSTATUS = 'Completed'
       LEFT JOIN TICKET T ON B.BOOKINGID = T.BOOKINGID AND T.TICKETSTATUS = 'Booked' AND PY.PAYMENTSTATUS = 'Completed'
              WHERE M.MOVIEID = :MOVIEID">
      <SelectParameters>
           <asp:ControlParameter ControlID="ddlMovies" Name="MOVIEID" PropertyName="SelectedValue" Type="Decimal" />
              </SelectParameters>
          </asp:SqlDataSource>
    </div>
            </div>
   </asp:Panel>
    </div>
</asp:Content>
