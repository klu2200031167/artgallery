<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('bg_1.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            text-align: center;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .container h1 {
            color: #6a1b9a;
            margin-bottom: 20px;
        }
        .container input {
            display: block;
            width: 90%;
            padding: 10px;
            margin: 10px auto;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .container button {
            background-color: #6a1b9a;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .container button:hover {
            background-color: #4a148c;
        }
        .register-link {
            margin-top: 20px;
            color: #6a1b9a;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
        }
        .register-link:hover {
            text-decoration: underline;
        }
        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Customer Login</h1>
        <form action="authenticateCustomer" method="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <a href="customerregister.jsp" class="register-link">Don't have an account? Create one</a>

        <!-- Display error message if login fails -->
        <c:if test="${not empty errorMessage}">
            <p class="error-message">${errorMessage}</p>
        </c:if>
    </div>
</body>
</html>
