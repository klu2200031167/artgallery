<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art for Home</title>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
	<style>
		body {
			font-family: 'Fraunces', serif;
			margin: 0;
			padding: 0;
		}
		.image-gallery {
			display: flex;
			flex-wrap: wrap;
			gap: 20px;
			justify-content: space-around;
			padding: 20px;
		}
		.image-gallery img {
			width: 24rem;
			height: 24rem;
			object-fit: cover;
			border-radius: 10px;
			box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
			cursor: pointer; /* Makes the images clickable */
		}
	</style>
</head>
<body>

<!-- Header Section -->
<header class="bg-dark py-2">
	<nav class="container d-flex justify-content-between align-items-center">
		<a href="#" class="text-white text-decoration-none d-flex align-items-center">
			<i class="bi bi-house-fill me-2"></i> Home
		</a>
		<a href="paintings.jsp" class="text-white text-decoration-none d-flex align-items-center">
			<i class="bi bi-brush-fill me-2"></i> Paintings
		</a>
		<a href="login.jsp" class="text-white text-decoration-none d-flex align-items-center">
			<i class="bi bi-box-arrow-in-right me-2"></i> Login
		</a>
		<a href="aboutus.jsp" class="text-white text-decoration-none d-flex align-items-center">
			<i class="bi bi-info-circle-fill me-2"></i> About Us
		</a>
		<a href="contactus.jsp" class="text-white text-decoration-none d-flex align-items-center">
			<i class="bi bi-envelope-fill me-2"></i> Contact Us
		</a>
	</nav>
</header>

<!-- Main Content -->
<div class="main">
	<!-- Image Gallery Section -->
	<div class="image-gallery">
		<img src="aestetic1.jpeg" alt="Red Beauty Nature" onclick="showLoginMessage()">
		<img src="aestetic2.jpeg" alt="Other Type Painting" onclick="showLoginMessage()">
		<img src="aestetic3.jpeg" alt="Trending Art Picture" onclick="showLoginMessage()">
		<img src="animal1.jpeg" alt="Abstract Art" onclick="showLoginMessage()">
		<img src="oil1.jpeg" alt="Modern Art" onclick="showLoginMessage()">
		<img src="oil.jpeg" alt="Nature Painting" onclick="showLoginMessage()">
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="loginModalLabel">Access Restricted</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				Please log in to view this content.
			</div>
			<div class="modal-footer">
				<a href="login.jsp" class="btn btn-primary">Login</a>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- JavaScript -->
<script>
	function showLoginMessage() {
		// Show the Bootstrap modal
		var myModal = new bootstrap.Modal(document.getElementById('loginModal'), {});
		myModal.show();
	}
</script>

</body>
</html>
