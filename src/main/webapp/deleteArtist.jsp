<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String artistId = request.getParameter("artistId");

    if (artistId != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
            String deleteQuery = "DELETE FROM artist_table WHERE artist_id = ?";
            pstmt = conn.prepareStatement(deleteQuery);
            pstmt.setInt(1, Integer.parseInt(artistId));

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                out.println("Error deleting artist.");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>
