<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Communicate with Customers</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f5f5f5;
            padding: 10px 20px;
        }

        .header .logo {
            font-size: 25px;
            color: #000;
            text-decoration: none;
        }

        .nav-items {
            display: flex;
            gap: 20px;
        }

        .nav-items a {
            text-decoration: none;
            color: #000;
            padding: 15px 20px;
            border-radius: 5px;
        }

        .nav-items a.active {
            background-color: #5edaf0;
            color: #fff;
        }

        section {
            padding: 20px;
        }

        h1 {
            color: #333;
        }

        button {
            background-color: #5edaf0;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        button:hover {
            background-color: #4db8db;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
    <script>
        let messages = [
            { id: 1, customerName: "Alice", message: "I love your work!", date: "2024-09-29" },
            { id: 2, customerName: "Bob", message: "Can I customize a sculpture?", date: "2024-09-30" }
        ];

        function renderMessages() {
            const tableBody = document.getElementById('messageTableBody');
            tableBody.innerHTML = ''; // Clear existing table rows

            messages.forEach(msg => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${msg.id}</td>
                    <td>${msg.customerName}</td>
                    <td>${msg.message}</td>
                    <td>${msg.date}</td>
                    <td>
                        <button onclick="replyToMessage(${msg.id})">Reply</button>
                        <button onclick="deleteMessage(${msg.id})">Delete</button>
                    </td>
                `;
                tableBody.appendChild(row);
            });
        }

        function replyToMessage(messageId) {
            const message = messages.find(m => m.id === messageId);
            if (message) {
                const reply = prompt("Reply to " + message.customerName + ":", "Thank you for your message!");
                if (reply) {
                    alert("Reply sent to " + message.customerName + ": " + reply);
                }
            }
        }

        function deleteMessage(messageId) {
            const confirmDelete = confirm("Are you sure you want to delete this message?");
            if (confirmDelete) {
                messages = messages.filter(m => m.id !== messageId);
                updateMessageIds(); // Update message IDs after deletion
                renderMessages();
            }
        }

        function getNextId() {
            // Get the next ID based on existing message IDs
            if (messages.length === 0) return 1;
            return Math.max(...messages.map(msg => msg.id)) + 1;
        }

        function updateMessageIds() {
            // Update the IDs of messages to maintain synchronization
            messages.forEach((msg, index) => {
                msg.id = index + 1;
            });
        }

        // Initial render
        window.onload = renderMessages;
    </script>
</head>

<body>
    <header class="header">
        <a href="#" class="logo">Soulful Crafts Artisan</a>
        <nav class="nav-items">
            <a href="artisan_dashboard.html">Home</a>
            <a href="upload-artwork.html">Upload Artwork</a>
            <a href="manage-listings.html">Manage Listings</a>
            <a href="manage-orders.html">Manage Orders</a>
            <a href="communicate.html" class="active">Communicate with Customers</a>
            <a href="logout.html">Logout</a>
        </nav>
    </header>
    <section>
        <h1>Communicate with Customers</h1>
        <table>
            <thead>
                <tr>
                    <th>Message ID</th>
                    <th>Customer Name</th>
                    <th>Message</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="messageTableBody">
                <!-- Message rows will be rendered here -->
            </tbody>
        </table>
    </section>
</body>

</html>