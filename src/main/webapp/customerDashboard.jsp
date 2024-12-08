<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Navigation Bar Styles */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            padding: 15px;
        }

        .navbar .left, .navbar .right {
            display: flex;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
            font-weight: bold;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .navbar .right {
            margin-left: auto;
            color: white;
            font-size: 18px;
        }

        /* Card Styles */
        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
            gap: 20px;
        }

        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 250px;
            text-align: center;
            background-color: #fff;
            transition: transform 0.2s ease-in-out;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card .card-title {
            font-size: 18px;
            font-weight: bold;
            padding: 10px 0;
        }

        .card .card-description {
            font-size: 14px;
            color: #666;
            padding: 0 15px 15px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <div class="left">
            <a href="profile?email=${customer.email}">Profile</a>
            <a href="paintings">Paintings</a>
        </div>
        <div class="right">
            Welcome, ${customer.name}
        </div>
    </div>

    <!-- Paintings Gallery -->
    <div class="gallery">
        <!-- Card 1 -->
        <div class="card">
            <img src="cus-2.jpg" alt="Painting 1">
            <div class="card-title">Painting 1</div>
            <div class="card-description">A beautiful piece of art.</div>
        </div>

        <!-- Card 2 -->
        <div class="card">
            <img src="cus-1.jpg" alt="Painting 2">
            <div class="card-title">Painting 2</div>
            <div class="card-description">An abstract masterpiece.</div>
        </div>

        <!-- Card 3 -->
        <div class="card">
            <img src="pot.jpeg" alt="Painting 3">
            <div class="card-title">Painting 3</div>
            <div class="card-description">A vibrant and colorful work.</div>
        </div>

        <!-- Card 4 -->
        <div class="card">
            <img src="oil1.jpeg" alt="Painting 4">
            <div class="card-title">Painting 4</div>
            <div class="card-description">A serene landscape.</div>
        </div>
    </div>
</body>
</html>