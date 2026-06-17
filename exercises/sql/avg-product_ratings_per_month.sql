-- Average Product Ratings per Month
-- SQL
-- Mid

-- Companies
-- Table: reviews
-- +-------------+----------+-------------+
-- | Column      | Type     | Constraints |
-- +-------------+----------+-------------+
-- | review_id   | INT      | PRIMARY KEY |
-- | user_id     | INT      | NOT NULL    |
-- | submit_date | DATETIME | NOT NULL    |
-- | product_id  | INT      | NOT NULL    |
-- | stars       | INT      | NOT NULL    |
-- | created_at  | DATETIME | NOT NULL    |
-- +-------------+----------+-------------+
-- Given a reviews table containing product reviews, write a query to get the average star rating for each product on a monthly basis for the year 2019.
-- The output should include the month (formatted as YYYY-MM), the product_id, and the average star rating rounded to 2 decimal places.
-- Return the result table ordered by month in ascending order, then by product_id in ascending order.
-- Example 1:
-- Input:
-- reviews table
-- +-----------+---------+---------------------+------------+-------+---------------------+
-- | review_id | user_id | submit_date         | product_id | stars | created_at          |
-- +-----------+---------+---------------------+------------+-------+---------------------+
-- | 1         | 101     | 2019-01-06 12:00:00 | 50001      | 4     | 2019-01-06 12:00:00 |
-- | 2         | 102     | 2019-01-15 12:00:00 | 50001      | 3     | 2019-01-15 12:00:00 |
-- | 3         | 103     | 2019-02-10 12:00:00 | 50001      | 5     | 2019-02-10 12:00:00 |
-- | 4         | 104     | 2019-01-20 12:00:00 | 69852      | 4     | 2019-01-20 12:00:00 |
-- | 5         | 105     | 2019-02-18 12:00:00 | 69852      | 2     | 2019-02-18 12:00:00 |
-- | 6         | 106     | 2019-02-25 12:00:00 | 69852      | 5     | 2019-02-25 12:00:00 |
-- +-----------+---------+---------------------+------------+-------+---------------------+

-- Output:
-- +---------+------------+-----------+
-- | month   | product_id | avg_stars |
-- +---------+------------+-----------+
-- | 2019-01 | 50001      | 3.5       |
-- | 2019-01 | 69852      | 4         |
-- | 2019-02 | 50001      | 5         |
-- | 2019-02 | 69852      | 3.5       |
-- +---------+------------+-----------+

-- Explanation:
-- For product 50001 in January 2019, the average is (4+3)/2 = 3.50. In February 2019, it is 5.00. For product 69852 in January 2019, the average is 4.00. In February 2019, it is (2+5)/2 = 3.50.
-- Example 2:
-- Input:
-- reviews table
-- +-----------+---------+---------------------+------------+-------+---------------------+
-- | review_id | user_id | submit_date         | product_id | stars | created_at          |
-- +-----------+---------+---------------------+------------+-------+---------------------+
-- | 1         | 201     | 2019-06-01 10:00:00 | 10001      | 5     | 2019-06-01 10:00:00 |
-- | 2         | 202     | 2019-06-15 10:00:00 | 10001      | 4     | 2019-06-15 10:00:00 |
-- | 3         | 203     | 2019-06-20 10:00:00 | 10002      | 3     | 2019-06-20 10:00:00 |
-- | 4         | 204     | 2018-12-01 10:00:00 | 10001      | 1     | 2018-12-01 10:00:00 |
-- | 5         | 205     | 2020-01-05 10:00:00 | 10002      | 5     | 2020-01-05 10:00:00 |
-- +-----------+---------+---------------------+------------+-------+---------------------+

-- Output:
-- +---------+------------+-----------+
-- | month   | product_id | avg_stars |
-- +---------+------------+-----------+
-- | 2019-06 | 10001      | 4.5       |
-- | 2019-06 | 10002      | 3         |
-- +---------+------------+-----------+

-- Explanation:
-- Only 2019 reviews are included. The 2018 and 2020 reviews are filtered out. Product 10001 in June 2019 averages (5+4)/2 = 4.50. Product 10002 in June 2019 averages 3.00.
-- Constraints:
-- The reviews table has at most 10⁴ rows.
-- stars is an integer between 1 and 5.
-- created_at contains dates from various years; only 2019 data should be included.
-- Each review_id is unique.

select 
    to_char(created_at, 'YYYY-MM') as "month",
    product_id,
    round(avg(stars)::numeric, 2) as "avg_stars"
from reviews
where 
    to_char(created_at, 'YYYY') = '2019'
    group by "month", product_id
    order by "month", product_id asc;