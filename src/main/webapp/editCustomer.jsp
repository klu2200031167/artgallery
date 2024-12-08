<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            width: 100%;
        }
        label {
            display: block;
            margin: 15px 0 5px;
            font-weight: bold;
            color: #555;
        }
        input, select, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        .back-link {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: #007BFF;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        .error, .success {
            text-align: center;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            font-size: 14px;
        }
        .error {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }
        .success {
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Customer</h1>
        <form method="post">
            <%
                String cusId = request.getParameter("cus_id");
                String cusName = "", cusEmail = "", cusPassword = "", cusContact = "", cusDob = "", cusGender = "", cusLocation = "";
                int cusActive = 0;

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");

                    // Fetch customer data
                    String query = "SELECT * FROM cus_table WHERE cus_id = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, cusId);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        cusName = rs.getString("cus_name");
                        cusEmail = rs.getString("cus_email");
                        cusPassword = rs.getString("cus_password");
                        cusContact = rs.getString("cus_contact");
                        cusDob = rs.getString("cus_dob");
                        cusGender = rs.getString("cus_gender");
                        cusLocation = rs.getString("cus_location");
                        cusActive = rs.getInt("cus_active");
                    }
                } catch (Exception e) {
                    out.println("<div class='error'>Error fetching customer details: " + e.getMessage() + "</div>");
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            %>

            <!-- Form Fields -->
            <input type="hidden" name="cus_id" value="<%= cusId %>">
            <label for="cus_name">Name:</label>
            <input type="text" id="cus_name" name="cus_name" value="<%= cusName %>" required>

            <label for="cus_email">Email:</label>
            <input type="email" id="cus_email" name="cus_email" value="<%= cusEmail %>" required>

            <label for="cus_password">Password:</label>
            <input type="password" id="cus_password" name="cus_password" value="<%= cusPassword %>" required>

            <label for="cus_contact">Contact:</label>
            <input type="text" id="cus_contact" name="cus_contact" value="<%= cusContact %>" required>

            <label for="cus_dob">Date of Birth:</label>
            <input type="date" id="cus_dob" name="cus_dob" value="<%= cusDob %>" required>

            <label for="cus_gender">Gender:</label>
            <select id="cus_gender" name="cus_gender">
                <option value="Male" <%= cusGender.equals("Male") ? "selected" : "" %>>Male</option>
                <option value="Female" <%= cusGender.equals("Female") ? "selected" : "" %>>Female</option>
                <option value="Other" <%= cusGender.equals("Other") ? "selected" : "" %>>Other</option>
            </select>

            <label for="cus_location">Location:</label>
            <input type="text" id="cus_location" name="cus_location" value="<%= cusLocation %>" required>

            <label for="cus_active">Active:</label>
            <select id="cus_active" name="cus_active">
                <option value="1" <%= cusActive == 1 ? "selected" : "" %>>Active</option>
                <option value="0" <%= cusActive == 0 ? "selected" : "" %>>Inactive</option>
            </select>

            <button type="submit">Update Customer</button>
            <a href="manageCustomers.jsp" class="back-link">Back to Manage Customers</a>
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                // Fetch updated details from the form
                String updatedName = request.getParameter("cus_name");
                String updatedEmail = request.getParameter("cus_email");
                String updatedPassword = request.getParameter("cus_password");
                String updatedContact = request.getParameter("cus_contact");
                String updatedDob = request.getParameter("cus_dob");
                String updatedGender = request.getParameter("cus_gender");
                String updatedLocation = request.getParameter("cus_location");
                int updatedActive = Integer.parseInt(request.getParameter("cus_active"));

                try {
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artgallery", "root", "Deepu@02.");

                    // Update customer data
                    String updateQuery = "UPDATE cus_table SET cus_name = ?, cus_email = ?, cus_password = ?, cus_contact = ?, cus_dob = ?, cus_gender = ?, cus_location = ?, cus_active = ? WHERE cus_id = ?";
                    pstmt = conn.prepareStatement(updateQuery);
                    pstmt.setString(1, updatedName);
                    pstmt.setString(2, updatedEmail);
                    pstmt.setString(3, updatedPassword);
                    pstmt.setString(4, updatedContact);
                    pstmt.setString(5, updatedDob);
                    pstmt.setString(6, updatedGender);
                    pstmt.setString(7, updatedLocation);
                    pstmt.setInt(8, updatedActive);
                    pstmt.setString(9, cusId);

                    int rows = pstmt.executeUpdate();

                    if (rows > 0) {
                        out.println("<div class='success'>Customer updated successfully!</div>");
                    } else {
                        out.println("<div class='error'>Error: Could not update customer.</div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='error'>Error updating customer details: " + e.getMessage() + "</div>");
                } finally {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>
    </div>
</body>
</html>
