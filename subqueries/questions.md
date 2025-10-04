## 🗂️ **LeetCode SQL Problems for Subqueries**

| Topic                       | Recommended Problems        |
| --------------------------- | --------------------------- |
| Scalar Subqueries           | 176, 178                    |
| Correlated Subqueries       | 185, 579, 570, 585, and 178 |
| Multi-row using `IN`        | 183, 184, 262               |
| EXISTS / NOT EXISTS         | 183, 262                    |
| Aggregate vs GROUP BY logic | 176, 178, 185, 196, 197     |



### 🔹 **Nested Subqueries**

1. **[176. Second Highest Salary](https://leetcode.com/problems/second-highest-salary/)**
   → Classic nested subquery problem (`MAX` with `WHERE salary < (SELECT MAX...)`).

2. **[177. Nth Highest Salary](https://leetcode.com/problems/nth-highest-salary/)**
   → Nested subquery + LIMIT trick (bit more advanced, but great practice).

3. **[184. Department Highest Salary](https://leetcode.com/problems/department-highest-salary/)**
   → Uses subqueries to find employees with max salary in each department.

---

### 🔹 **Scalar Subqueries**

4. **[627. Swap Salary](https://leetcode.com/problems/swap-salary/)**
   → Has a neat case for subqueries inside `UPDATE`.

5. **[178. Rank Scores](https://leetcode.com/problems/rank-scores/)**
   → Ranking requires scalar subqueries (`SELECT COUNT(DISTINCT score) WHERE ...`).

---

### 🔹 **Multi-row Subqueries**

6. **[185. Department Top Three Salaries](https://leetcode.com/problems/department-top-three-salaries/)**
   → Uses `IN` and subqueries to filter top 3.

7. **[262. Trips and Users](https://leetcode.com/problems/trips-and-users/)**
   → Requires filtering using subqueries that return multiple rows.

---

### 🔹 **Self-contained Subqueries**

8. **[196. Delete Duplicate Emails](https://leetcode.com/problems/delete-duplicate-emails/)**
   → Self-contained subquery for filtering duplicates.

9. **[197. Rising Temperature](https://leetcode.com/problems/rising-temperature/)**
   → Self-contained query comparing two rows (date logic).

---

### 🔹 **Correlated Subqueries**

10. **[183. Customers Who Never Order](https://leetcode.com/problems/customers-who-never-order/)**
    → Classic `WHERE NOT EXISTS (SELECT ... correlated ...)`.

11. **[584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee/)**
    → Another correlated use case.

12. **[601. Human Traffic of Stadium](https://leetcode.com/problems/human-traffic-of-stadium/)**
    → Tougher correlated subquery problem.

---