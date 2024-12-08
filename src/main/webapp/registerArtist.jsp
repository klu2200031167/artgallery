<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Artist</title>
    <style>
    body {
			font-family: Arial, sans-serif;
			background-image: url('bg_4.jpg');
			background-size: cover; /* Ensures the image covers the entire screen */
			background-position: center; /* Centers the image */
			background-repeat: no-repeat; /* Prevents the image from repeating */
			margin: 0;
			padding: 0;
		}
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .container h1 {
            color: #333;
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
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .container button:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
        }
        .success {
            color: green;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Register as Artist</h1>
        <c:if test="${not empty alreadyRegistered}">
            <p class="error">You are already registered! <a href="artistlogin.jsp">Login here</a>.</p>
        </c:if>
        <c:if test="${empty alreadyRegistered}">
            <form action="${pageContext.request.contextPath}/registerArtist" method="post">
                <input type="text" name="name" placeholder="Name" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="text" name="location" placeholder="Location" required>
                <button type="submit">Register</button>
            </form>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <p class="error">${errorMessage}</p>
        </c:if>
        <c:if test="${not empty successMessage}">
            <p class="success">${successMessage}</p>
        </c:if>
    </div>
</body>
</html>
