<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
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
        form {
            max-width: 600px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        form input, form select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        form button {
            background-color: #28A745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        form button:hover {
            background-color: #218838;
        }
        .form-header {
            font-size: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">Admin Dashboard</div>
        <div class="links">
            <a href="manageCustomers.jsp">Back to Manage Customers</a>
        </div>
    </div>
    <div class="content">
        <form method="post">
            <div class="form-header">Add a New Customer</div>
            <input type="text" name="cus_name" placeholder="Customer Name" required>
            <input type="email" name="cus_email" placeholder="Customer Email" required>
            <input type="password" name="cus_password" placeholder="Password" required>
            <input type="text" name="cus_contact" placeholder="Contact Number" required>
            <input type="date" name="cus_dob" placeholder="Date of Birth" required>
            <select name="cus_gender" required>
                <option value="" disabled selected>Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
            <input type="text" name="cus_location" placeholder="Location" required>
            <select name="cus_active" required>
                <option value="" disabled selected>Is Active?</option>
                <option value="1">Yes</option>
                <option value="0">No</option>
            </select>
            <button type="submit">Add Customer</button>
        </form>
        <% 
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String name = request.getParameter("cus_name");
                String email = request.getParameter("cus_email");
                String password = request.getParameter("cus_password");
                String contact = request.getParameter("cus_contact");
                String dob = request.getParameter("cus_dob");
                String gender = request.getParameter("cus_gender");
                String location = request.getParameter("cus_location");
                int active = Integer.parseInt(request.getParameter("cus_active"));

                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");

                    String query = "INSERT INTO cus_table (cus_name, cus_email, cus_password, cus_contact, cus_dob, cus_gender, cus_location, cus_active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, name);
                    pstmt.setString(2, email);
                    pstmt.setString(3, password);
                    pstmt.setString(4, contact);
                    pstmt.setString(5, dob);
                    pstmt.setString(6, gender);
                    pstmt.setString(7, location);
                    pstmt.setInt(8, active);

                    int rows = pstmt.executeUpdate();

                    if (rows > 0) {
                        out.println("<p>Customer added successfully!</p>");
                    } else {
                        out.println("<p>Error: Could not add customer.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>
    </div>
</body>
</html>
