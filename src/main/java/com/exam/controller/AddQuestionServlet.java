package com.exam.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.exam.dao.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/AddQuestionServlet")
public class AddQuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // ALLOW ANY SUBJECT: User can type a new subject name
        String subject = request.getParameter("subject");
        // If they used the "Other" text box, use that instead
        String newSubject = request.getParameter("newSubject");
        if(newSubject != null && !newSubject.trim().isEmpty()) {
            subject = newSubject;
        }

        String question = request.getParameter("question");
        String opA = request.getParameter("opA");
        String opB = request.getParameter("opB");
        String opC = request.getParameter("opC");
        String opD = request.getParameter("opD");
        String ans = request.getParameter("correctAnswer");
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO questions (subject, question_text, option_a, option_b, option_c, option_d, correct_answer) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, subject);
            ps.setString(2, question);
            ps.setString(3, opA);
            ps.setString(4, opB);
            ps.setString(5, opC);
            ps.setString(6, opD);
            ps.setString(7, ans);
            
            ps.executeUpdate();
            response.sendRedirect("admin.jsp?msg=Question Added Successfully!");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?msg=Error: " + e.getMessage());
        }
    }
}