<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Seller</title>
</head>
<body>
    <h1>Add Seller</h1>
    <form method="post">
        <label>First Name:</label><br>
        <input type="text" name="seller_fname" required><br>
        <label>Last Name:</label><br>
        <input type="text" name="seller_lname" required><br>
        <label>Location:</label><br>
        <input type="text" name="seller_location" required><br>
        <label>Contact:</label><br>
        <input type="text" name="seller_contact" required><br>
        <label>Email:</label><br>
        <input type="email" name="seller_email" required><br>
        <label>Password:</label><br>
        <input type="password" name="seller_password" required><br>
        <label>Status:</label><br>
        <input type="text" name="sellerstatus" required><br><br>
        <button type="submit">Add Seller</button>
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("post")) {
            String fname = request.getParameter("seller_fname");
            String lname = request.getParameter("seller_lname");
            String location = request.getParameter("seller_location");
            String contact = request.getParameter("seller_contact");
            String email = request.getParameter("seller_email");
            String password = request.getParameter("seller_password");
            String status = request.getParameter("sellerstatus");

            Connection conn = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                String query = "INSERT INTO seller_table (seller_fname, seller_lname, seller_location, seller_contact, seller_email, seller_password, sellerstatus) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, fname);
                pstmt.setString(2, lname);
                pstmt.setString(3, location);
                pstmt.setString(4, contact);
                pstmt.setString(5, email);
                pstmt.setString(6, password);
                pstmt.setString(7, status);
                pstmt.executeUpdate();
                response.sendRedirect("manageSeller.jsp");
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (conn != null) conn.close();
            }
        }
    %>
</body>
</html>
