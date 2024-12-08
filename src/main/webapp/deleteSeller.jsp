<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Seller</title>
</head>
<body>
    <%
        String sellerId = request.getParameter("sellerId");
        Connection conn = null;
        PreparedStatement pstmt = null;

        if (sellerId != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                String query = "DELETE FROM seller_table WHERE customer_id = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(sellerId));
                pstmt.executeUpdate();
                response.sendRedirect("manageSeller.jsp");
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        }
    %>
</body>
</html>
