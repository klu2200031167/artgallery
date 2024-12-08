<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artist Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('bg_5.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .container {
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 50px auto;
        }
        h1 {
            text-align: center;
        }
        .art-table {
            width: 100%;
            border-collapse: collapse;
        }
        .art-table th, .art-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .art-table th {
            background-color: #f4f4f4;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, ${artist.name}!</h1>
        <h3>Your Arts</h3>
        <table class="art-table">
            <thead>
                <tr>
                    <th>Art Name</th>
                    <th>Location</th>
                    <th>Price</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="art" items="${artist.arts}">
                    <tr>
                        <td>${art.artname}</td>
                        <td>${art.location}</td>
                        <td>${art.artprice}</td>
                        <td><img src="${art.imglink}" alt="${art.artname}" width="100"></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <a href="${pageContext.request.contextPath}/addArt" class="btn">Add New Art</a>
    </div>
</body>
</html>
