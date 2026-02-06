package com.exam.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    // Update these strictly to match your local MySQL setup
    private static final String URL = "jdbc:mysql://localhost:3306/online_exam";
    private static final String USER = "root"; 
    private static final String PASS = "root";

    public static Connection getConnection() {
        Connection con = null;
        try {
            // Load the driver class
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}