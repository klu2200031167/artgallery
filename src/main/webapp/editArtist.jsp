<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String artistId = request.getParameter("artistId");
    String name = "", email = "", location = "";

    if (artistId != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
            String query = "SELECT * FROM artist_table WHERE artist_id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(artistId));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("artist_name");
                email = rs.getString("artist_email");
                location = rs.getString("artist_location");
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
<!DOCTYPE html>
<html>
<head>
    <title>Edit Artist</title>
</head>
<body>
    <h1>Edit Artist</h1>
    <form method="post">
        Name: <input type="text" name="artist_name" value="<%= name %>" required><br>
        Email: <input type="email" name="artist_email" value="<%= email %>" required><br>
        Location: <input type="text" name="artist_location" value="<%= location %>" required><br>
        <button type="submit">Update Artist</button>
    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String updatedName = request.getParameter("artist_name");
            String updatedEmail = request.getParameter("artist_email");
            String updatedLocation = request.getParameter("artist_location");

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                String updateQuery = "UPDATE artist_table SET artist_name = ?, artist_email = ?, artist_location = ? WHERE artist_id = ?";
                pstmt = conn.prepareStatement(updateQuery);
                pstmt.setString(1, updatedName);
                pstmt.setString(2, updatedEmail);
                pstmt.setString(3, updatedLocation);
                pstmt.setInt(4, Integer.parseInt(artistId));

                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    out.println("Artist updated successfully!");
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
