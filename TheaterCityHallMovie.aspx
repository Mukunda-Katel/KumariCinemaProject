<%@ Page Title="Theater City Hall Movies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TheaterCityHallMovie.aspx.cs" Inherits="kumaricinema.TheaterCityHallMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
    <h2>Theater City Hall - Movie & Showtime</h2>
        <p>View movie and showtime details for any Theatre, City, and Hall.</p>
  
        <!-- Filter Selection -->
        <div class="row mb-4">
          <div class="col-md-3">
            <label class="form-label"><strong>Select City:</strong></label>
       <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control" AutoPostBack="true" 
         DataSourceID="SqlDataSourceCities" DataTextField="THEATRECITY" DataValueField="THEATRECITY"
        OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" AppendDataBoundItems="true">
           <asp:ListItem Text="-- Select City --" Value="" />
 </asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSourceCities" runat="server" 
   ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
 SelectCommand="SELECT DISTINCT THEATRECITY FROM THEATRE ORDER BY THEATRECITY">
     </asp:SqlDataSource>
            </div>
            <div class="col-md-3">
    <label class="form-label"><strong>Select Theatre:</strong></label>
 <asp:DropDownList ID="ddlTheatre" runat="server" CssClass="form-control" AutoPostBack="true" 
 DataSourceID="SqlDataSourceTheatres" DataTextField="THEATRENAME" DataValueField="THEATREID"
 OnSelectedIndexChanged="ddlTheatre_SelectedIndexChanged" AppendDataBoundItems="true">
       <asp:ListItem Text="-- Select Theatre --" Value="" />
       </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSourceTheatres" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
       ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT THEATREID, THEATRENAME FROM THEATRE WHERE THEATRECITY = :THEATRECITY ORDER BY THEATRENAME">
          <SelectParameters>
              <asp:ControlParameter ControlID="ddlCity" Name="THEATRECITY" PropertyName="SelectedValue" Type="String" />
               </SelectParameters>
          </asp:SqlDataSource>
            </div>
            <div class="col-md-3">
    <label class="form-label"><strong>Select Hall:</strong></label>
    <asp:DropDownList ID="ddlHall" runat="server" CssClass="form-control" AutoPostBack="true" 
        DataSourceID="SqlDataSourceHalls" DataTextField="HALLNAME" DataValueField="HALLID"
         OnSelectedIndexChanged="ddlHall_SelectedIndexChanged" AppendDataBoundItems="true">
             <asp:ListItem Text="-- All Halls --" Value="" />
  </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSourceHalls" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
      ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT HALLID, HALLNAME FROM HALL WHERE THEATREID = :THEATREID ORDER BY HALLNAME">
          <SelectParameters>
   <asp:ControlParameter ControlID="ddlTheatre" Name="THEATREID" PropertyName="SelectedValue" Type="Decimal" />
        </SelectParameters>
         </asp:SqlDataSource>
            </div>
 <div class="col-md-3 d-flex align-items-end">
     <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
            </div>
        </div>

      <!-- Theatre Details Panel -->
        <asp:Panel ID="pnlTheatreDetails" runat="server" Visible="false" CssClass="mb-4">
            <div class="card">
          <div class="card-header bg-dark text-white">
      <h4>Theatre Information</h4>
      </div>
                <div class="card-body">
            <asp:FormView ID="fvTheatreDetails" runat="server" DataSourceID="SqlDataSourceTheatreDetails" 
        CellPadding="4" ForeColor="Black" BackColor="White" BorderColor="#DEDFDE" 
         BorderStyle="None" BorderWidth="1px" GridLines="Vertical" Width="100%">
     <ItemTemplate>
   <div class="row">
      <div class="col-md-6">
    <p><strong>Theatre Name:</strong> <asp:Label ID="lblTheatreName" runat="server" Text='<%# Eval("THEATRENAME") %>' /></p>
      <p><strong>City:</strong> <asp:Label ID="lblCity" runat="server" Text='<%# Eval("THEATRECITY") %>' /></p>
   </div>
        <div class="col-md-6">
    <p><strong>Address:</strong> <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("THEATREADDRESS") %>' /></p>
      <p><strong>Contact:</strong> <asp:Label ID="lblContact" runat="server" Text='<%# Eval("THEATRECONTACTNUMBER") %>' /></p>
         </div>
      </div>
   </ItemTemplate>
        <EmptyDataTemplate>
  <p>No theatre details found.</p>
          </EmptyDataTemplate>
            <RowStyle BackColor="#F7F7DE" />
         </asp:FormView>
         <asp:SqlDataSource ID="SqlDataSourceTheatreDetails" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
   ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT THEATREID, THEATRENAME, THEATRECITY, THEATREADDRESS, THEATRECONTACTNUMBER FROM THEATRE WHERE THEATREID = :THEATREID">
           <SelectParameters>
            <asp:ControlParameter ControlID="ddlTheatre" Name="THEATREID" PropertyName="SelectedValue" Type="Decimal" />
    </SelectParameters>
        </asp:SqlDataSource>
 </div>
    </div>
        </asp:Panel>

        <!-- Hall Details Panel -->
        <asp:Panel ID="pnlHallDetails" runat="server" Visible="false" CssClass="mb-4">
        <div class="card">
   <div class="card-header bg-secondary text-white">
              <h4>Hall Information</h4>
                </div>
        <div class="card-body">
            <asp:GridView ID="gvHallDetails" runat="server" AutoGenerateColumns="False" 
      DataSourceID="SqlDataSourceHallDetails" CellPadding="4" GridLines="None" 
   BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
   CellSpacing="1" CssClass="table table-bordered" EmptyDataText="No hall information available.">
      <Columns>
           <asp:BoundField DataField="HALLNAME" HeaderText="Hall Name" SortExpression="HALLNAME" />
  <asp:BoundField DataField="HALLCAPACITY" HeaderText="Capacity" SortExpression="HALLCAPACITY" />
<asp:BoundField DataField="EXPERIENCETYPE" HeaderText="Experience" SortExpression="EXPERIENCETYPE" />
  <asp:BoundField DataField="SCREENSIZE" HeaderText="Screen Size" SortExpression="SCREENSIZE" />
                </Columns>
     <HeaderStyle BackColor="#6c757d" Font-Bold="True" ForeColor="White" />
          <RowStyle BackColor="#f8f9fa" ForeColor="Black" />
    <AlternatingRowStyle BackColor="#e9ecef" />
           </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceHallDetails" runat="server" 
      ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
             ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT HALLID, HALLNAME, HALLCAPACITY, EXPERIENCETYPE, SCREENSIZE FROM HALL WHERE THEATREID = :THEATREID AND (:HALLID IS NULL OR HALLID = :HALLID) ORDER BY HALLNAME">
         <SelectParameters>
            <asp:ControlParameter ControlID="ddlTheatre" Name="THEATREID" PropertyName="SelectedValue" Type="Decimal" />
<asp:ControlParameter ControlID="ddlHall" Name="HALLID" PropertyName="SelectedValue" Type="Decimal" DefaultValue="" />
     </SelectParameters>
    </asp:SqlDataSource>
         </div>
   </div>
        </asp:Panel>

    <!-- Movie & Showtime Grid -->
 <asp:Panel ID="pnlMovieShowtime" runat="server" Visible="false">
  <div class="card">
    <div class="card-header bg-success text-white">
                <h4>Movies & Showtimes</h4>
  </div>
           <div class="card-body">
      <asp:Label ID="lblResultCount" runat="server" CssClass="mb-3 d-block"></asp:Label>
    <asp:GridView ID="gvMovieShowtime" runat="server" AutoGenerateColumns="False" 
         DataSourceID="SqlDataSourceMovieShowtime" CellPadding="4" GridLines="None" 
  BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                   CellSpacing="1" CssClass="table table-striped" EmptyDataText="No movies or showtimes found for the selected criteria."
      AllowPaging="True" PageSize="15" AllowSorting="True">
    <Columns>
       <asp:BoundField DataField="TITLE" HeaderText="Movie Title" SortExpression="TITLE" />
           <asp:BoundField DataField="GENRE" HeaderText="Genre" SortExpression="GENRE" />
           <asp:BoundField DataField="LANGUAGE" HeaderText="Language" SortExpression="LANGUAGE" />
    <asp:BoundField DataField="DURATION" HeaderText="Duration (mins)" SortExpression="DURATION" />
<asp:BoundField DataField="HALLNAME" HeaderText="Hall" SortExpression="HALLNAME" />
       <asp:BoundField DataField="EXPERIENCETYPE" HeaderText="Experience" SortExpression="EXPERIENCETYPE" />
      <asp:BoundField DataField="SHOWDATE" HeaderText="Show Date" SortExpression="SHOWDATE" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" />
               <asp:BoundField DataField="STARTTIME" HeaderText="Start" SortExpression="STARTTIME" />
       <asp:BoundField DataField="ENDTIME" HeaderText="End" SortExpression="ENDTIME" />
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
     <asp:SqlDataSource ID="SqlDataSourceMovieShowtime" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
   ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT 
      M.MOVIEID,
   M.TITLE,
    M.GENRE,
        M.LANGUAGE,
            M.DURATION,
    M.RELEASEDATE,
            H.HALLID,
       H.HALLNAME,
               H.EXPERIENCETYPE,
            H.SCREENSIZE,
     S.SHOWID,
        S.SHOWDATE,
     S.SHOWTIME,
       S.STARTTIME,
 S.ENDTIME,
       TH.THEATRENAME,
      TH.THEATRECITY
     FROM SHOWS S
        INNER JOIN MOVIE M ON S.MOVIEID = M.MOVIEID
  INNER JOIN HALL H ON S.HALLID = H.HALLID
         INNER JOIN THEATRE TH ON H.THEATREID = TH.THEATREID
   WHERE TH.THEATREID = :THEATREID
     AND (:HALLID IS NULL OR H.HALLID = :HALLID)
            ORDER BY S.SHOWDATE, S.SHOWTIME, M.TITLE">
              <SelectParameters>
  <asp:ControlParameter ControlID="ddlTheatre" Name="THEATREID" PropertyName="SelectedValue" Type="Decimal" />
           <asp:ControlParameter ControlID="ddlHall" Name="HALLID" PropertyName="SelectedValue" Type="Decimal" DefaultValue="" />
        </SelectParameters>
        </asp:SqlDataSource>
    </div>
     </div>
        </asp:Panel>

        <!-- Movie Summary Panel -->
        <asp:Panel ID="pnlMovieSummary" runat="server" Visible="false" CssClass="mt-4">
            <div class="card">
          <div class="card-header bg-info text-white">
            <h4>Movie Summary</h4>
    </div>
       <div class="card-body">
    <asp:GridView ID="gvMovieSummary" runat="server" AutoGenerateColumns="False" 
       DataSourceID="SqlDataSourceMovieSummary" CellPadding="4" GridLines="None" 
         BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellSpacing="1" CssClass="table" EmptyDataText="No movie summary available.">
        <Columns>
   <asp:BoundField DataField="TITLE" HeaderText="Movie" SortExpression="TITLE" />
           <asp:BoundField DataField="GENRE" HeaderText="Genre" SortExpression="GENRE" />
         <asp:BoundField DataField="TOTALSHOWS" HeaderText="Total Shows" SortExpression="TOTALSHOWS" />
 </Columns>
       <HeaderStyle BackColor="#17a2b8" Font-Bold="True" ForeColor="White" />
           <RowStyle BackColor="#E3F2FD" ForeColor="Black" />
            <AlternatingRowStyle BackColor="#d1ecf1" />
</asp:GridView>
           <asp:SqlDataSource ID="SqlDataSourceMovieSummary" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
 ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
       SelectCommand="SELECT 
    M.TITLE,
      M.GENRE,
      COUNT(S.SHOWID) AS TOTALSHOWS
    FROM SHOWS S
 INNER JOIN MOVIE M ON S.MOVIEID = M.MOVIEID
  INNER JOIN HALL H ON S.HALLID = H.HALLID
        WHERE H.THEATREID = :THEATREID
       AND (:HALLID IS NULL OR H.HALLID = :HALLID)
 GROUP BY M.TITLE, M.GENRE
           ORDER BY TOTALSHOWS DESC">
             <SelectParameters>
   <asp:ControlParameter ControlID="ddlTheatre" Name="THEATREID" PropertyName="SelectedValue" Type="Decimal" />
  <asp:ControlParameter ControlID="ddlHall" Name="HALLID" PropertyName="SelectedValue" Type="Decimal" DefaultValue="" />
             </SelectParameters>
        </asp:SqlDataSource>
           </div>
 </div>
   </asp:Panel>
    </div>
</asp:Content>
