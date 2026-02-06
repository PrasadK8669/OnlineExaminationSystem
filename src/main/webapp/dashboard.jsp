<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <nav class="navbar">
        <div class="brand">Exams<span style="color:var(--accent)">App</span></div>
        <div class="user-info">
            Hello, <b><%= session.getAttribute("user") %></b> 
            <span style="background: #eee; padding: 2px 8px; border-radius: 4px; font-size: 12px; margin: 0 10px;"><%= role.toUpperCase() %></span>
            <a href="logout.jsp" style="color: var(--accent); text-decoration: none; font-weight: bold;">Logout</a>
        </div>
    </nav>

    <div style="text-align: center; margin-top: 40px;">
        <h2 style="color: #333;">Dashboard Overview</h2>
        <p style="color: #777;">Select an action below to proceed.</p>
    </div>

    <div class="grid-container">
        
        <% if("admin".equals(role)) { %>
            <div class="card">
                <div style="font-size: 40px; margin-bottom: 10px;">📝</div>
                <h3>Add Question</h3>
                <p>Add new subjects or questions.</p>
                <a href="admin.jsp" class="btn">Open Panel</a>
            </div>
            
            <div class="card">
                <div style="font-size: 40px; margin-bottom: 10px;">📊</div>
                <h3>View Results</h3>
                <p>Check scores of all students.</p>
                <a href="view_results.jsp" class="btn">View Reports</a>
            </div>
        <% } %>

       <% if("student".equals(role)) { %>
            
            <%
                // Fetch all unique subjects available in the database
                try {
                    java.sql.Connection con = com.exam.dao.DBConnection.getConnection();
                    java.sql.PreparedStatement ps = con.prepareStatement("SELECT DISTINCT subject FROM questions");
                    java.sql.ResultSet rs = ps.executeQuery();
                    
                    while(rs.next()) {
                        String sub = rs.getString("subject");
            %>
            
            <div class="card">
                <div style="font-size: 40px; margin-bottom: 10px;">📚</div>
                <h3><%= sub %></h3>
                <p>Take the <%= sub %> Assessment</p>
                <a href="ExamServlet?subject=<%= sub %>" class="btn">Start Exam</a>
            </div>
            
            <% 
                    }
                } catch(Exception e) { e.printStackTrace(); }
            %>
            
        <% } %>
        
    </div>

</body>
</html>