<%@ Page Title="Ticket Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketDetails.aspx.cs" Inherits="kumaricinema.TicketDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-3">
        <h2>Ticket Management<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" GridLines="None" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="TICKETID" HeaderText="TICKETID" ReadOnly="True" SortExpression="TICKETID" />
                <asp:BoundField DataField="TICKETSTATUS" HeaderText="TICKETSTATUS" SortExpression="TICKETSTATUS" />
                <asp:BoundField DataField="TICKETNUMBER" HeaderText="TICKETNUMBER" SortExpression="TICKETNUMBER" />
                <asp:BoundField DataField="SEATID" HeaderText="SEATID" SortExpression="SEATID" />
                <asp:BoundField DataField="CANCELLATIONID" HeaderText="CANCELLATIONID" SortExpression="CANCELLATIONID" />
                <asp:BoundField DataField="PRICEID" HeaderText="PRICEID" SortExpression="PRICEID" />
                <asp:BoundField DataField="BOOKINGID" HeaderText="BOOKINGID" SortExpression="BOOKINGID" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKETID&quot; = :TICKETID" InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKETID&quot;, &quot;TICKETSTATUS&quot;, &quot;TICKETNUMBER&quot;, &quot;SEATID&quot;, &quot;CANCELLATIONID&quot;, &quot;PRICEID&quot;, &quot;BOOKINGID&quot;) VALUES (:TICKETID, :TICKETSTATUS, :TICKETNUMBER, :SEATID, :CANCELLATIONID, :PRICEID, :BOOKINGID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TICKET&quot;" UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;TICKETSTATUS&quot; = :TICKETSTATUS, &quot;TICKETNUMBER&quot; = :TICKETNUMBER, &quot;SEATID&quot; = :SEATID, &quot;CANCELLATIONID&quot; = :CANCELLATIONID, &quot;PRICEID&quot; = :PRICEID, &quot;BOOKINGID&quot; = :BOOKINGID WHERE &quot;TICKETID&quot; = :TICKETID">
                <DeleteParameters>
                    <asp:Parameter Name="TICKETID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TICKETID" Type="Decimal" />
                    <asp:Parameter Name="TICKETSTATUS" Type="String" />
                    <asp:Parameter Name="TICKETNUMBER" Type="String" />
                    <asp:Parameter Name="SEATID" Type="Decimal" />
                    <asp:Parameter Name="CANCELLATIONID" Type="Decimal" />
                    <asp:Parameter Name="PRICEID" Type="Decimal" />
                    <asp:Parameter Name="BOOKINGID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TICKETSTATUS" Type="String" />
                    <asp:Parameter Name="TICKETNUMBER" Type="String" />
                    <asp:Parameter Name="SEATID" Type="Decimal" />
                    <asp:Parameter Name="CANCELLATIONID" Type="Decimal" />
                    <asp:Parameter Name="PRICEID" Type="Decimal" />
                    <asp:Parameter Name="BOOKINGID" Type="Decimal" />
                    <asp:Parameter Name="TICKETID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </h2>
        <p>
            <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" ForeColor="Black" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
                <EditItemTemplate>
                    TICKETID:
                    <asp:Label ID="TICKETIDLabel1" runat="server" Text='<%# Eval("TICKETID") %>' />
                    <br />
                    TICKETSTATUS:
                    <asp:TextBox ID="TICKETSTATUSTextBox" runat="server" Text='<%# Bind("TICKETSTATUS") %>' />
                    <br />
                    TICKETNUMBER:
                    <asp:TextBox ID="TICKETNUMBERTextBox" runat="server" Text='<%# Bind("TICKETNUMBER") %>' />
                    <br />
                    SEATID:
                    <asp:TextBox ID="SEATIDTextBox" runat="server" Text='<%# Bind("SEATID") %>' />
                    <br />
                    CANCELLATIONID:
                    <asp:TextBox ID="CANCELLATIONIDTextBox" runat="server" Text='<%# Bind("CANCELLATIONID") %>' />
                    <br />
                    PRICEID:
                    <asp:TextBox ID="PRICEIDTextBox" runat="server" Text='<%# Bind("PRICEID") %>' />
                    <br />
                    BOOKINGID:
                    <asp:TextBox ID="BOOKINGIDTextBox" runat="server" Text='<%# Bind("BOOKINGID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    TICKETID:
                    <asp:TextBox ID="TICKETIDTextBox" runat="server" Text='<%# Bind("TICKETID") %>' />
                    <br />
                    TICKETSTATUS:
                    <asp:TextBox ID="TICKETSTATUSTextBox" runat="server" Text='<%# Bind("TICKETSTATUS") %>' />
                    <br />
                    TICKETNUMBER:
                    <asp:TextBox ID="TICKETNUMBERTextBox" runat="server" Text='<%# Bind("TICKETNUMBER") %>' />
                    <br />
                    SEATID:
                    <asp:TextBox ID="SEATIDTextBox" runat="server" Text='<%# Bind("SEATID") %>' />
                    <br />
                    CANCELLATIONID:
                    <asp:TextBox ID="CANCELLATIONIDTextBox" runat="server" Text='<%# Bind("CANCELLATIONID") %>' />
                    <br />
                    PRICEID:
                    <asp:TextBox ID="PRICEIDTextBox" runat="server" Text='<%# Bind("PRICEID") %>' />
                    <br />
                    BOOKINGID:
                    <asp:TextBox ID="BOOKINGIDTextBox" runat="server" Text='<%# Bind("BOOKINGID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    TICKETID:
                    <asp:Label ID="TICKETIDLabel" runat="server" Text='<%# Eval("TICKETID") %>' />
                    <br />
                    TICKETSTATUS:
                    <asp:Label ID="TICKETSTATUSLabel" runat="server" Text='<%# Bind("TICKETSTATUS") %>' />
                    <br />
                    TICKETNUMBER:
                    <asp:Label ID="TICKETNUMBERLabel" runat="server" Text='<%# Bind("TICKETNUMBER") %>' />
                    <br />
                    SEATID:
                    <asp:Label ID="SEATIDLabel" runat="server" Text='<%# Bind("SEATID") %>' />
                    <br />
                    CANCELLATIONID:
                    <asp:Label ID="CANCELLATIONIDLabel" runat="server" Text='<%# Bind("CANCELLATIONID") %>' />
                    <br />
                    PRICEID:
                    <asp:Label ID="PRICEIDLabel" runat="server" Text='<%# Bind("PRICEID") %>' />
                    <br />
                    BOOKINGID:
                    <asp:Label ID="BOOKINGIDLabel" runat="server" Text='<%# Bind("BOOKINGID") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
            </asp:FormView>
        </p>
        <hr />

    </div>
</asp:Content>