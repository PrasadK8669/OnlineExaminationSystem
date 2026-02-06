<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <div class="auth-container">
        <div class="auth-header">Welcome Back</div>
        
        <% String msg = request.getParameter("msg"); 
           if(msg != null) { %> 
           <div style="color: var(--accent); margin-bottom: 15px; font-size: 14px;"><%= msg %></div> 
        <% } %>

        <form action="login" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter your ID" required>
            </div>
            
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="••••••••" required>
            </div>
            
            <button type="submit" class="btn">Login to Dashboard</button>
        </form>
        
        <div style="margin-top: 20px; font-size: 13px;">
            New here? <a href="register.jsp" style="color: var(--primary); font-weight: bold;">Create Account</a>
        </div>
    </div>

</body>
</html>