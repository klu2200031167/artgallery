<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Sellers</title>
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
            <a href="manageSeller.jsp">Manage Sellers</a>
        </div>
    </div>
    <div class="content">
        <h1>Manage Sellers</h1>

        <!-- Add/Edit Form -->
        <div class="form-container">
            <h2><% if (request.getParameter("editSellerId") != null) { %>Edit Seller<% } else { %>Add Seller<% } %></h2>
            <form method="post">
                <input type="hidden" name="customer_id" value="<%= request.getParameter("editSellerId") != null ? request.getParameter("editSellerId") : "" %>">
                <input type="text" name="seller_fname" placeholder="First Name" value="<%= request.getParameter("editFname") != null ? request.getParameter("editFname") : "" %>" required>
                <input type="text" name="seller_lname" placeholder="Last Name" value="<%= request.getParameter("editLname") != null ? request.getParameter("editLname") : "" %>" required>
                <input type="text" name="seller_location" placeholder="Location" value="<%= request.getParameter("editLocation") != null ? request.getParameter("editLocation") : "" %>" required>
                <input type="text" name="seller_contact" placeholder="Contact" value="<%= request.getParameter("editContact") != null ? request.getParameter("editContact") : "" %>" required>
                <input type="email" name="seller_email" placeholder="Email" value="<%= request.getParameter("editEmail") != null ? request.getParameter("editEmail") : "" %>" required>
                <input type="password" name="seller_password" placeholder="Password" <%= request.getParameter("editSellerId") == null ? "required" : "" %>>
                <input type="text" name="sellerstatus" placeholder="Status" value="<%= request.getParameter("editStatus") != null ? request.getParameter("editStatus") : "" %>" required>
                <button type="submit"><% if (request.getParameter("editSellerId") != null) { %>Update Seller<% } else { %>Add Seller<% } %></button>
            </form>
        </div>

        <!-- Seller List -->
        <h2>Seller List</h2>
        <table>
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Location</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                        stmt = conn.createStatement();

                        String query = "SELECT * FROM seller_table";
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            int sellerId = rs.getInt("customer_id");
                            String fname = rs.getString("seller_fname");
                            String lname = rs.getString("seller_lname");
                            String location = rs.getString("seller_location");
                            String contact = rs.getString("seller_contact");
                            String email = rs.getString("seller_email");
                            String status = rs.getString("sellerstatus");
                %>
                <tr>
                    <td><%= sellerId %></td>
                    <td><%= fname %></td>
                    <td><%= lname %></td>
                    <td><%= location %></td>
                    <td><%= contact %></td>
                    <td><%= email %></td>
                    <td><%= status %></td>
                    <td>
                        <form method="post" style="display:inline;">
                            <input type="hidden" name="deleteSellerId" value="<%= sellerId %>">
                            <button class="crud-button delete" onclick="return confirm('Are you sure?')">Delete</button>
                        </form>
                        <a href="manageSeller.jsp?editSellerId=<%= sellerId %>&editFname=<%= fname %>&editLname=<%= lname %>&editLocation=<%= location %>&editContact=<%= contact %>&editEmail=<%= email %>&editStatus=<%= status %>" class="crud-button edit">Edit</a>
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
        // Add/Edit Seller Logic
        String sellerId = request.getParameter("customer_id");
        String fname = request.getParameter("seller_fname");
        String lname = request.getParameter("seller_lname");
        String location = request.getParameter("seller_location");
        String contact = request.getParameter("seller_contact");
        String email = request.getParameter("seller_email");
        String password = request.getParameter("seller_password");
        String status = request.getParameter("sellerstatus");

        if (fname != null && lname != null && location != null) {
            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                String query;

                if (sellerId != null && !sellerId.isEmpty()) {
                    query = "UPDATE seller_table SET seller_fname=?, seller_lname=?, seller_location=?, seller_contact=?, seller_email=?, sellerstatus=? WHERE customer_id=?";
                } else {
                    query = "INSERT INTO seller_table (seller_fname, seller_lname, seller_location, seller_contact, seller_email, seller_password, sellerstatus) VALUES (?, ?, ?, ?, ?, ?, ?)";
                }

                try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                    pstmt.setString(1, fname);
                    pstmt.setString(2, lname);
                    pstmt.setString(3, location);
                    pstmt.setString(4, contact);
                    pstmt.setString(5, email);
                    if (sellerId != null && !sellerId.isEmpty()) {
                        pstmt.setString(6, status);
                        pstmt.setInt(7, Integer.parseInt(sellerId));
                    } else {
                        pstmt.setString(6, password);
                        pstmt.setString(7, status);
                    }
                    pstmt.executeUpdate();
                }
                response.sendRedirect("manageSeller.jsp");
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }

        // Delete Seller Logic
        String deleteSellerId = request.getParameter("deleteSellerId");
        if (deleteSellerId != null) {
            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");
                String query = "DELETE FROM seller_table WHERE customer_id=?";
                try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                    pstmt.setInt(1, Integer.parseInt(deleteSellerId));
                    pstmt.executeUpdate();
                }
                response.sendRedirect("manageSeller.jsp");
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
</body>
</html>
