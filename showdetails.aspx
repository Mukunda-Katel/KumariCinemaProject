<%@ Page Title="Showtimes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="showdetails.aspx.cs" Inherits="kumaricinema.showdetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Showtimes Details</h2>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SHOWID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="SHOWID" HeaderText="SHOWID" ReadOnly="True" SortExpression="SHOWID" />
                    <asp:BoundField DataField="SHOWDATE" HeaderText="SHOWDATE" SortExpression="SHOWDATE" />
                    <asp:BoundField DataField="SHOWTIME" HeaderText="SHOWTIME" SortExpression="SHOWTIME" />
                    <asp:BoundField DataField="STARTTIME" HeaderText="STARTTIME" SortExpression="STARTTIME" />
                    <asp:BoundField DataField="ENDTIME" HeaderText="ENDTIME" SortExpression="ENDTIME" />
                    <asp:BoundField DataField="MOVIEID" HeaderText="MOVIEID" SortExpression="MOVIEID" />
                    <asp:BoundField DataField="HALLID" HeaderText="HALLID" SortExpression="HALLID" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SHOWS&quot; WHERE &quot;SHOWID&quot; = :SHOWID" InsertCommand="INSERT INTO &quot;SHOWS&quot; (&quot;SHOWID&quot;, &quot;SHOWDATE&quot;, &quot;SHOWTIME&quot;, &quot;STARTTIME&quot;, &quot;ENDTIME&quot;, &quot;MOVIEID&quot;, &quot;HALLID&quot;) VALUES (:SHOWID, :SHOWDATE, :SHOWTIME, :STARTTIME, :ENDTIME, :MOVIEID, :HALLID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SHOWS&quot;" UpdateCommand="UPDATE &quot;SHOWS&quot; SET &quot;SHOWDATE&quot; = :SHOWDATE, &quot;SHOWTIME&quot; = :SHOWTIME, &quot;STARTTIME&quot; = :STARTTIME, &quot;ENDTIME&quot; = :ENDTIME, &quot;MOVIEID&quot; = :MOVIEID, &quot;HALLID&quot; = :HALLID WHERE &quot;SHOWID&quot; = :SHOWID">
                <DeleteParameters>
                    <asp:Parameter Name="SHOWID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SHOWID" Type="Decimal" />
                    <asp:Parameter Name="SHOWDATE" Type="DateTime" />
                    <asp:Parameter Name="SHOWTIME" Type="String" />
                    <asp:Parameter Name="STARTTIME" Type="String" />
                    <asp:Parameter Name="ENDTIME" Type="String" />
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                    <asp:Parameter Name="HALLID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SHOWDATE" Type="DateTime" />
                    <asp:Parameter Name="SHOWTIME" Type="String" />
                    <asp:Parameter Name="STARTTIME" Type="String" />
                    <asp:Parameter Name="ENDTIME" Type="String" />
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                    <asp:Parameter Name="HALLID" Type="Decimal" />
                    <asp:Parameter Name="SHOWID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="SHOWID" DataSourceID="SqlDataSource1" ForeColor="#333333">
                <EditItemTemplate>
                    SHOWID:
                    <asp:Label ID="SHOWIDLabel1" runat="server" Text='<%# Eval("SHOWID") %>' />
                    <br />
                    SHOWDATE:
                    <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE") %>' />
                    <br />
                    SHOWTIME:
                    <asp:TextBox ID="SHOWTIMETextBox" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                    <br />
                    STARTTIME:
                    <asp:TextBox ID="STARTTIMETextBox" runat="server" Text='<%# Bind("STARTTIME") %>' />
                    <br />
                    ENDTIME:
                    <asp:TextBox ID="ENDTIMETextBox" runat="server" Text='<%# Bind("ENDTIME") %>' />
                    <br />
                    MOVIEID:
                    <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                    <br />
                    HALLID:
                    <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    SHOWID:
                    <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' />
                    <br />
                    SHOWDATE:
                    <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE") %>' />
                    <br />
                    SHOWTIME:
                    <asp:TextBox ID="SHOWTIMETextBox" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                    <br />
                    STARTTIME:
                    <asp:TextBox ID="STARTTIMETextBox" runat="server" Text='<%# Bind("STARTTIME") %>' />
                    <br />
                    ENDTIME:
                    <asp:TextBox ID="ENDTIMETextBox" runat="server" Text='<%# Bind("ENDTIME") %>' />
                    <br />
                    MOVIEID:
                    <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                    <br />
                    HALLID:
                    <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    SHOWID:
                    <asp:Label ID="SHOWIDLabel" runat="server" Text='<%# Eval("SHOWID") %>' />
                    <br />
                    SHOWDATE:
                    <asp:Label ID="SHOWDATELabel" runat="server" Text='<%# Bind("SHOWDATE") %>' />
                    <br />
                    SHOWTIME:
                    <asp:Label ID="SHOWTIMELabel" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                    <br />
                    STARTTIME:
                    <asp:Label ID="STARTTIMELabel" runat="server" Text='<%# Bind("STARTTIME") %>' />
                    <br />
                    ENDTIME:
                    <asp:Label ID="ENDTIMELabel" runat="server" Text='<%# Bind("ENDTIME") %>' />
                    <br />
                    MOVIEID:
                    <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Bind("MOVIEID") %>' />
                    <br />
                    HALLID:
                    <asp:Label ID="HALLIDLabel" runat="server" Text='<%# Bind("HALLID") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:FormView>
        </p>
        <hr />
        
    </div>
</asp:Content>