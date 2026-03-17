<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="kumaricinema._Default" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dashboard-hero {
            background: linear-gradient(135deg, #3a7bd5 0%, #00d2ff 100%);
            color: #fff;
            padding: 2.5rem;
            border-radius: 1rem;
            box-shadow: 0 15px 35px rgba(0, 0, 0, .15);
            margin-bottom: 2rem;
        }

        .dashboard-hero h1 {
            font-weight: 700;
        }

        .dashboard-hero p {
            font-size: 1.1rem;
            margin-bottom: .5rem;
        }

        .options-menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .option-card {
            display: block;
            text-decoration: none;
            color: inherit;
            padding: 1.25rem;
            border-radius: .85rem;
            background: #fff;
            border: 1px solid #e5e5e5;
            box-shadow: 0 8px 20px rgba(0,0,0,.05);
            transition: transform .2s ease, box-shadow .2s ease;
        }

        .option-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 16px 30px rgba(0,0,0,.1);
        }

        .option-card h4 {
            margin-bottom: .35rem;
            font-weight: 600;
        }

        .summary-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .summary-card {
            background: #fff;
            padding: 1.25rem;
            border-radius: .85rem;
            box-shadow: 0 8px 20px rgba(0,0,0,.05);
            border-left: 4px solid #3a7bd5;
        }

        .summary-card span {
            display: block;
            font-size: .9rem;
            color: #6c757d;
        }

        .summary-card strong {
            font-size: 2rem;
            font-weight: 700;
            color: #343a40;
        }

        .chart-card {
            background: #fff;
            padding: 1rem;
            border-radius: .85rem;
            box-shadow: 0 8px 20px rgba(0,0,0,.05);
            margin-bottom: 2rem;
            border: 1px solid #e5e5e5;
        }

        .chart-card h5 {
            font-weight: 600;
            margin-bottom: .75rem;
        }
    </style>

    <div class="dashboard-hero">
        <h1>Welcome to Kumari Cinema Insights</h1>
        <p>Monitor user activity, screenings, and ticket trends at a glance.</p>
        <p class="mb-0">Use the quick links below to jump into detailed management screens.</p>
    </div>

    <section class="options-menu">
        <a class="option-card" href="UserDetails.aspx">
            <h4>User Management</h4>
            <p>Maintain user accounts and contact details.</p>
        </a>
        <a class="option-card" href="theaterdeatails.aspx">
            <h4>Theatre Directory</h4>
            <p>Manage theatres, cities, and contact info.</p>
        </a>
        <a class="option-card" href="halldetails.aspx">
            <h4>Hall Inventory</h4>
            <p>Track hall capacities and experiences.</p>
        </a>
        <a class="option-card" href="showdetails.aspx">
            <h4>Showtimes</h4>
            <p>Configure show schedules for every hall.</p>
        </a>
        <a class="option-card" href="moviedetails.aspx">
            <h4>Movie Catalog</h4>
            <p>Update metadata, duration, and release info.</p>
        </a>
        <a class="option-card" href="TicketDetails.aspx">
            <h4>Ticket Ledger</h4>
            <p>Review ticket statuses and pricing.</p>
        </a>
        <a class="option-card" href="UserTicket.aspx">
            <h4>User Ticket History</h4>
            <p>Audit ticket purchases for any user.</p>
        </a>
        <a class="option-card" href="TheaterCityHallMovie.aspx">
            <h4>Theatre Schedules</h4>
            <p>See shows per city, theatre, and hall.</p>
        </a>
        <a class="option-card" href="MovieOccupancyPerformer.aspx">
            <h4>Occupancy Leaders</h4>
            <p>Identify top-performing theatres per movie.</p>
        </a>
    </section>

    <section class="summary-cards">
        <asp:ListView ID="lvSummary" runat="server" DataSourceID="SqlDataSourceDashboardSummary">
            <ItemTemplate>
                <div class="summary-card">
                    <span>Total Users</span>
                    <strong><%# Eval("TOTALUSERS") %></strong>
                </div>
                <div class="summary-card" style="border-left-color:#ff7e67;">
                    <span>Total Movies</span>
                    <strong><%# Eval("TOTALMOVIES") %></strong>
                </div>
                <div class="summary-card" style="border-left-color:#ffc107;">
                    <span>Total Theatres</span>
                    <strong><%# Eval("TOTALTHEATRES") %></strong>
                </div>
                <div class="summary-card" style="border-left-color:#28a745;">
                    <span>Total Halls</span>
                    <strong><%# Eval("TOTALHALLS") %></strong>
                </div>
                <div class="summary-card" style="border-left-color:#6610f2;">
                    <span>Total Shows</span>
                    <strong><%# Eval("TOTALSHOWS") %></strong>
                </div>
                <div class="summary-card" style="border-left-color:#20c997;">
                    <span>Total Tickets</span>
                    <strong><%# Eval("TOTALTICKETS") %></strong>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </section>

    <div class="row">
        <div class="col-lg-6">
            <div class="chart-card">
                <h5>Top Movies by Scheduled Shows</h5>
                <asp:Chart ID="chartTopMovies" runat="server" DataSourceID="SqlDataSourceTopMovies" Width="600px" Height="320px">
                    <Series>
                        <asp:Series Name="Movies" XValueMember="TITLE" YValueMembers="TOTALSHOWS" ChartType="Column" Color="#3a7bd5" BorderWidth="2" IsValueShownAsLabel="true" />
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Interval="1">
                                <LabelStyle Angle="-30" />
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Enabled="false" />
                    </Legends>
                </asp:Chart>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="chart-card">
                <h5>Ticket Status Distribution</h5>
                <asp:Chart ID="chartTicketStatus" runat="server" DataSourceID="SqlDataSourceTicketStatus" Width="600px" Height="320px">
                    <Series>
                        <asp:Series Name="TicketStatus" XValueMember="TICKETSTATUS" YValueMembers="TOTALCOUNT" ChartType="Pie" Label="#VALX (#VAL)" />
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea2" />
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Docking="Bottom" Alignment="Center" />
                    </Legends>
                </asp:Chart>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceDashboardSummary" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT 
            (SELECT COUNT(*) FROM USERS) AS TOTALUSERS,
            (SELECT COUNT(*) FROM MOVIE) AS TOTALMOVIES,
            (SELECT COUNT(*) FROM THEATRE) AS TOTALTHEATRES,
            (SELECT COUNT(*) FROM HALL) AS TOTALHALLS,
            (SELECT COUNT(*) FROM SHOWS) AS TOTALSHOWS,
            (SELECT COUNT(*) FROM TICKET) AS TOTALTICKETS
        FROM DUAL">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceTopMovies" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM (
            SELECT M.TITLE, COUNT(S.SHOWID) AS TOTALSHOWS
            FROM SHOWS S
            INNER JOIN MOVIE M ON S.MOVIEID = M.MOVIEID
            GROUP BY M.TITLE
            ORDER BY TOTALSHOWS DESC
        ) WHERE ROWNUM &lt;= 5">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceTicketStatus" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT TICKETSTATUS, COUNT(*) AS TOTALCOUNT FROM TICKET GROUP BY TICKETSTATUS">
    </asp:SqlDataSource>
</asp:Content>
