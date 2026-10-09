USE [Greek Airbnb];
GO
-- Local temp table exists only in this SSMS session.
DROP TABLE IF EXISTS #ListingAvailability;
SELECT l.id AS listing_id,l.name,
 COALESCE(a.available_days,CONVERT(bigint,0)) AS available_days,
 COALESCE(a.observed_days,CONVERT(bigint,0)) AS observed_days
INTO #ListingAvailability
FROM dbo.Listings l LEFT JOIN (
 SELECT listing_id,SUM(CONVERT(bigint,available)) AS available_days,COUNT_BIG(*) AS observed_days
 FROM dbo.Bookings GROUP BY listing_id
) a ON a.listing_id=l.id;
CREATE UNIQUE CLUSTERED INDEX IX_Temp_Availability ON #ListingAvailability(listing_id);
SELECT listing_id,name,available_days,observed_days FROM #ListingAvailability
ORDER BY available_days DESC,listing_id;
-- observed_days=0 means no calendar observations, not confirmed zero availability.
DROP TABLE #ListingAvailability;
