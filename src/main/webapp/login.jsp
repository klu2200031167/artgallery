<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-image: url('bg_prod.jpg');
			background-size: cover; /* Ensures the image covers the entire screen */
			background-position: center; /* Centers the image */
			background-repeat: no-repeat; /* Prevents the image from repeating */
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
		h1 {
			color: #6a1b9a;
			margin-bottom: 20px;
		}
		.button {
			display: block;
			margin: 10px 0;
			background-color: #6a1b9a;
			color: white;
			padding: 10px;
			border: none;
			border-radius: 5px;
			text-decoration: none;
			font-size: 16px;
		}
		.button:hover {
			background-color: #5b1281; /* Darker shade of purple on hover */
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>Select Login Type</h1>
		<a href="customerregister.jsp" class="button">Customer Login</a>
		<a href="adminlogin.jsp" class="button">Admin Login</a>
		<a href="registerArtist.jsp" class="button">Artist Login</a>
		<a href="sellerRegister.jsp" class="button">Seller Login</a>
	</div>
</body>
</html>
