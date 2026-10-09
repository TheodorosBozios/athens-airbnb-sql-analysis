USE [Greek Airbnb];
GO
-- Revenue proxy: sum of nightly prices on unavailable dates.
-- Missing adjusted_price falls back to price. No confirmed revenue is identifiable.
CREATE OR ALTER PROCEDURE dbo.usp_Top5ListingsByRevenueProxy
 @BookingMonth int,
 @BookingYear int
AS
BEGIN
 SET NOCOUNT ON;
 IF @BookingMonth IS NULL OR @BookingMonth NOT BETWEEN 1 AND 12
    OR @BookingYear IS NULL OR @BookingYear NOT BETWEEN 1 AND 9998
  THROW 50030,'Provide month 1-12 and year 1-9998.',1;
 DECLARE @StartDate date=DATEFROMPARTS(@BookingYear,@BookingMonth,1);
 DECLARE @EndDate date=DATEADD(month,1,@StartDate);
 ;WITH monthly AS (
  SELECT listing_id,COUNT_BIG(*) AS unavailable_nights,
   COUNT_BIG(COALESCE(adjusted_price,price)) AS priced_unavailable_nights,
   SUM(COALESCE(adjusted_price,price)) AS unavailable_value_proxy
  FROM dbo.Bookings
  WHERE available=0 AND booking_date>=@StartDate AND booking_date<@EndDate
  GROUP BY listing_id
  HAVING COUNT_BIG(COALESCE(adjusted_price,price))>0
 )
 SELECT TOP(5) m.listing_id,l.name,l.neighbourhood_cleansed,
  m.unavailable_nights,m.priced_unavailable_nights,m.unavailable_value_proxy,
  CAST(100.0*m.priced_unavailable_nights/NULLIF(m.unavailable_nights,0) AS decimal(6,2)) AS price_coverage_pct
 FROM monthly m JOIN dbo.Listings l ON l.id=m.listing_id
 ORDER BY m.unavailable_value_proxy DESC,m.listing_id;
END;
GO
EXEC dbo.usp_Top5ListingsByRevenueProxy @BookingMonth=10,@BookingYear=2023;
