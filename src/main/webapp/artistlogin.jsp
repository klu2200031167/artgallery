<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artist Login</title>
    <style>
    body {
			font-family: Arial, sans-serif;
			background-image: url('bg_5.jpg');
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Artist Login</h1>
        <form action="${pageContext.request.contextPath}/authenticateArtist" method="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <c:if test="${not empty errorMessage}">
            <p class="error">${errorMessage}</p>
        </c:if>
    </div>
</body>
</html>
