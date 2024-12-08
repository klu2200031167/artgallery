<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Arts</title>
    <style>
        table { /* Add your styles here */ }
    </style>
</head>
<body>
    <div class="container">
        <h1>Available Arts</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Art Name</th>
                    <th>Location</th>
                    <th>Artist Name</th>
                    <th>Price</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="art" items="${artsList}">
                    <tr>
                        <td>${art.id}</td>
                        <td>${art.artname}</td>
                        <td>${art.location}</td>
                        <td>${art.artistname}</td>
                        <td>${art.artprice}</td>
                        <td><img src="${art.imglink}" alt="${art.artname}" width="100"></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
