<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Seller</title>
</head>
<body>
    <h1>Edit Seller</h1>
    <%
        String sellerId = request.getParameter("sellerId");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String fname = "", lname = "", location = "", contact = "", email = "", status = "";
        if (sellerId != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                String query = "SELECT * FROM seller_table WHERE customer_id = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(sellerId));
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    fname = rs.getString("seller_fname");
                    lname = rs.getString("seller_lname");
                    location = rs.getString("seller_location");
                    contact = rs.getString("seller_contact");
                    email = rs.getString("seller_email");
                    status = rs.getString("sellerstatus");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        }
    %>
    <form method="post">
        <label>First Name:</label><br>
        <input type="text" name="seller_fname" value="<%= fname %>" required><br>
        <label>Last Name:</label><br>
        <input type="text" name="seller_lname" value="<%= lname %>" required><br>
        <label>Location:</label><br>
        <input type="text" name="seller_location" value="<%= location %>" required><br>
        <label>Contact:</label><br>
        <input type="text" name="seller_contact" value="<%= contact %>" required><br>
        <label>Email:</label><br>
        <input type="email" name="seller_email" value="<%= email %>" required><br>
        <label>Status:</label><br>
        <input type="text" name="sellerstatus" value="<%= status %>" required><br><br>
        <button type="submit">Update Seller</button>
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("post")) {
            fname = request.getParameter("seller_fname");
            lname = request.getParameter("seller_lname");
            location = request.getParameter("seller_location");
            contact = request.getParameter("seller_contact");
            email = request.getParameter("seller_email");
            status = request.getParameter("sellerstatus");

            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                String query = "UPDATE seller_table SET seller_fname = ?, seller_lname = ?, seller_location = ?, seller_contact = ?, seller_email = ?, sellerstatus = ? WHERE customer_id = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, fname);
                pstmt.setString(2, lname);
                pstmt.setString(3, location);
                pstmt.setString(4, contact);
                pstmt.setString(5, email);
                pstmt.setString(6, status);
                pstmt.setInt(7, Integer.parseInt(sellerId));
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
