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

@WebServlet("/login") // This maps the URL form action to this Java class
public class LoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        
        try {
            Connection con = DBConnection.getConnection();
            // Use PreparedStatement to prevent SQL Injection
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1, u);
            ps.setString(2, p);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                // Login Success: Create Session
                HttpSession session = request.getSession();
                session.setAttribute("user", u);
                session.setAttribute("role", rs.getString("role"));
                
                // Redirect to a dashboard (you will create this later)
                response.sendRedirect("dashboard.jsp"); 
            } else {
                // Login Failed
                response.sendRedirect("login.jsp?error=Invalid Credentials");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}