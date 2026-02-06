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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        String r = request.getParameter("role");
        
        try {
            Connection con = DBConnection.getConnection();
            
            // 1. Check if username already exists
            PreparedStatement checkPs = con.prepareStatement("SELECT * FROM users WHERE username=?");
            checkPs.setString(1, u);
            ResultSet rs = checkPs.executeQuery();
            
            if (rs.next()) {
                // Username taken
                response.sendRedirect("register.jsp?msg=Username already exists!");
            } else {
                // 2. Insert new user
                PreparedStatement ps = con.prepareStatement("INSERT INTO users (username, password, role) VALUES (?, ?, ?)");
                ps.setString(1, u);
                ps.setString(2, p);
                ps.setString(3, r);
                
                int result = ps.executeUpdate();
                
                if (result > 0) {
                    // Success -> Go to login page
                    response.sendRedirect("login.jsp?msg=Registration Successful! Please Login.");
                } else {
                    response.sendRedirect("register.jsp?msg=Registration Failed.");
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?msg=Error: " + e.getMessage());
        }
    }
}