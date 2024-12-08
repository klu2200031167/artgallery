<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>
    <style>
    body {
			font-family: Arial, sans-serif;
			background-image: url('bg_cus.jpg');
			background-size: cover; /* Ensures the image covers the entire screen */
			background-position: center; /* Centers the image */
			background-repeat: no-repeat; /* Prevents the image from repeating */
			margin: 0;
			padding: 0;
		}
        .container {
            max-width: 500px;
            margin: 50px auto;
            text-align: center;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .container h1 {
            color: #6a1b9a;
            margin-bottom: 20px;
        }
        .container input, .container select {
            display: block;
            width: 90%;
            padding: 10px;
            margin: 10px auto;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .container button {
            background-color: #6a1b9a;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .container button:hover {
            background-color: #4a148c;
        }
        .login-link {
            margin-top: 20px;
            color: #6a1b9a;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
        }
        .login-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Customer Registration</h1>
        <form action="registerCustomer" method="post">
            <input type="text" name="name" placeholder="Full Name" required>
            <select name="gender" required>
                <option value="" disabled selected>Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
            <input type="date" name="dateofbirth" placeholder="Date of Birth" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="location" placeholder="Location" required>
            <input type="text" name="contact" placeholder="Contact Number" required>
            <button type="submit">Register</button>
        </form>
        <a href="customerlogin.jsp" class="login-link">Already have an account? Login</a>
    </div>
</body>
</html>
