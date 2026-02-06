<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.exam.dao.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Student Results</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #4e54c8; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="brand">Admin Panel</div>
        <a href="dashboard.jsp" style="color: #4e54c8; font-weight: bold;">Back to Dashboard</a>
    </div>

    <div class="container" style="max-width: 1000px;">
        <h2>Student Performance Report</h2>
        
        <table>
            <tr>
                <th>Student Name</th>
                <th>Subject</th>
                <th>Score</th>
                <th>Date</th>
            </tr>
            <%
                try {
                    Connection con = DBConnection.getConnection();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM results ORDER BY exam_date DESC");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("subject") %></td>
                <td><%= rs.getInt("score") %> / <%= rs.getInt("total") %></td>
                <td><%= rs.getTimestamp("exam_date") %></td>
            </tr>
            <% 
                    }
                } catch(Exception e) { e.printStackTrace(); }
            %>
        </table>
    </div>
</body>
</html>