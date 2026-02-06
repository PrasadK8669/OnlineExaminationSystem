<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.exam.model.Question" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ongoing Exam</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script>
        let totalSeconds = 600; 
        function startTimer() {
            const timerDisplay = document.getElementById("timer");
            const badge = document.getElementById("timer-badge");
            
            const interval = setInterval(() => {
                let m = Math.floor(totalSeconds / 60);
                let s = totalSeconds % 60;
                timerDisplay.innerText = m + ":" + (s < 10 ? "0" : "") + s;
                
                if (totalSeconds < 60) badge.classList.add("timer-warning");
                if (totalSeconds <= 0) {
                    clearInterval(interval);
                    document.getElementById("examForm").submit();
                }
                totalSeconds--;
            }, 1000);
        }
    </script>
</head>
<body onload="startTimer()">

    <div id="timer-badge" class="timer-badge">⏳ Time Left: <span id="timer">10:00</span></div>

    <div class="exam-container">
        <h2 style="border-bottom: 2px solid #f0f0f0; padding-bottom: 15px;">
            <%= request.getAttribute("subject") %> Assessment
        </h2>
        
        <form id="examForm" action="ResultServlet" method="post">
            <%
                List<Question> list = (List<Question>) request.getAttribute("questionList");
                if (list != null && !list.isEmpty()) {
                    int i = 1;
                    for (Question q : list) {
            %>
            
            <div class="question-box">
                <div class="q-text"><%= i++ %>. <%= q.getText() %></div>
                
                <label class="option-label">
                    <input type="radio" name="ans_<%= q.getId() %>" value="A" required> 
                    <span><%= q.getOpA() %></span>
                </label>
                <label class="option-label">
                    <input type="radio" name="ans_<%= q.getId() %>" value="B"> 
                    <span><%= q.getOpB() %></span>
                </label>
                <label class="option-label">
                    <input type="radio" name="ans_<%= q.getId() %>" value="C"> 
                    <span><%= q.getOpC() %></span>
                </label>
                <label class="option-label">
                    <input type="radio" name="ans_<%= q.getId() %>" value="D"> 
                    <span><%= q.getOpD() %></span>
                </label>
            </div>
            
            <% } } else { %>
                <p style="text-align:center; padding: 20px;">No questions available.</p>
            <% } %>

            <div style="text-align: center; margin-top: 30px;">
                <button type="submit" class="btn" style="max-width: 200px;">Submit Answers</button>
            </div>
            <input type="hidden" name="hiddenSubject" value="<%= request.getAttribute("subject") %>">
        </form>
    </div>

</body>
</html>