<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    int customerId = Integer.parseInt(request.getParameter("customerId"));

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");

        String query = "DELETE FROM cus_table WHERE cus_id = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, customerId);
        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            response.sendRedirect("manageCustomers.jsp");
        } else {
            out.println("Error: Customer not found.");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
