<%@ Page Title="halldetails" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="halldetails.aspx.cs" Inherits="kumaricinema.halldetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Hall details</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="HALLID" DataSourceID="SqlDataSource1" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="HALLID" HeaderText="HALLID" ReadOnly="True" SortExpression="HALLID" />
                <asp:BoundField DataField="HALLNAME" HeaderText="HALLNAME" SortExpression="HALLNAME" />
                <asp:BoundField DataField="HALLCAPACITY" HeaderText="HALLCAPACITY" SortExpression="HALLCAPACITY" />
                <asp:BoundField DataField="EXPERIENCETYPE" HeaderText="EXPERIENCETYPE" SortExpression="EXPERIENCETYPE" />
                <asp:BoundField DataField="SCREENSIZE" HeaderText="SCREENSIZE" SortExpression="SCREENSIZE" />
                <asp:BoundField DataField="THEATREID" HeaderText="THEATREID" SortExpression="THEATREID" />
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
        <asp:FormView ID="FormView1" runat="server" CellPadding="3" DataKeyNames="HALLID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal" OnPageIndexChanging="FormView1_PageIndexChanging">
            <EditItemTemplate>
                HALLID:
                <asp:Label ID="HALLIDLabel1" runat="server" Text='<%# Eval("HALLID") %>' />
                <br />
                HALLNAME:
                <asp:TextBox ID="HALLNAMETextBox" runat="server" Text='<%# Bind("HALLNAME") %>' />
                <br />
                HALLCAPACITY:
                <asp:TextBox ID="HALLCAPACITYTextBox" runat="server" Text='<%# Bind("HALLCAPACITY") %>' />
                <br />
                EXPERIENCETYPE:
                <asp:TextBox ID="EXPERIENCETYPETextBox" runat="server" Text='<%# Bind("EXPERIENCETYPE") %>' />
                <br />
                SCREENSIZE:
                <asp:TextBox ID="SCREENSIZETextBox" runat="server" Text='<%# Bind("SCREENSIZE") %>' />
                <br />
                THEATREID:
                <asp:TextBox ID="THEATREIDTextBox" runat="server" Text='<%# Bind("THEATREID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <InsertItemTemplate>
                HALLID:
                <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                <br />
                HALLNAME:
                <asp:TextBox ID="HALLNAMETextBox" runat="server" Text='<%# Bind("HALLNAME") %>' />
                <br />
                HALLCAPACITY:
                <asp:TextBox ID="HALLCAPACITYTextBox" runat="server" Text='<%# Bind("HALLCAPACITY") %>' />
                <br />
                EXPERIENCETYPE:
                <asp:TextBox ID="EXPERIENCETYPETextBox" runat="server" Text='<%# Bind("EXPERIENCETYPE") %>' />
                <br />
                SCREENSIZE:
                <asp:TextBox ID="SCREENSIZETextBox" runat="server" Text='<%# Bind("SCREENSIZE") %>' />
                <br />
                THEATREID:
                <asp:TextBox ID="THEATREIDTextBox" runat="server" Text='<%# Bind("THEATREID") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                HALLID:
                <asp:Label ID="HALLIDLabel" runat="server" Text='<%# Eval("HALLID") %>' />
                <br />
                HALLNAME:
                <asp:Label ID="HALLNAMELabel" runat="server" Text='<%# Bind("HALLNAME") %>' />
                <br />
                HALLCAPACITY:
                <asp:Label ID="HALLCAPACITYLabel" runat="server" Text='<%# Bind("HALLCAPACITY") %>' />
                <br />
                EXPERIENCETYPE:
                <asp:Label ID="EXPERIENCETYPELabel" runat="server" Text='<%# Bind("EXPERIENCETYPE") %>' />
                <br />
                SCREENSIZE:
                <asp:Label ID="SCREENSIZELabel" runat="server" Text='<%# Bind("SCREENSIZE") %>' />
                <br />
                THEATREID:
                <asp:Label ID="THEATREIDLabel" runat="server" Text='<%# Bind("THEATREID") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:FormView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;HALL&quot; WHERE &quot;HALLID&quot; = :HALLID" InsertCommand="INSERT INTO &quot;HALL&quot; (&quot;HALLID&quot;, &quot;HALLNAME&quot;, &quot;HALLCAPACITY&quot;, &quot;EXPERIENCETYPE&quot;, &quot;SCREENSIZE&quot;, &quot;THEATREID&quot;) VALUES (:HALLID, :HALLNAME, :HALLCAPACITY, :EXPERIENCETYPE, :SCREENSIZE, :THEATREID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;HALL&quot;" UpdateCommand="UPDATE &quot;HALL&quot; SET &quot;HALLNAME&quot; = :HALLNAME, &quot;HALLCAPACITY&quot; = :HALLCAPACITY, &quot;EXPERIENCETYPE&quot; = :EXPERIENCETYPE, &quot;SCREENSIZE&quot; = :SCREENSIZE, &quot;THEATREID&quot; = :THEATREID WHERE &quot;HALLID&quot; = :HALLID">
            <DeleteParameters>
                <asp:Parameter Name="HALLID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="HALLID" Type="Decimal" />
                <asp:Parameter Name="HALLNAME" Type="String" />
                <asp:Parameter Name="HALLCAPACITY" Type="Decimal" />
                <asp:Parameter Name="EXPERIENCETYPE" Type="String" />
                <asp:Parameter Name="SCREENSIZE" Type="String" />
                <asp:Parameter Name="THEATREID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="HALLNAME" Type="String" />
                <asp:Parameter Name="HALLCAPACITY" Type="Decimal" />
                <asp:Parameter Name="EXPERIENCETYPE" Type="String" />
                <asp:Parameter Name="SCREENSIZE" Type="String" />
                <asp:Parameter Name="THEATREID" Type="Decimal" />
                <asp:Parameter Name="HALLID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <hr />

    </div>
</asp:Content>