<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Prevent access if no score is present (direct access check)
    if (request.getAttribute("score") == null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
    
    int score = (int) request.getAttribute("score");
    int total = (int) request.getAttribute("total");
    
    // Calculate percentage
    double percentage = ((double)score / total) * 100;
    String status = percentage >= 50 ? "Passed" : "Failed";
    String color = percentage >= 50 ? "green" : "red";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Exam Result</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        body { font-family: sans-serif; text-align: center; padding-top: 50px; background-color: #f4f4f4; }
        .result-card { 
            background: white; width: 400px; margin: auto; padding: 30px; 
            border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
        }
        h1 { color: #333; }
        .score { font-size: 48px; font-weight: bold; color: <%= color %>; margin: 20px 0; }
        .btn { 
            display: inline-block; text-decoration: none; background: #007bff; color: white; 
            padding: 10px 20px; border-radius: 5px; margin-top: 20px; 
        }
        .btn:hover { background: #0056b3; }
    </style>
</head>
<body>

    <div class="result-card">
        <h1>Exam Completed</h1>
        <p>Your Result:</p>
        
        <div class="score">
            <%= score %> / <%= total %>
        </div>
        
        <h3 style="color: <%= color %>"><%= status %></h3>
        
        <p>Percentage: <%= (int)percentage %>%</p>
        
        <a href="dashboard.jsp" class="btn">Back to Dashboard</a>
    </div>

</body>
</html>