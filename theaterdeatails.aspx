<%@ Page Title="Theater Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="theaterdeatails.aspx.cs" Inherits="kumaricinema.theaterdeatails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Theater City Hall Details</h2>
        <hr />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="THEATREID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="THEATREID" HeaderText="THEATREID" ReadOnly="True" SortExpression="THEATREID" />
                <asp:BoundField DataField="THEATRENAME" HeaderText="THEATRENAME" SortExpression="THEATRENAME" />
                <asp:BoundField DataField="THEATRECITY" HeaderText="THEATRECITY" SortExpression="THEATRECITY" />
                <asp:BoundField DataField="THEATREADDRESS" HeaderText="THEATREADDRESS" SortExpression="THEATREADDRESS" />
                <asp:BoundField DataField="THEATRECONTACTNUMBER" HeaderText="THEATRECONTACTNUMBER" SortExpression="THEATRECONTACTNUMBER" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;THEATRE&quot; WHERE &quot;THEATREID&quot; = :THEATREID" InsertCommand="INSERT INTO &quot;THEATRE&quot; (&quot;THEATREID&quot;, &quot;THEATRENAME&quot;, &quot;THEATRECITY&quot;, &quot;THEATREADDRESS&quot;, &quot;THEATRECONTACTNUMBER&quot;) VALUES (:THEATREID, :THEATRENAME, :THEATRECITY, :THEATREADDRESS, :THEATRECONTACTNUMBER)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;THEATRE&quot;" UpdateCommand="UPDATE &quot;THEATRE&quot; SET &quot;THEATRENAME&quot; = :THEATRENAME, &quot;THEATRECITY&quot; = :THEATRECITY, &quot;THEATREADDRESS&quot; = :THEATREADDRESS, &quot;THEATRECONTACTNUMBER&quot; = :THEATRECONTACTNUMBER WHERE &quot;THEATREID&quot; = :THEATREID">
            <DeleteParameters>
                <asp:Parameter Name="THEATREID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="THEATREID" Type="Decimal" />
                <asp:Parameter Name="THEATRENAME" Type="String" />
                <asp:Parameter Name="THEATRECITY" Type="String" />
                <asp:Parameter Name="THEATREADDRESS" Type="String" />
                <asp:Parameter Name="THEATRECONTACTNUMBER" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="THEATRENAME" Type="String" />
                <asp:Parameter Name="THEATRECITY" Type="String" />
                <asp:Parameter Name="THEATREADDRESS" Type="String" />
                <asp:Parameter Name="THEATRECONTACTNUMBER" Type="String" />
                <asp:Parameter Name="THEATREID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="THEATREID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                THEATREID:
                <asp:Label ID="THEATREIDLabel1" runat="server" Text='<%# Eval("THEATREID") %>' />
                <br />
                THEATRENAME:
                <asp:TextBox ID="THEATRENAMETextBox" runat="server" Text='<%# Bind("THEATRENAME") %>' />
                <br />
                THEATRECITY:
                <asp:TextBox ID="THEATRECITYTextBox" runat="server" Text='<%# Bind("THEATRECITY") %>' />
                <br />
                THEATREADDRESS:
                <asp:TextBox ID="THEATREADDRESSTextBox" runat="server" Text='<%# Bind("THEATREADDRESS") %>' />
                <br />
                THEATRECONTACTNUMBER:
                <asp:TextBox ID="THEATRECONTACTNUMBERTextBox" runat="server" Text='<%# Bind("THEATRECONTACTNUMBER") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                THEATREID:
                <asp:TextBox ID="THEATREIDTextBox" runat="server" Text='<%# Bind("THEATREID") %>' />
                <br />
                THEATRENAME:
                <asp:TextBox ID="THEATRENAMETextBox" runat="server" Text='<%# Bind("THEATRENAME") %>' />
                <br />
                THEATRECITY:
                <asp:TextBox ID="THEATRECITYTextBox" runat="server" Text='<%# Bind("THEATRECITY") %>' />
                <br />
                THEATREADDRESS:
                <asp:TextBox ID="THEATREADDRESSTextBox" runat="server" Text='<%# Bind("THEATREADDRESS") %>' />
                <br />
                THEATRECONTACTNUMBER:
                <asp:TextBox ID="THEATRECONTACTNUMBERTextBox" runat="server" Text='<%# Bind("THEATRECONTACTNUMBER") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                THEATREID:
                <asp:Label ID="THEATREIDLabel" runat="server" Text='<%# Eval("THEATREID") %>' />
                <br />
                THEATRENAME:
                <asp:Label ID="THEATRENAMELabel" runat="server" Text='<%# Bind("THEATRENAME") %>' />
                <br />
                THEATRECITY:
                <asp:Label ID="THEATRECITYLabel" runat="server" Text='<%# Bind("THEATRECITY") %>' />
                <br />
                THEATREADDRESS:
                <asp:Label ID="THEATREADDRESSLabel" runat="server" Text='<%# Bind("THEATREADDRESS") %>' />
                <br />
                THEATRECONTACTNUMBER:
                <asp:Label ID="THEATRECONTACTNUMBERLabel" runat="server" Text='<%# Bind("THEATRECONTACTNUMBER") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>

    </div>
</asp:Content>