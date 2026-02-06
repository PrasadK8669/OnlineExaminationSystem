<img width="1919" height="1199" alt="Screenshot 2026-02-06 105215" src="https://github.com/user-attachments/assets/ab6cc433-2788-4267-a39e-b0d0d61c620c" /><img width="1919" height="1199" alt="image" src="https://github.com/user-attachments/assets/36078a66-02d7-44c1-b707-ea151d9573a1" /># 🎓 Online Examination System

A robust, full-stack web application designed to manage and conduct online exams. Built using the **MVC Architecture** with **Java Servlets**, **JSP**, and **MySQL**.

## 🚀 Features

### 👨‍🎓 Student Module
* **Secure Login/Registration:** Role-based authentication.
* **Dashboard:** View available exams dynamically fetched from the database.
* **Live Exam Interface:** * Includes a countdown timer (auto-submit when time ends).
    * Real-time score calculation.
* **Result History:** Scores are saved to the database immediately after submission.

### 👨‍🏫 Admin Module
* **Question Management:** Add questions for existing subjects or create **new subjects** on the fly.
* **Performance Reports:** View a detailed table of all student results, scores, and exam dates.

## 🛠️ Tech Stack
* **Backend:** Java (Jakarta EE / Servlet API), JDBC
* **Frontend:** JSP, HTML5, CSS3 (Custom Responsive Design), JavaScript
* **Database:** MySQL
* **Server:** Apache Tomcat 10
* **IDE:** Eclipse Enterprise Edition

## ⚙️ Setup & Installation

1.  **Clone the Repository**
    ```bash
    git clone [https://github.com/PrasadK8669/OnlineExamSystem.git](https://github.com/PrasadK8669/OnlineExamSystem.git)
    ```
2.  **Database Setup**
    * Open MySQL and create a database named `online_exam`.
    * Import the SQL commands (create tables for `users`, `questions`, `results`).
    * Update `DBConnection.java` with your MySQL username and password.
3.  **Run on Server**
    * Import the project into **Eclipse**.
    * Add the `mysql-connector-j` JAR to `src/main/webapp/WEB-INF/lib`.
    * Run `login.jsp` on **Apache Tomcat 10**.

## 📸 Screenshots
<img width="1891" height="1191" alt="Screenshot 2026-02-06 105030" src="https://github.com/user-attachments/assets/e7c1f337-bbc4-4938-b118-daba888d11f7" />
<img width="1910" height="1070" alt="Screenshot 2026-02-06 105059" src="https://github.com/user-attachments/assets/7f7206f9-9464-4a7c-8519-773a0bc55a26" />
<img width="1906" height="1178" alt="Screenshot 2026-02-06 105129" src="https://github.com/user-attachments/assets/f16512b9-9271-44f4-9817-012672b1fef8" />
<img width="1919" height="1199" alt="Screenshot 2026-02-06 105158" src="https://github.com/user-attachments/assets/06fd6123-d127-4b66-8c11-f8ec3ce057a2" />
<img width="1919" height="1199" alt="Screenshot 2026-02-06 105215" src="https://github.com/user-attachments/assets/61f75877-f6e7-4786-8069-c794dacc8b0b" />






