# Athens Airbnb Market Analysis with SQL Server

**Theodoros Bozios** · SQL portfolio project · Historical snapshot, September 2023

End-to-end **SQL Server** project on Athens Airbnb data: load and model listings / calendar / reviews, clean and constrain data, answer business questions on pricing, availability and review activity, and apply performance techniques (views, indexes, stored procedures, temporary tables).

## Skills demonstrated

- T-SQL · data types · PKs / FKs · data quality  
- Cleaning (`CAST`, `CASE`, derived columns)  
- JOINs · subqueries · CTEs · window functions (`LAG`/`LEAD`, ranking)  
- Views · indexes · stored procedures · temporary tables  
- Market / neighbourhood pricing analysis (median vs mean, outliers)

## Repository structure

```
sql/                 Schema, load, cleaning, business queries, views, SP, indexes
submission/          Full solution scripts (schema + analysis)
data/sample/         Small sample CSVs (reproducible demos)
results/             Aggregate outputs from the analysis
scripts/             Python helpers (profiling, tests)
documentation/       Data dictionary, methodology
```

**Full project package (SQL + sample data + results + presentation):**  
See Google Drive link in the repo About / README after upload (or request the zip).

Full raw Athens dumps are large (100MB+). They are **not** stored in this repo.  
Public source pattern: [Inside Airbnb](http://insideairbnb.com/) Athens downloads.  
A linked sample covers **33 listings**, **1,659 reviews** and **12,045 calendar rows** (PII/free text reduced).

## Key findings (full historical files, Sep 2023 snapshot)

| Measure | Result |
|---------|--------|
| Neighbourhoods | 44 |
| Entire home/apt share | ~90% |
| Mean listing price | ~110 |
| Median listing price | ~71 |
| Share priced above 150 | ~14% |
| Available share of calendar nights | ~62% |

Mean is much higher than median — use **median** for price positioning. Highest median asking prices (neighbourhoods with ≥100 listings) include Ζάππειο and Εμπορικό Τρίγωνο–Πλάκα in this snapshot.

**Metric note:** calendar `available = f` means unavailable (booking or owner block). There is no reservation ID, so “bookings” proxies count unavailable nights.

## How to run (SQL Server)

1. Create database with Greek collation (`Greek_CI_AI`).  
2. Run `sql/01_database_schema.sql` then load CSVs (`sql/02_load_csv.sql`).  
3. Cleaning & derived columns: `sql/03_data_cleaning.sql`.  
4. Business questions: `sql/04_business_queries.sql`.  
5. View + index: `sql/05_views_indexes.sql`.  
6. Stored procedure (top revenue proxy by month/year): `sql/06_stored_procedure.sql`.  
7. Temporary table (availability days): `sql/07_temporary_tables.sql`.

Or use the combined scripts under `submission/`.

## Portfolio description (CV)

**Athens Airbnb SQL Analysis | SQL Server**  
Built a full SQL Server pipeline on Athens Airbnb data: schema and constraints, cleaning, neighbourhood pricing and availability analysis, ranking and window functions, plus views, indexes and a parameterized stored procedure for top listings by period.

## License

See `LICENSE`. Data remains subject to Inside Airbnb / source terms.
