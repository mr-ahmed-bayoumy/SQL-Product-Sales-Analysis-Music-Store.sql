

/*============================================================
					1. DATABASE OVERVIEW
============================================================*/

select * from Customer
select * from Invoice
select * from InvoiceLine
select * from Track
select * from Employee
select * from Artist

/*===========================================================
			  		 2. PRIMARY KPIs
============================================================*/

-->> Avilable Artists, Albums & Tracks
select 
(select count(*) from Artist) AS TotalArtists,
(select count(*) from Album)  AS TotalAlbums,
(select count(*) from Track)  AS TotalTracks

-->> Total Invoices & Revenue
select count(InvoiceId) as Total_Invoices,
sum(Total) as Total_Revenue
from Invoice

-->> Total Customers
select count(CustomerId) as Total_Customers
from Customer

-->> Total Employees
select count(EmployeeId) as Total_Emplyees
from Employee


/* ============================================================
				 3. CUSTOMER ANALYSIS
   ============================================================ */

-->> Revenue by Customer
select c.firstname + ' ' + c.lastname as Customer_Name,
c.country as Country,
count(distinct i.invoiceid) as Total_Invoices,
sum(i.total) as Total_Spent
from customer as c
join invoice as i
on c.customerid = i.customerid
group by c.customerid, c.firstname, c.lastname, c.country
order by total_spent desc

-->> Avrg Order Value 
select c.firstname + ' ' + c.lastname as Customer_Name,
count(distinct i.invoiceid) as Total_Invoices,
round(avg(i.total),2) as Avg_Order_Value
from customer c
join invoice i
on c.customerid = i.customerid
group by c.firstname, c.lastname, c.country
order by Avg_Order_Value desc

/* ============================================================
				 4. SALES ANALYSIS
   ============================================================ */

-->> Revenue by Track
select T.Name,
sum(il.unitprice * il.quantity) as Revenue
from Track as T
join InvoiceLine as IL
on T.TrackId = IL.TrackId
join Invoice as I
on IL.InvoiceId = I.InvoiceId
group by Name
order by Revenue desc

-->> Revenue by Artist
select Ar.Name, sum(IL.Quantity * IL.UnitPrice) as Revenue
from Track as T
join InvoiceLine as IL
on T.TrackId = IL.TrackId
right join Album as Al
on Al.AlbumId = T.AlbumId
right join Artist as Ar
on Ar.ArtistId = Al.ArtistId
group by Ar.Name
order by Revenue desc

-->> Revenue by Genre
select G.Name,
sum(il.unitprice * il.quantity) as Revenue
from Track as T
join Genre as G
on G.GenreId = T.GenreId
join InvoiceLine as IL
on IL.TrackId = T.TrackId
join Invoice as I
on IL.InvoiceId = I.InvoiceId
group by G.name
order by Revenue desc

-->> Top 10 best-selling products by quantity
select top 10 T.Name, sum(quantity) as Quantity_Sold
from InvoiceLine as IL
left join Track as T
on IL.TrackId = T.TrackId
group by Name
order by sum(quantity) desc


/*============================================================
				 5. GEOGRAPHIC ANALYSIS
============================================================*/

-->> Revenue by Country
select Country, sum(Total) as Revenue
from Invoice as I
join Customer as C
on I.CustomerId = c.CustomerId
group by country
order by Revenue desc

-->> Orders & Revenue By City
select
i.billingcity as City,
count(i.invoiceid) as total_Orders,
sum(i.total) as total_Revenue
from invoice i
group by i.billingcity
order by total_Revenue desc

-->> Customer Penetration & Avg Revenue by Country
select
    c.country,
    count(distinct c.customerid) as total_customers,
    count(i.invoiceid) as total_invoices,
    sum(i.total) as total_revenue,
    round(sum(i.total) / count(distinct c.customerid), 2) as avg_revenue_per_customer
from customer c
join invoice i on c.customerid = i.customerid
group by c.country
order by total_revenue desc

/* ============================================================
		        	6. TIME PERFORMANCE
============================================================ */

-->> Monthly Sales Performance
select year(I.InvoiceDate) as Year,
month(I.InvoiceDate) as Month,
DATENAME(MONTH, i.InvoiceDate) AS MonthName,
sum(I.Total) as Total_Revenue
from Invoice as I
group by  year(I.InvoiceDate), month(I.InvoiceDate), DATENAME(MONTH, i.InvoiceDate)
order by  Year, Month

-->> Yearly Sales Performance
select
    year(i.invoicedate) as Year,
    count(i.invoiceid) as total_Invoices,
    count(distinct i.customerid) as Active_Customers,
    sum(i.total) as Yearly_Revenue,
    round(avg(i.total), 2) as avg_invoice_Value
from invoice i
group by year(i.invoicedate)
order by Year asc

/*============================================================
				7. PRODUCTS RANKING (WINDOW FUNCTION)
============================================================*/

-->> Rank products by revenue
with Product_Revenue as
(
	select T.Name as Product,
	sum(il.unitprice * il.quantity) as Revenue
	from Track as T
	join InvoiceLine as IL
	on T.TrackId = IL.TrackId
	group by T.Name
)
select Product, Revenue,
rank() over (order by Revenue desc) as Rank
from Product_Revenue
order by Rank



/* =====================================================================
   BUSINESS INSIGHTS & RECOMMENDATIONS
   Based on Chinook Digital Music Store Data & Analytical SQL Project
   =====================================================================

   The analysis of the Chinook dataset provided valuable strategic insights 
   into music catalog performance, customer purchasing behavior, geographic 
   distribution, artist monetization, and temporal sales patterns.
   
   ---------------------------------------------------------------------
   1. GENRE & TRACK PERFORMANCE
   ---------------------------------------------------------------------
   [Insights]
   - Rock and Latin dominate catalog revenue and total units sold by a wide margin.
   - Individual track sales follow a long-tail distribution: a small fraction of popular tracks 
     drive recurring sales, while thousands of tracks experience single-unit purchases.

   [Recommendations]
   - Focus marketing campaigns and playlist curations around top-tier genres (Rock, Latin, Metal).
   - Implement bundle pricing and discounted album packages to boost the sales velocity of long-tail tracks.

   ---------------------------------------------------------------------
   2. CUSTOMER BEHAVIOR & VALUE
   ---------------------------------------------------------------------
   [Insights]
   - Customer spending is distributed within a narrow range ($37 - $50), reflecting a flat purchasing ceiling.
   - The Average Order Value (AOV) is low per transaction, with customers typically buying only 1 to 5 tracks per order.

   [Recommendations]
   - Build a VIP loyalty program with exclusive early-access perks to incentivize high-value customers.
   - Implement cart-level discounts (e.g., "Buy 10 tracks, get 2 free") to immediately raise the Average Order Value.

   ---------------------------------------------------------------------
   3. GEOGRAPHIC ANALYSIS
   ---------------------------------------------------------------------
   [Insights]
   - The USA and Canada are the primary volume drivers, accounting for the highest total revenue and customer counts.
   - Certain international markets (e.g., Czech Republic, Brazil, Germany) exhibit high Average Revenue Per Customer despite having fewer total accounts.

   [Recommendations]
   - Scale customer acquisition and local partnerships in high-volume regions (USA & Canada).
   - Expand localized promotions, localized pricing, and payment gateways in high-potential international markets.

   ---------------------------------------------------------------------
   4. ARTIST & CATALOG MONETIZATION
   ---------------------------------------------------------------------
   [Insights]
   - Revenue is heavily concentrated among legacy artists with deep catalogs (e.g., Iron Maiden, U2, Led Zeppelin).
   - Artists with diverse discographies generate consistent multi-track sales compared to single-track artists.

   [Recommendations]
   - Partner with music distributors to secure exclusive digital box sets and remastered discographies for top artists.
   - Optimize catalog licensing costs by prioritizing artists that drive repeatable, multi-album purchases.

   ---------------------------------------------------------------------
   5. TIME & SALES TRENDS
   ---------------------------------------------------------------------
   [Insights]
   - Annual performance shows steady revenue continuity across fiscal years, with stable invoice volumes.
   - Monthly sales show cyclic fluctuations, with noticeable dips between seasonal purchasing peaks.

   [Recommendations]
   - Launch scheduled promotional events during historically slow sales months to stabilize cash flow.
   - Align marketing budgets with seasonal sales surges to capitalize on high-intent purchasing periods.

   ---------------------------------------------------------------------
   6. KEY TAKEAWAYS
   ---------------------------------------------------------------------
   [Insights]
   - High catalog concentration risk exists: a few dominant genres and legacy artists generate the bulk of income.
   - The purely transactional sales model caps lifetime customer value compared to modern recurring subscription models.

   [Recommendations]
   - Adopt a multi-dimensional KPI dashboard monitoring AOV, Customer Retention, and Catalog Utilization.
   - Evaluate transitioning toward digital subscription passes or monthly credit bundles to establish predictable recurring revenue.

   =====================================================================
   Better Data -> Smarter Decisions -> Higher Profitability
   ===================================================================== */

-->> FINAL BUSINESS REPORT VIEW
GO
CREATE VIEW vw_Business_Recommendations AS
SELECT 
    1 AS Section_ID,
    'Genre & Track Performance' AS Analysis_Area,
    'Rock and Latin drive dominant volume; catalog sales follow an extreme long-tail distribution.' AS Key_Insight,
    'Promote top genre playlists and bundle slow-moving album tracks with best-sellers.' AS Business_Recommendation
UNION ALL
SELECT 
    2,
    'Customer Behavior',
    'Customer spend sits in a narrow band ($37-$50); Average Order Value remains relatively low.',
    'Introduce VIP loyalty tiers and multi-track cart discounts to expand customer lifetime value.'
UNION ALL
SELECT 
    3,
    'Geographic Analysis',
    'USA and Canada lead in volume; emerging European markets lead in average spend per customer.',
    'Maintain core market acquisition while localizing offerings in high-spend international markets.'
UNION ALL
SELECT 
    4,
    'Artist & Catalog Monetization',
    'Legacy artists with broad discographies generate the overwhelming majority of revenue.',
    'Feature artist discography box sets and prioritize licensing for prolific, high-margin creators.'
UNION ALL
SELECT 
    5,
    'Sales Trends',
    'Stable yearly revenue with periodic monthly dips reflecting transaction-based volatility.',
    'Deploy seasonal campaigns during low-volume months to smooth cyclical revenue swings.'
UNION ALL
SELECT 
    6,
    'Key Takeaways',
    'Revenue is vulnerable to catalog concentration; purely transactional model caps long-term LTV.',
    'Track balanced KPIs (AOV + Retention) and explore recurring digital pass models.';
GO


select * from vw_Business_Recommendations