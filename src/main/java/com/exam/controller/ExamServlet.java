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
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.exam.model.Question;





@WebServlet("/ExamServlet")
public class ExamServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String subject = request.getParameter("subject");
        List<Question> list = new ArrayList<>();
        
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions WHERE subject=?");
            ps.setString(1, subject);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                list.add(new Question(
                    rs.getInt("id"),
                    rs.getString("question_text"),
                    rs.getString("option_a"),
                    rs.getString("option_b"),
                    rs.getString("option_c"),
                    rs.getString("option_d"),
                    rs.getString("correct_answer")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }

        // Send the list to the JSP
        request.setAttribute("questionList", list);
        request.setAttribute("subject", subject);
        request.getRequestDispatcher("exam.jsp").forward(request, response);
    }
}