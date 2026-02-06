<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1. Destroy the session (removes user, role, etc.)
    session.invalidate();
    
    // 2. Redirect back to the login page
    response.sendRedirect("login.jsp?msg=You have been logged out.");
%>