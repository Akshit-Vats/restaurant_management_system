# restaurant_management_system

## 📌 Overview
This project is a **Restaurant Management System** implemented using **SQL and PL/SQL**.  
It is designed to automate core restaurant operations such as:
- Order management  
- Menu handling  
- Customer records  
- Billing system  
- Tips tracking  

The system ensures **efficient data handling, reduced manual errors, and better decision-making**.

---

## 🧠 Features
- 📋 Menu Management  
- 👤 Customer Management  
- 🧾 Order Processing  
- 💰 Billing System (with tax & discount calculation)  
- 🍴 Inventory Tracking (via triggers)  
- 💸 Tips Management  
- ⚡ Automation using PL/SQL (procedures, functions, triggers)

---

## 🗄️ Database Design
The system is normalized up to **3NF** and consists of the following tables:

- customer
- waiter
- chef
- food
- ord (orders)
- contains
- prepares
- bill
- tips

---

## ⚙️ Technologies Used
- SQL  
- PL/SQL  
- Oracle Live SQL (or compatible DB)

---

## 🚀 How to Run

1. Run schema:
\`\`\`sql
@schema.sql
\`\`\`

2. Insert data:
\`\`\`sql
-- Already included in schema.sql
\`\`\`

3. Run PL/SQL:
\`\`\`sql
@plsql.sql
\`\`\`

4. Enable output (important):
\`\`\`sql
SET SERVEROUTPUT ON;
\`\`\`

---

## 📂 Project Structure
\`\`\`
restaurant-management-system/
│
├── schema.sql
├── plsql.sql
├── output.md
├── ER-diagram.png
└── README.md
\`\`\`

---

## 📊 Key Concepts Demonstrated
- Relational Database Design  
- Normalization (up to 3NF)  
- Foreign Key Constraints  
- Triggers for automation  
- Stored Procedures & Functions  
- Cursor usage  

---

## ✨ Highlights
- Automatic stock update using triggers  
- Dynamic customer creation  
- Computed billing system  
- Modular PL/SQL logic  

---

## 📎 Future Improvements
- GUI (Web/App interface)  
- Authentication system  
- Real-time analytics dashboard  
- Payment integration  

---

## 👨‍💻 Author
Akshit Vats  

---

## 📜 License
This project is for educational purposes.
EOF
