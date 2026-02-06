package com.exam.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.exam.dao.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int score = 0;
        int total = 0;
        // We need to know WHICH subject they just took. 
        // Note: You must add <input type="hidden" name="subject" value="<%= request.getAttribute("subject") %>"> in exam.jsp form!
        String subject = request.getParameter("hiddenSubject"); 

        try {
            Connection con = DBConnection.getConnection();
            Enumeration<String> paramNames = request.getParameterNames();
            
            while (paramNames.hasMoreElements()) {
                String paramName = paramNames.nextElement();
                if (paramName.startsWith("ans_")) {
                    total++;
                    int id = Integer.parseInt(paramName.substring(4));
                    String ans = request.getParameter(paramName);
                    
                    PreparedStatement ps = con.prepareStatement("SELECT correct_answer FROM questions WHERE id=?");
                    ps.setInt(1, id);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next() && rs.getString(1).equals(ans)) {
                        score++;
                    }
                }
            }
            
            // SAVE RESULT TO DATABASE
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("user");
            
            PreparedStatement savePs = con.prepareStatement("INSERT INTO results (username, subject, score, total) VALUES (?, ?, ?, ?)");
            savePs.setString(1, username);
            savePs.setString(2, subject);
            savePs.setInt(3, score);
            savePs.setInt(4, total);
            savePs.executeUpdate();
            
            request.setAttribute("score", score);
            request.setAttribute("total", total);
            request.getRequestDispatcher("result.jsp").forward(request, response);
            
        } catch (Exception e) { e.printStackTrace(); }
    }
}