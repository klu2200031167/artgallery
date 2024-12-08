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
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">Admin Dashboard</div>
        <div class="links">
            <a href="dashboard.jsp">Dashboard</a>
            <a href="exhibitions.jsp">Add Exhibition</a>
            <a href="manageCustomers.jsp">Manage Customers</a>
            <a href="customerDashboard.jsp">Customer Dashboard</a><!-- Link to Customer Dashboard -->
            <a href="artistDashboard.jsp">Artist Dashboard</a>
            <a href="manageArtist.jsp">Manage Artist</a>
            <a href="sellerDashboard.jsp">Seller Dashboard</a>
            <a href="manageSeller.jsp">manager Dashboard</a>
        </div>
    </div>
    <div class="content">
        <h1>Manage Customers</h1>
        <table>
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Name</th>
                    <th>Email</th>
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
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database_name", "your_username", "your_password");
                        stmt = conn.createStatement();

                        // Fetch data from cus_table
                        String query = "SELECT * FROM cus_table";
                        rs = stmt.executeQuery(query);

                        // Dynamically generate table rows
                        while (rs.next()) {
                            int customerId = rs.getInt("customer_id");
                            String name = rs.getString("name");
                            String email = rs.getString("email");
                %>
                <tr>
                    <td><%= customerId %></td>
                    <td><%= name %></td>
                    <td><%= email %></td>
                    <td>
                        <a href="editCustomer.jsp?customerId=<%= customerId %>" class="crud-button edit">Edit</a>
                        <a href="deleteCustomer.jsp?customerId=<%= customerId %>" class="crud-button delete">Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close resources
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
