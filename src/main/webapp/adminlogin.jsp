<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        html, body {
            height: 100%; /* Ensures the background covers the full height of the page */
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('bg_2.jpg'); /* Background image */
            background-size: cover; /* Ensures the image fully covers the page */
            background-position: center; /* Centers the image */
            background-repeat: no-repeat; /* Prevents the image from repeating */
        }
        .container {
            max-width: 400px; /* Fixed width for the login box */
            margin: 50px auto; /* Centers the login box horizontally */
            text-align: center;
            background-color: white; /* White background for contrast */
            padding: 20px;
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        }
        .container h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .container input {
            display: block;
            width: 90%; /* Input field width */
            padding: 10px;
            margin: 10px auto; /* Space between fields */
            border: 1px solid #ddd; /* Light border */
            border-radius: 5px; /* Rounded input fields */
        }
        .container button {
            background-color: #007bff; /* Blue button background */
            color: white; /* White button text */
            padding: 10px; /* Padding inside button */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor on hover */
        }
        .container button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        .error {
            color: red; /* Error message color */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Login</h1>
        <form action="${pageContext.request.contextPath}/authenticateAdmin" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <c:if test="${not empty errorMessage}">
            <p class="error">${errorMessage}</p>
        </c:if>
    </div>
</body>
</html>
