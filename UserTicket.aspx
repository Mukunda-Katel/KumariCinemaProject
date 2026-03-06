<%@ Page Title="User Ticket History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTicket.aspx.cs" Inherits="kumaricinema.UserTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
    <h2>User Ticket History (Last 6 Months)</h2>
  <p>View ticket details for any user for the past six months.</p>
        
        <!-- User Selection -->
        <div class="row mb-4">
         <div class="col-md-4">
           <label for="ddlUsers" class="form-label"><strong>Select User:</strong></label>
          <asp:DropDownList ID="ddlUsers" runat="server" CssClass="form-control" AutoPostBack="true" 
          DataSourceID="SqlDataSourceUsers" DataTextField="USERNAME" DataValueField="USERID"
        OnSelectedIndexChanged="ddlUsers_SelectedIndexChanged" AppendDataBoundItems="true">
   <asp:ListItem Text="-- Select a User --" Value="" />
             </asp:DropDownList>
     <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
       ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
     SelectCommand="SELECT USERID, USERNAME FROM USERS ORDER BY USERNAME">
                </asp:SqlDataSource>
 </div>
    </div>

 <!-- User Details Panel -->
        <asp:Panel ID="pnlUserDetails" runat="server" Visible="false" CssClass="mb-4">
       <div class="card">
          <div class="card-header bg-primary text-white">
   <h4>User Information</h4>
             </div>
           <div class="card-body">
         <asp:FormView ID="fvUserDetails" runat="server" DataSourceID="SqlDataSourceUserDetails" 
   CellPadding="4" ForeColor="Black" BackColor="White" BorderColor="#DEDFDE" 
  BorderStyle="None" BorderWidth="1px" GridLines="Vertical" Width="100%" DataKeyNames="USERID">
             <InsertItemTemplate>
                 USERID:
                 <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' />
                 <br />
                 USERNAME:
                 <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                 <br />
                 CONTACTNUMBER:
                 <asp:TextBox ID="CONTACTNUMBERTextBox" runat="server" Text='<%# Bind("CONTACTNUMBER") %>' />
                 <br />
                 EMAIL:
                 <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                 <br />
                 ADDRESS:
                 <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                 <br />
                 <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                 &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
             </InsertItemTemplate>
             <ItemTemplate>
                 USERID:
                 <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' />
                 <br />
                 USERNAME:
                 <asp:Label ID="USERNAMELabel" runat="server" Text='<%# Bind("USERNAME") %>' />
                 <br />
                 CONTACTNUMBER:
                 <asp:Label ID="CONTACTNUMBERLabel" runat="server" Text='<%# Bind("CONTACTNUMBER") %>' />
                 <br />
                 EMAIL:
                 <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("EMAIL") %>' />
                 <br />
                 ADDRESS:
                 <asp:Label ID="ADDRESSLabel" runat="server" Text='<%# Bind("ADDRESS") %>' />
                 <br />
             </ItemTemplate>
             <EditItemTemplate>
                 USERID:
                 <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>' />
                 <br />
                 USERNAME:
                 <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                 <br />
                 CONTACTNUMBER:
                 <asp:TextBox ID="CONTACTNUMBERTextBox" runat="server" Text='<%# Bind("CONTACTNUMBER") %>' />
                 <br />
                 EMAIL:
                 <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                 <br />
                 ADDRESS:
                 <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                 <br />
                 <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                 &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
             </EditItemTemplate>
       <EmptyDataTemplate>
    <p>No user details found.</p>
             </EmptyDataTemplate>
  <RowStyle BackColor="#F7F7DE" />
    </asp:FormView>
           <asp:SqlDataSource ID="SqlDataSourceUserDetails" runat="server" 
  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
     ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT USERID, USERNAME, CONTACTNUMBER, EMAIL, ADDRESS FROM USERS WHERE (USERID = :USERID)">
<SelectParameters>
         <asp:ControlParameter ControlID="ddlUsers" Name="USERID" PropertyName="SelectedValue" Type="Decimal" DefaultValue="1" />
              </SelectParameters>
         </asp:SqlDataSource>
       </div>
     </div>
        </asp:Panel>

        <!-- Tickets Grid -->
      <asp:Panel ID="pnlTickets" runat="server" Visible="false">
        <div class="card">
          <div class="card-header bg-success text-white">
        <h4>Tickets Purchased (Last 6 Months)</h4>
   </div>
     <div class="card-body">
       <asp:Label ID="lblTicketCount" runat="server" CssClass="mb-3 d-block"></asp:Label>
   <asp:GridView ID="gvUserTickets" runat="server" AutoGenerateColumns="False" 
           DataSourceID="SqlDataSourceUserTickets" CellPadding="4" GridLines="None" 
  BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
    CellSpacing="1" CssClass="table table-striped" EmptyDataText="No tickets found for this user in the last 6 months."
        AllowPaging="True" PageSize="10">
          <Columns>
             <asp:BoundField DataField="TICKETNUMBER" HeaderText="Ticket #" SortExpression="TICKETNUMBER" />
          <asp:BoundField DataField="TICKETSTATUS" HeaderText="Status" SortExpression="TICKETSTATUS" />
        <asp:BoundField DataField="TITLE" HeaderText="Movie" SortExpression="TITLE" />
            <asp:BoundField DataField="SHOWDATE" HeaderText="Show Date" SortExpression="SHOWDATE" DataFormatString="{0:dd-MMM-yyyy}" />
    <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" />
  <asp:BoundField DataField="THEATRENAME" HeaderText="Theatre" SortExpression="THEATRENAME" />
  <asp:BoundField DataField="HALLNAME" HeaderText="Hall" SortExpression="HALLNAME" />
            <asp:BoundField DataField="SEATINFO" HeaderText="Seat" SortExpression="SEATINFO" />
           <asp:BoundField DataField="AMOUNT" HeaderText="Price" SortExpression="AMOUNT" DataFormatString="Rs. {0:N2}" />
              <asp:BoundField DataField="CONFIRMATIONNUMBER" HeaderText="Confirmation #" SortExpression="CONFIRMATIONNUMBER" />
             <asp:BoundField DataField="PAYMENTSTATUS" HeaderText="Payment" SortExpression="PAYMENTSTATUS" />
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
       <asp:SqlDataSource ID="SqlDataSourceUserTickets" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
     ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
 SelectCommand="SELECT T.TICKETID, T.TICKETNUMBER, T.TICKETSTATUS, M.TITLE, S.SHOWDATE, S.SHOWTIME, S.STARTTIME, S.ENDTIME, TH.THEATRENAME, TH.THEATRECITY, H.HALLNAME, H.EXPERIENCETYPE, SE.SEATROW || '-' || SE.SEATNUMBER AS SEATINFO, P.AMOUNT, B.CONFIRMATIONNUMBER, PY.PAYMENTSTATUS, PY.PAYMENTMETHOD FROM TICKET T INNER JOIN BOOKING B ON T.BOOKINGID = B.BOOKINGID INNER JOIN USERS U ON B.USERID = U.USERID INNER JOIN SHOWS S ON B.SHOWID = S.SHOWID INNER JOIN MOVIE M ON S.MOVIEID = M.MOVIEID INNER JOIN HALL H ON S.HALLID = H.HALLID INNER JOIN THEATRE TH ON H.THEATREID = TH.THEATREID INNER JOIN SEAT SE ON T.SEATID = SE.SEATID INNER JOIN PRICE P ON T.PRICEID = P.PRICEID INNER JOIN PAYMENT PY ON B.PAYMENTID = PY.PAYMENTID WHERE U.USERID = :USERID AND S.SHOWDATE &gt;= ADD_MONTHS(SYSDATE, -6) ORDER BY S.SHOWDATE DESC, S.SHOWTIME">
     <SelectParameters>
               <asp:ControlParameter ControlID="ddlUsers" Name="USERID" PropertyName="SelectedValue" Type="Decimal" DefaultValue="1" />
 </SelectParameters>
        </asp:SqlDataSource>
 </div>
            </div>
        </asp:Panel>

    <!-- Summary Statistics -->
        <asp:Panel ID="pnlSummary" runat="server" Visible="false" CssClass="mt-4">
         <div class="card">
      <div class="card-header bg-info text-white">
        <h4>Summary</h4>
     </div>
     <div class="card-body">
     <asp:GridView ID="gvSummary" runat="server" AutoGenerateColumns="False" 
               DataSourceID="SqlDataSourceSummary" CellPadding="4" GridLines="None" 
     BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
     CellSpacing="1" CssClass="table" EmptyDataText="No summary data available.">
         <Columns>
     <asp:BoundField DataField="TOTALTICKETS" HeaderText="Total Tickets" />
       <asp:BoundField DataField="BOOKEDTICKETS" HeaderText="Booked" />
          <asp:BoundField DataField="CANCELLEDTICKETS" HeaderText="Cancelled" />
         <asp:BoundField DataField="TOTALSPENT" HeaderText="Total Spent" DataFormatString="Rs. {0:N2}" />
            </Columns>
            <HeaderStyle BackColor="#17a2b8" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#E3F2FD" ForeColor="Black" />
         </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSourceSummary" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT 
            COUNT(T.TICKETID) AS TOTALTICKETS,
     SUM(CASE WHEN T.TICKETSTATUS = 'Booked' THEN 1 ELSE 0 END) AS BOOKEDTICKETS,
   SUM(CASE WHEN T.TICKETSTATUS = 'Cancelled' THEN 1 ELSE 0 END) AS CANCELLEDTICKETS,
 SUM(CASE WHEN T.TICKETSTATUS = 'Booked' THEN P.AMOUNT ELSE 0 END) AS TOTALSPENT
     FROM TICKET T
       INNER JOIN BOOKING B ON T.BOOKINGID = B.BOOKINGID
      INNER JOIN SHOWS S ON B.SHOWID = S.SHOWID
       INNER JOIN PRICE P ON T.PRICEID = P.PRICEID
       WHERE B.USERID = :USERID
             AND S.SHOWDATE >= ADD_MONTHS(SYSDATE, -6)">
                <SelectParameters>
            <asp:ControlParameter ControlID="ddlUsers" Name="USERID" PropertyName="SelectedValue" Type="Decimal" />
       </SelectParameters>
</asp:SqlDataSource>
    </div>
   </div>
        </asp:Panel>
    </div>
</asp:Content>
