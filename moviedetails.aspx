<%@ Page Title="Movie Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="moviedetails.aspx.cs" Inherits="kumaricinema.moviedetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Movie Management</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="MOVIEID" HeaderText="MOVIEID" ReadOnly="True" SortExpression="MOVIEID" />
                <asp:BoundField DataField="TITLE" HeaderText="TITLE" SortExpression="TITLE" />
                <asp:BoundField DataField="DURATION" HeaderText="DURATION" SortExpression="DURATION" />
                <asp:BoundField DataField="GENRE" HeaderText="GENRE" SortExpression="GENRE" />
                <asp:BoundField DataField="LANGUAGE" HeaderText="LANGUAGE" SortExpression="LANGUAGE" />
                <asp:BoundField DataField="RELEASEDATE" HeaderText="RELEASEDATE" SortExpression="RELEASEDATE" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:FormView ID="FormView1" runat="server" CellPadding="3" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
            <EditItemTemplate>
                MOVIEID:
                <asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>' />
                <br />
                TITLE:
                <asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' />
                <br />
                DURATION:
                <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' />
                <br />
                GENRE:
                <asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' />
                <br />
                LANGUAGE:
                <asp:TextBox ID="LANGUAGETextBox" runat="server" Text='<%# Bind("LANGUAGE") %>' />
                <br />
                RELEASEDATE:
                <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <InsertItemTemplate>
                MOVIEID:
                <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                <br />
                TITLE:
                <asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' />
                <br />
                DURATION:
                <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' />
                <br />
                GENRE:
                <asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' />
                <br />
                LANGUAGE:
                <asp:TextBox ID="LANGUAGETextBox" runat="server" Text='<%# Bind("LANGUAGE") %>' />
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
                DURATION:
                <asp:Label ID="DURATIONLabel" runat="server" Text='<%# Bind("DURATION") %>' />
                <br />
                GENRE:
                <asp:Label ID="GENRELabel" runat="server" Text='<%# Bind("GENRE") %>' />
                <br />
                LANGUAGE:
                <asp:Label ID="LANGUAGELabel" runat="server" Text='<%# Bind("LANGUAGE") %>' />
                <br />
                RELEASEDATE:
                <asp:Label ID="RELEASEDATELabel" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:FormView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MOVIE&quot; WHERE &quot;MOVIEID&quot; = :MOVIEID" InsertCommand="INSERT INTO &quot;MOVIE&quot; (&quot;MOVIEID&quot;, &quot;TITLE&quot;, &quot;DURATION&quot;, &quot;GENRE&quot;, &quot;LANGUAGE&quot;, &quot;RELEASEDATE&quot;) VALUES (:MOVIEID, :TITLE, :DURATION, :GENRE, :LANGUAGE, :RELEASEDATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;MOVIE&quot;" UpdateCommand="UPDATE &quot;MOVIE&quot; SET &quot;TITLE&quot; = :TITLE, &quot;DURATION&quot; = :DURATION, &quot;GENRE&quot; = :GENRE, &quot;LANGUAGE&quot; = :LANGUAGE, &quot;RELEASEDATE&quot; = :RELEASEDATE WHERE &quot;MOVIEID&quot; = :MOVIEID">
            <DeleteParameters>
                <asp:Parameter Name="MOVIEID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MOVIEID" Type="Decimal" />
                <asp:Parameter Name="TITLE" Type="String" />
                <asp:Parameter Name="DURATION" Type="Decimal" />
                <asp:Parameter Name="GENRE" Type="String" />
                <asp:Parameter Name="LANGUAGE" Type="String" />
                <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TITLE" Type="String" />
                <asp:Parameter Name="DURATION" Type="Decimal" />
                <asp:Parameter Name="GENRE" Type="String" />
                <asp:Parameter Name="LANGUAGE" Type="String" />
                <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
                <asp:Parameter Name="MOVIEID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <hr />

    </div>
</asp:Content>