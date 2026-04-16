# 📊 Sample Outputs

> These outputs demonstrate that the SQL and PL/SQL code executes correctly.

---

## 🧾 Waiter Table
\`\`\`sql
SELECT * FROM waiter;
\`\`\`

| WAITER_ID | FNAME | LNAME   |
|----------|------|---------|
| 1        | John | Doe     |
| 2        | Jane | Smith   |
| 3        | Bob  | Johnson |

---

## 👤 Customer Table
\`\`\`sql
SELECT * FROM customer;
\`\`\`

| CUST_ID | FNAME   | LNAME | CONTACT     |
|--------|--------|-------|------------|
| 1      | Alice  | Brown | 900000001  |
| 2      | Bob    | Green | 900000002  |
| 3      | Charlie| Blue  | 900000003  |

---

## 📦 Orders
\`\`\`sql
SELECT * FROM ord;
\`\`\`

| ORD_NO | ORD_DATE   | CUST_ID | WAITER_ID |
|-------|------------|--------|-----------|
| 1     | 15-APR-23  | 1      | 1         |
| 2     | 16-APR-23  | 2      | 2         |
| 3     | 17-APR-23  | 3      | 1         |

---

## 🍴 Food Table
\`\`\`sql
SELECT * FROM food;
\`\`\`

| ITEM_NO | ITEM_NAME       | TYPE         | PRICE | STOCK |
|--------|----------------|-------------|------|-------|
| 1      | Cheeseburger    | Main_course | 100  | 50    |
| 2      | French_Fries    | Appetizer   | 50   | 100   |
| 3      | Chocolate_cake  | Dessert     | 80   | 30    |

---

## 🔗 Contains Table
\`\`\`sql
SELECT * FROM contains;
\`\`\`

| ORD_NO | ITEM_NO |
|--------|--------|
| 1      | 1      |
| 1      | 2      |
| 2      | 2      |
| 2      | 3      |
| 3      | 1      |
| 3      | 3      |

---

## 💸 Tips Table
\`\`\`sql
SELECT * FROM tips;
\`\`\`

| WAITER_ID | CUST_ID | TIP |
|-----------|--------|-----|
| 1         | 1      | 10  |
| 1         | 3      | 20  |

---

## ⚡ PL/SQL Outputs

### 🍽️ Show Menu
\`\`\`
Item: Cheeseburger Price: 100
Item: French_Fries Price: 50
Item: Chocolate_cake Price: 80
\`\`\`

---

### 📦 Place Order
\`\`\`
In Stock
In Stock
Order No: 4
\`\`\`

---

### 🧾 Bill Generation
\`\`\`
Total Price: 180
Tax: 5
Discount: 0
Net Payable: 189
\`\`\`

---

### 💰 Give Tip
\`\`\`
Waiter 3 received 10 tip
\`\`\`

---

### 📊 Total Tips
\`\`\`
Total tip for waiter 1 is 30
\`\`\`

---

## ✅ Conclusion
All SQL queries and PL/SQL procedures executed successfully, validating:
- Table relationships
- Constraints
- Triggers
- Business logic
EOF
