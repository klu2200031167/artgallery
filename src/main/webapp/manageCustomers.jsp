<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .navbar {
            background-color: #333;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .navbar h1 {
            margin: 0;
        }
        .content {
            padding: 20px;
        }
        .action-buttons {
            margin-bottom: 20px;
            text-align: right;
        }
        .action-buttons a {
            text-decoration: none;
            padding: 10px 15px;
            margin: 5px;
            color: white;
            border-radius: 5px;
            background-color: #007BFF;
        }
        .action-buttons a:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #333;
            color: white;
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
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Admin Dashboard</h1>
    </div>
    <div class="content">
        <div class="action-buttons">
            <a href="addCustomer.jsp">Add Customer</a>
        </div>
        <h2>Manage Customers</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>DOB</th>
                    <th>Gender</th>
                    <th>Location</th>
                    <th>Active</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        // Database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");

                        // Fetch data from cus_table
                        String query = "SELECT * FROM cus_table";
                        pstmt = conn.prepareStatement(query);
                        rs = pstmt.executeQuery();

                        // Dynamically generate table rows
                        while (rs.next()) {
                            int customerId = rs.getInt("cus_id");
                            String name = rs.getString("cus_name");
                            String email = rs.getString("cus_email");
                            String contact = rs.getString("cus_contact");
                            String dob = rs.getString("cus_dob");
                            String gender = rs.getString("cus_gender");
                            String location = rs.getString("cus_location");
                            boolean active = rs.getBoolean("cus_active");
                %>
                <tr>
                    <td><%= customerId %></td>
                    <td><%= name %></td>
                    <td><%= email %></td>
                    <td><%= contact %></td>
                    <td><%= dob %></td>
                    <td><%= gender %></td>
                    <td><%= location %></td>
                    <td><%= active ? "Yes" : "No" %></td>
                    <td>
                        <a href="editCustomer.jsp?customerId=<%= customerId %>" class="crud-button edit">Edit</a>
                        <a href="deleteCustomer.jsp?customerId=<%= customerId %>" class="crud-button delete" onclick="return confirm('Are you sure you want to delete this customer?')">Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='9'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
