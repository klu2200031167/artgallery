<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Listings</title>
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
        th, td {
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
        let artworks = [
            { id: 1, name: "Handcrafted Pot", price: 25, category: "Decor", available: true },
            { id: 2, name: "Wooden Sculpture", price: 50, category: "Sculpture", available: true }
        ];
        
        function renderArtworks() {
            const tableBody = document.getElementById('artworkTableBody');
            tableBody.innerHTML = ''; // Clear existing table rows

            artworks.forEach(artwork => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${artwork.id}</td>
                    <td>${artwork.name}</td>
                    <td>$${artwork.price}</td>
                    <td>${artwork.category}</td>
                    <td>${artwork.available ? "Available" : "Unavailable"}</td>
                    <td>
                        <button onclick="editArtwork(${artwork.id})">Edit</button>
                        <button onclick="deleteArtwork(${artwork.id})">Delete</button>
                    </td>
                `;
                tableBody.appendChild(row);
            });
        }

        function addArtwork() {
            const newArtworkName = prompt("Enter artwork name:");
            const newArtworkPrice = prompt("Enter artwork price:");
            const newArtworkCategory = prompt("Enter artwork category:");
            const newArtworkAvailable = confirm("Is this artwork available? (OK for Yes, Cancel for No)");

            if (newArtworkName && !isNaN(newArtworkPrice) && newArtworkPrice > 0) {
                const newArtwork = {
                    id: getNextId(),
                    name: newArtworkName,
                    price: parseFloat(newArtworkPrice),
                    category: newArtworkCategory || "Uncategorized",
                    available: newArtworkAvailable
                };
                artworks.push(newArtwork);
                renderArtworks();
            } else {
                alert("Invalid input! Please enter a valid name and price.");
            }
        }

        function editArtwork(artworkId) {
            const artwork = artworks.find(a => a.id === artworkId);
            if (artwork) {
                const newName = prompt("Edit artwork name:", artwork.name);
                const newPrice = prompt("Edit artwork price:", artwork.price);
                const newCategory = prompt("Edit artwork category:", artwork.category);
                const newAvailable = confirm("Is this artwork available? (OK for Yes, Cancel for No)");

                if (newName && !isNaN(newPrice) && newPrice > 0) {
                    artwork.name = newName;
                    artwork.price = parseFloat(newPrice);
                    artwork.category = newCategory || artwork.category;
                    artwork.available = newAvailable;
                    renderArtworks();
                } else {
                    alert("Invalid input! Please enter a valid name and price.");
                }
            }
        }

        function deleteArtwork(artworkId) {
            const confirmDelete = confirm("Are you sure you want to delete this artwork?");
            if (confirmDelete) {
                artworks = artworks.filter(a => a.id !== artworkId);
                updateArtworkIds(); // Update artwork IDs after deletion
                renderArtworks();
            }
        }

        function getNextId() {
            // Get the next ID based on existing artwork IDs
            if (artworks.length === 0) return 1;
            return Math.max(...artworks.map(artwork => artwork.id)) + 1;
        }

        function updateArtworkIds() {
            // Update the IDs of artworks to maintain synchronization
            artworks.forEach((artwork, index) => {
                artwork.id = index + 1;
            });
        }

        // Initial render
        window.onload = renderArtworks;
    </script>
</head>
<body>
    <header class="header">
        <a href="#" class="logo">Soulful Crafts Artisan</a>
        <nav class="nav-items">
            <a href="artisan_dashboard.html">Home</a>
            <a href="uploadartwork.jsp">Upload Artwork</a>
            <a href="manage-listings.html" class="active">Manage Listings</a>
            <a href="manageorders.jsp">Manage Orders</a>
            <a href="communicate.jsp">Communicate with Customers</a>
        </nav>
    </header>
    <section>
        <h1>Manage Your Artworks</h1>
        <button onclick="addArtwork()">Add New Artwork</button>
        <table>
            <thead>
                <tr>
                    <th>Artwork ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="artworkTableBody">
                <!-- Artwork rows will be rendered here -->
            </tbody>
        </table>
    </section>
</body>
</html>