# Athens Airbnb Market Analysis with SQL Server

**Theodoros Bozios** · SQL portfolio project · Historical snapshot, September 2023

End-to-end **SQL Server** project on Athens Airbnb data: load and model listings / calendar / reviews, clean and constrain data, answer business questions on pricing, availability and review activity, and apply performance techniques (views, indexes, stored procedures, temporary tables).

## Download full package

**[Complete project ZIP (Google Drive)](https://drive.google.com/file/d/1iYpOtxFDUuuzsVDYPPDSfFR9vhFoORhw/view?usp=sharing)**  
Includes all SQL scripts, sample CSVs, results, documentation, charts and presentation (~340 KB).

Full raw Athens dumps (listings / calendar / reviews) are **100–200MB+** and are not stored in GitHub. Use Inside Airbnb public extracts or your local export.

## Skills demonstrated

- T-SQL · data types · PKs / FKs · data quality  
- Cleaning (`CAST`, `CASE`, derived columns)  
- JOINs · subqueries · CTEs · window functions (`LAG`/`LEAD`, ranking)  
- Views · indexes · stored procedures · temporary tables  
- Market / neighbourhood pricing analysis (median vs mean, outliers)

## Repository structure

```
sql/           Schema, load, cleaning, business queries, views, SP, indexes
submission/    Full solution scripts (in the ZIP package)
data/sample/   Small sample CSVs for demos
results/       Aggregate outputs (in the ZIP package)
scripts/       Python helpers (in the ZIP package)
documentation/ Data dictionary, methodology (in the ZIP package)
```

This GitHub repo keeps the **README + core SQL entry points**. The ZIP has the complete portfolio deliverable.

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

Full scripts are in the ZIP under `sql/` and `submission/`.

## Portfolio description (CV)

**Athens Airbnb SQL Analysis | SQL Server**  
Built a full SQL Server pipeline on Athens Airbnb data: schema and constraints, cleaning, neighbourhood pricing and availability analysis, ranking and window functions, plus views, indexes and a parameterized stored procedure for top listings by period.

## License

See `LICENSE`. Data remains subject to Inside Airbnb / source terms.
