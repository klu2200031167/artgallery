<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Orders</title>
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
        let orders = [
            { id: 1, customerName: "John Doe", totalAmount: 75, status: "Pending" },
            { id: 2, customerName: "Jane Smith", totalAmount: 120, status: "Shipped" }
        ];

        function renderOrders() {
            const tableBody = document.getElementById('orderTableBody');
            tableBody.innerHTML = ''; // Clear existing table rows

            orders.forEach(order => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${order.id}</td>
                    <td>${order.customerName}</td>
                    <td>$${order.totalAmount}</td>
                    <td>${order.status}</td>
                    <td>
                        <button onclick="editOrder(${order.id})">Edit</button>
                        <button onclick="deleteOrder(${order.id})">Delete</button>
                    </td>
                `;
                tableBody.appendChild(row);
            });
        }

        function addOrder() {
            const newCustomerName = prompt("Enter customer name:");
            const newTotalAmount = prompt("Enter total amount:");
            const newStatus = prompt("Enter order status (Pending/Shipped):");

            if (newCustomerName && !isNaN(newTotalAmount) && newTotalAmount > 0 && (newStatus === "Pending" || newStatus === "Shipped")) {
                const newOrder = {
                    id: getNextId(),
                    customerName: newCustomerName,
                    totalAmount: parseFloat(newTotalAmount),
                    status: newStatus
                };
                orders.push(newOrder);
                renderOrders();
            } else {
                alert("Invalid input! Please enter valid order details.");
            }
        }

        function editOrder(orderId) {
            const order = orders.find(o => o.id === orderId);
            if (order) {
                const newName = prompt("Edit customer name:", order.customerName);
                const newAmount = prompt("Edit total amount:", order.totalAmount);
                const newStatus = prompt("Edit order status (Pending/Shipped):", order.status);

                if (newName && !isNaN(newAmount) && newAmount > 0 && (newStatus === "Pending" || newStatus === "Shipped")) {
                    order.customerName = newName;
                    order.totalAmount = parseFloat(newAmount);
                    order.status = newStatus;
                    renderOrders();
                } else {
                    alert("Invalid input! Please enter valid order details.");
                }
            }
        }

        function deleteOrder(orderId) {
            const confirmDelete = confirm("Are you sure you want to delete this order?");
            if (confirmDelete) {
                orders = orders.filter(o => o.id !== orderId);
                updateOrderIds(); // Update order IDs after deletion
                renderOrders();
            }
        }

        function getNextId() {
            // Get the next ID based on existing order IDs
            if (orders.length === 0) return 1;
            return Math.max(...orders.map(order => order.id)) + 1;
        }

        function updateOrderIds() {
            // Update the IDs of orders to maintain synchronization
            orders.forEach((order, index) => {
                order.id = index + 1;
            });
        }

        // Initial render
        window.onload = renderOrders;
    </script>
</head>

<body>
    <header class="header">
        <a href="#" class="logo">Soulful Crafts Artisan</a>
        <nav class="nav-items">
            <a href="artisan_dashboard.html">Home</a>
            <a href="upload-artwork.html">Upload Artwork</a>
            <a href="manage-listings.html">Manage Listings</a>
            <a href="manage-orders.html" class="active">Manage Orders</a>
            <a href="communicate.html">Communicate with Customers</a>
            <a href="logout.html">Logout</a>
        </nav>
    </header>
    <section>
        <h1>Manage Your Orders</h1>
        <button onclick="addOrder()">Add New Order</button>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="orderTableBody">
                <!-- Order rows will be rendered here -->
            </tbody>
        </table>
    </section>
</body>

</html>