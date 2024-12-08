<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exhibitions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #6a1b9a;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .container {
            padding: 20px;
        }
        h2 {
            color: #6a1b9a;
        }
        .exhibitions {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .exhibition {
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            width: 30%;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .exhibition img {
            width: 100%;
            border-radius: 8px;
        }
        .footer {
            background-color: #6a1b9a;
            color: white;
            text-align: center;
            padding: 10px;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h1>Exhibitions</h1>
    </div>

    <!-- Main Container -->
    <div class="container">
        <!-- Current Exhibitions Section -->
        <h2>Current Exhibitions</h2>
        <div class="exhibitions">
            <div class="exhibition">
                <img src="exb9.jpeg" alt="Exhibition 1">
                <h3>Exhibition Title 1</h3>
                <p>Details about artists, artworks, and themes.</p>
            </div>
            <div class="exhibition">
                <img src="exb10.jpeg" alt="Exhibition 2">
                <h3>Exhibition Title 2</h3>
                <p>Information about layout, duration, and events.</p>
            </div>
            <div class="exhibition">
                <img src="exb8.jpeg" alt="Exhibition 3">
                <h3>Exhibition Title 3</h3>
                <p>Insights into the cultural significance of works.</p>
            </div>
        </div>

        <!-- Upcoming Exhibitions Section -->
        <h2>Upcoming Exhibitions</h2>
        <div class="exhibitions">
            <div class="exhibition">
                <img src="exb7.jpeg" alt="Upcoming Exhibition 1">
                <h3>Upcoming Exhibition 1</h3>
                <p>Preview of artists and themes for the upcoming show.</p>
            </div>
            <div class="exhibition">
                <img src="exb6.jpeg" alt="Upcoming Exhibition 2">
                <h3>Upcoming Exhibition 2</h3>
                <p>Exciting new artworks set to be displayed soon.</p>
            </div>
            <div class="exhibition">
                <img src="exb5.jpeg" alt="Upcoming Exhibition 3">
                <h3>Upcoming Exhibition 3</h3>
                <p>Get ready for the unveiling of these special pieces.</p>
            </div>
        </div>

        <!-- Past Exhibitions Section -->
        <h2>Past Exhibitions</h2>
        <div class="exhibitions">
            <div class="exhibition">
                <img src="exb3.jpeg" alt="Past Exhibition 1">
                <h3>Past Exhibition 1</h3>
                <p>Recap of artworks and the cultural impact of the show.</p>
            </div>
            <div class="exhibition">
                <img src="exb2.jpeg" alt="Past Exhibition 2">
                <h3>Past Exhibition 2</h3>
                <p>Memorable moments and highlights from this exhibition.</p>
            </div>
            <div class="exhibition">
                <img src="exb1.jpeg" alt="Past Exhibition 3">
                <h3>Past Exhibition 3</h3>
                <p>Reflections on the artistic works and audience reception.</p>
            </div>
        </div>
    </div>

    

</body>
</html>