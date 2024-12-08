<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Artists</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #333;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            text-align: center;
        }
        .navbar a:hover {
            background-color: #575757;
            border-radius: 5px;
        }
        .navbar .logo {
            font-size: 18px;
            font-weight: bold;
        }
        .content {
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        .crud-button {
            padding: 5px 10px;
            text-decoration: none;
            color: white;
            border-radius: 3px;
            background-color: #007BFF;
        }
        .crud-button.delete {
            background-color: #DC3545;
        }
        .crud-button.edit {
            background-color: #28A745;
        }
        .form-container {
            margin-bottom: 20px;
        }
        .form-container input {
            margin: 5px 0;
            padding: 5px;
            width: 100%;
            max-width: 400px;
        }
        .form-container button {
            padding: 5px 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">Admin Dashboard</div>
        <div class="links">
            <a href="dashboard.jsp">Dashboard</a>
            <a href="manageCustomers.jsp">Manage Customers</a>
            <a href="manageArtist.jsp">Manage Artists</a>
        </div>
    </div>
    <div class="content">
        <h1>Manage Artists</h1>

        <!-- Form to Add or Edit Artist -->
        <div class="form-container">
            <h2><% if (request.getParameter("editArtistId") != null) { %>Edit Artist<% } else { %>Add Artist<% } %></h2>
            <form method="post">
                <input type="hidden" name="artist_id" value="<%= request.getParameter("editArtistId") != null ? request.getParameter("editArtistId") : "" %>">
                <input type="text" name="artist_name" placeholder="Name" value="<%= request.getParameter("editName") != null ? request.getParameter("editName") : "" %>" required>
                <input type="email" name="artist_email" placeholder="Email" value="<%= request.getParameter("editEmail") != null ? request.getParameter("editEmail") : "" %>" required>
                <input type="text" name="artist_location" placeholder="Location" value="<%= request.getParameter("editLocation") != null ? request.getParameter("editLocation") : "" %>" required>
                <input type="password" name="artist_password" placeholder="Password" <%= request.getParameter("editArtistId") == null ? "required" : "" %>>
                <button type="submit"><% if (request.getParameter("editArtistId") != null) { %>Update Artist<% } else { %>Add Artist<% } %></button>
            </form>
        </div>

        <!-- List of Artists -->
        <h2>Artists List</h2>
        <table>
            <thead>
                <tr>
                    <th>Artist ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Location</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                        stmt = conn.createStatement();

                        // Fetch data from artist_table
                        String query = "SELECT * FROM artist_table";
                        rs = stmt.executeQuery(query);

                        // Generate table rows dynamically
                        while (rs.next()) {
                            int artistId = rs.getInt("artist_id");
                            String name = rs.getString("artist_name");
                            String email = rs.getString("artist_email");
                            String location = rs.getString("artist_location");
                %>
                <tr>
                    <td><%= artistId %></td>
                    <td><%= name %></td>
                    <td><%= email %></td>
                    <td><%= location %></td>
                    <td>
                        <form method="post" style="display:inline;">
                            <input type="hidden" name="deleteArtistId" value="<%= artistId %>">
                            <button class="crud-button delete" onclick="return confirm('Are you sure you want to delete this artist?')">Delete</button>
                        </form>
                        <a href="manageArtist.jsp?editArtistId=<%= artistId %>&editName=<%= name %>&editEmail=<%= email %>&editLocation=<%= location %>" class="crud-button edit">Edit</a>
                    </td>
                </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>

    <%
        // Handling Add or Edit Form Submission
        String artistId = request.getParameter("artist_id");
        String name = request.getParameter("artist_name");
        String email = request.getParameter("artist_email");
        String location = request.getParameter("artist_location");
        String password = request.getParameter("artist_password");

        if (artistId != null || name != null || email != null || location != null) {
            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                String query;

                if (artistId != null && !artistId.isEmpty()) {
                    query = "UPDATE artist_table SET artist_name=?, artist_email=?, artist_location=? WHERE artist_id=?";
                } else {
                    query = "INSERT INTO artist_table (artist_name, artist_email, artist_location, artist_password) VALUES (?, ?, ?, ?)";
                }

                try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                    pstmt.setString(1, name);
                    pstmt.setString(2, email);
                    pstmt.setString(3, location);
                    if (artistId != null && !artistId.isEmpty()) {
                        pstmt.setInt(4, Integer.parseInt(artistId));
                    } else {
                        pstmt.setString(4, password);
                    }
                    pstmt.executeUpdate();
                }
                response.sendRedirect("manageArtist.jsp");
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }

        // Handling Delete Request
        String deleteArtistId = request.getParameter("deleteArtistId");
        if (deleteArtistId != null) {
            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                String query = "DELETE FROM artist_table WHERE artist_id = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                    pstmt.setInt(1, Integer.parseInt(deleteArtistId));
                    pstmt.executeUpdate();
                }
                response.sendRedirect("manageArtist.jsp");
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
</body>
</html>
