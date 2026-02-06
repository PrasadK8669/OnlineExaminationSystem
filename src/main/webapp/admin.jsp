<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // SECURITY: Only allow 'admin' role
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Add Question</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <div class="auth-container" style="max-width: 600px; margin-top: 40px;">
        <div class="auth-header">Add New Question</div>
        
        <% String msg = request.getParameter("msg"); 
           if(msg != null) { %> 
           <div style="color: green; margin-bottom: 15px; font-weight: bold;"><%= msg %></div> 
        <% } %>

        <form action="AddQuestionServlet" method="post">
            
            <div class="form-group">
                <label>Select Existing Subject:</label>
                <select name="subject">
                    <option value="Java">Java</option>
                    <option value="SQL">SQL</option>
                    <option value="Python">Python</option>
                </select>
            </div>

            <div class="form-group">
                <label style="color: #ff6b6b;">OR Type New Subject:</label>
                <input type="text" name="newSubject" placeholder="e.g. C++, Physics (Leave empty to use list above)">
            </div>
            
            <hr style="border: 0; border-top: 1px solid #eee; margin: 20px 0;">

            <div class="form-group">
                <label>Question Text:</label>
                <textarea name="question" rows="3" required></textarea>
            </div>

            <div class="grid-container" style="padding: 0; display: grid; grid-template-columns: 1fr 1fr; gap: 15px; text-align: left;">
                <div>
                    <label>Option A:</label>
                    <input type="text" name="opA" required>
                </div>
                <div>
                    <label>Option B:</label>
                    <input type="text" name="opB" required>
                </div>
                <div>
                    <label>Option C:</label>
                    <input type="text" name="opC" required>
                </div>
                <div>
                    <label>Option D:</label>
                    <input type="text" name="opD" required>
                </div>
            </div>

            <div class="form-group" style="margin-top: 20px;">
                <label>Correct Answer:</label>
                <select name="correctAnswer">
                    <option value="A">Option A</option>
                    <option value="B">Option B</option>
                    <option value="C">Option C</option>
                    <option value="D">Option D</option>
                </select>
            </div>

            <button type="submit" class="btn">Save Question</button>
            <a href="dashboard.jsp" class="btn btn-secondary" style="display:block; text-align:center; box-sizing:border-box;">Back to Dashboard</a>
        </form>
    </div>

</body>
</html>