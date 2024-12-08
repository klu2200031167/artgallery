<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Dashboard</title>
    <style>
        .dashboard {
            text-align: center;
            margin-top: 50px;
        }
        .dashboard h1 {
            color: #333;
        }
        .dashboard a {
            display: inline-block;
            margin: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .dashboard a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <h1>Welcome to Seller Dashboard</h1>
        <p>Hello, ${seller.firstname} ${seller.lastname}!</p>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</body>
</html>
