<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Artist</title>
</head>
<body>
    <h1>Add New Artist</h1>
    <form method="post">
        Name: <input type="text" name="artist_name" required><br>
        Email: <input type="email" name="artist_email" required><br>
        Location: <input type="text" name="artist_location" required><br>
        Password: <input type="password" name="artist_password" required><br>
        <button type="submit">Add Artist</button>
    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String name = request.getParameter("artist_name");
            String email = request.getParameter("artist_email");
            String location = request.getParameter("artist_location");
            String password = request.getParameter("artist_password");

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                String query = "INSERT INTO artist_table (artist_name, artist_email, artist_location, artist_password) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, location);
                pstmt.setString(4, password);

                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    out.println("Artist added successfully!");
                }
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
