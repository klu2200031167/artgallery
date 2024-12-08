<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Art</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('bg_4.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .container h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
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
            display: block;
            margin: 0 auto;
        }
        .container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Art</h1>
        <form action="${pageContext.request.contextPath}/addArt" method="post">
            <input type="text" name="artname" placeholder="Art Name" required>
            <input type="text" name="location" placeholder="Location" required>
            <input type="text" name="artprice" placeholder="Price" required>
            <input type="text" name="imglink" placeholder="Image URL" required>
            <button type="submit">Add Art</button>
        </form>
    </div>
</body>
</html>
