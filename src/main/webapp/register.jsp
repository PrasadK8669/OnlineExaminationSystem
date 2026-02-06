<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <div class="auth-container">
        <div class="auth-header">Create Account</div>

        <form action="RegisterServlet" method="post">
            <div class="form-group">
                <label>Choose Username</label>
                <input type="text" name="username" required>
            </div>
            
            <div class="form-group">
                <label>Set Password</label>
                <input type="password" name="password" required>
            </div>

            <div class="form-group">
                <label>I am a...</label>
                <select name="role">
                    <option value="student">Student</option>
                    <option value="admin">Admin / Teacher</option>
                </select>
            </div>

            <button type="submit" class="btn">Register</button>
            <a href="login.jsp" class="btn btn-secondary" style="display:block; box-sizing:border-box;">Back to Login</a>
        </form>
    </div>

</body>
</html>