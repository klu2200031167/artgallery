<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Online Art Store</title>  
    <style>  
        /* Add your previous styles here... */  

        body {  
            font-family: Arial, sans-serif;  
            margin: 0;  
            padding: 0;  
            background-color: #f4f4f4;  
        }  

        /* Header styles */  
        .header {  
            background-color: #6a1b9a;  
            color: white;  
            padding: 10px;  
            text-align: center;  
            font-size: 24px;  
        }  

        /* Container for categories and paintings */  
        .container {  
            display: flex;  
            padding: 20px;  
        }  

        /* Sidebar for categories */  
        .sidebar {  
            width: 20%;  
            background-color: white;  
            padding: 20px;  
            border-radius: 8px;  
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);  
        }  

        .sidebar h3 {  
            margin-bottom: 20px;  
            text-align: center;  
        }  

        .sidebar ul {  
            list-style: none;  
            padding: 0;  
        }  

        .sidebar ul li {  
            margin: 10px 0;  
            padding: 10px;  
            background-color: #f4f4f4;  
            border-radius: 4px;  
            text-align: center;  
            cursor: pointer;  
        }  

        .sidebar ul li:hover, .sidebar ul li.active {  
            background-color: #6a1b9a;  
            color: white;  
        }  

        /* Main content area for paintings */  
        .main-content {  
            width: 60%;  
            margin-left: 20px;  
        }  

        .main-content h3 {  
            text-align: center;  
            margin-bottom: 20px;  
        }  

        /* Grid layout for paintings */  
        .grid {  
            display: flex;  
            gap: 20px;  
            flex-wrap: wrap;  
        }  

        .grid-item {  
            background-color: white;  
            padding: 15px;  
            border-radius: 8px;  
            width: 23%;  
            text-align: center;  
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);  
        }  

        .grid-item img {  
            width: 100%;  
            border-radius: 4px;  
            margin-bottom: 10px;  
        }  

        .grid-item h4 {  
            margin-bottom: 5px;  
            font-size: 18px;  
        }  

        .grid-item p {  
            margin-bottom: 10px;  
            color: #777;  
        }  

        .grid-item .price {  
            font-size: 20px;  
            color: #333;  
            font-weight: bold;  
        }  

        .grid-item button {  
            background-color: #e53935;  
            color: white;  
            padding: 10px;  
            border: none;  
            border-radius: 4px;  
            cursor: pointer;  
        }  

        .grid-item button:hover {  
            background-color: #d32f2f;  
        }  

        /* Cart section */  
        .cart {  
            width: 20%;  
            background-color: white;  
            padding: 20px;  
            border-radius: 8px;  
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);  
            margin-left: 20px;  
        }  

        .cart h3 {  
            text-align: center;  
        }  

        .cart-list {  
            list-style: none;  
            padding: 0;  
        }  

        .cart-list li {  
            margin-bottom: 10px;  
            background-color: #f4f4f4;  
            padding: 10px;  
            border-radius: 4px;  
        }  

        .total {  
            font-weight: bold;  
            margin-top: 20px;  
            font-size: 18px;  
            text-align: center;  
        }  

        /* Proceed to payment section */  
        .proceed-payment {  
            background-color: #6a1b9a;  
            color: white;  
            padding: 15px;  
            text-align: center;  
            margin-top: 20px;  
            border-radius: 5px;  
            cursor: pointer;  
        }  
    </style>  
    <script>  
        const paintings = {  
            'Lord Shiv Painting': 450,  
            'Blue Bird Painting': 600,  
            'Mountain Oil Painting': 450,  
            'Deer Painting': 399,  
            'Acrylic Painting Example': 500  
        };  

        const cartItems = [];  

        function filterPaintings(category) {  
            const allItems = document.querySelectorAll('.grid-item');  
            allItems.forEach(item => {  
                if (category === 'All' || item.dataset.category === category) {  
                    item.style.display = 'block';  
                } else {  
                    item.style.display = 'none';  
                }  
            });  
        }  

        function addToCart(painting) {  
            if (!cartItems.includes(painting)) {  
                cartItems.push(painting);  
                updateCart();  
            }  
        }  

        function updateCart() {  
            const cartList = document.getElementById('cartList');  
            const totalAmount = document.getElementById('totalAmount');  
            cartList.innerHTML = ''; // Clear current cart  
            let total = 0;  

            cartItems.forEach(item => {  
                const li = document.createElement('li');  
                li.textContent = ${item} - ₹ ${paintings[item]};  
                cartList.appendChild(li);  
                total += paintings[item];  
            });  

            totalAmount.textContent = Total: ₹ ${total};  
        }  
    </script>  
</head>  
<body>  


    <!-- Main container -->  
    <div class="container">  

        <!-- Sidebar -->  
        <div class="sidebar">  
            <h3>Categories</h3>  
            <ul>  
                <li class="active" onclick="filterPaintings('All')">All</li>  
                <li onclick="filterPaintings('Acrylic Painting')">Acrylic Painting</li>  
                <li onclick="filterPaintings('Animal')">Animal</li>  
                <li onclick="filterPaintings('God')">God</li>  
                <li onclick="filterPaintings('Oil Painting')">Oil Painting</li>  
                <li onclick="filterPaintings('Watercolor Painting')">Watercolor Painting</li>  
            </ul>  
        </div>  

        <!-- Main content -->  
        <div class="main-content">  
            <h3>Paintings</h3>  
            <div class="grid">  
                <!-- Painting 1 -->  
                <div class="grid-item" data-category="God">  
                    <img src="lord rishna.jpeg" alt="Lord Shiv Painting">  
                    <h4>Lord Krishna Paintings</h4>  
                    <p>Category: God</p>  
                    <p class="price">₹ 450</p>  
                    <button onclick="addToCart('Lord Shiv Painting')">Add To Cart</button>  
                </div>  

                <!-- Painting 2 -->  
                <div class="grid-item" data-category="Bird">  
                    <img src="bluebird.jpeg" alt="Blue Bird Painting">  
                    <h4>Blue Bird Painting</h4>  
                    <p>Category: Bird</p>  
                    <p class="price">₹ 600</p>  
                    <button onclick="addToCart('Blue Bird Painting')">Add To Cart</button>  
                </div>  

                <!-- Painting 3 -->  
                <div class="grid-item" data-category="Oil Painting">  
                    <img src="oil.jpeg" alt="Mountain Oil Painting">  
                    <h4>Mountain Oil Painting</h4>  
                    <p>Category: Oil Painting</p>  
                    <p class="price">₹ 450</p>  
                    <button onclick="addToCart('Mountain Oil Painting')">Add To Cart</button>  
                </div>  

                <!-- Painting 4 -->  
                <div class="grid-item" data-category="Animal">  
                    <img src="deer.jpeg" alt="Deer Painting">  
                    <h4>Deer Painting</h4>  
                    <p>Category: Animal</p>  
                    <p class="price">₹ 399</p>  
                    <button onclick="addToCart('Deer Painting')">Add To Cart</button>  
                </div>  

                <!-- Painting 5 (Acrylic Painting) -->  
                <div class="grid-item" data-category="Acrylic Painting">  
                    <img src="oil2.jpeg" alt="Acrylic Painting">  
                    <h4>Acrylic Painting Example</h4>  
                    <p>Category: Acrylic Painting</p>  
                    <p class="price">₹ 500</p>  
                    <button onclick="addToCart('Acrylic Painting Example')">Add To Cart</button>  
                </div>
                 <!-- Painting 2 -->  
                <div class="grid-item" data-category="Bird">  
                    <img src="god.jpeg" alt="Radha Krishna Painting">  
                    <h4>Radha Krishna Painting</h4>  
                    <p>Category: Bird</p>  
                    <p class="price">₹ 600</p>  
                    <button onclick="addToCart('Blue Bird Painting')">Add To Cart</button>  
                </div>
                 <div class="grid-item" data-category="Bird">  
                    <img src="animal3.jpeg" alt="Blue Bird ainting">  
                    <h4>Tree Painting</h4>  
                    <p>Category: Bird</p>  
                    <p class="price">₹ 600</p>  
                    <button onclick="addToCart('Blue Bird Painting')">Add To Cart</button>  
                </div>  
                
            </div>  
        </div>  

        <!-- Cart section -->  
        <div class="cart">  
            <form action="payment.jsp" method="get">  
                <h3>Cart</h3>  
                <ul id="cartList" class="cart-list">  
                    <!-- Cart items will be displayed here -->  
                </ul>  
                <div class="total" id="totalAmount">Total: ₹ 0</div>  
                <div class="proceed-payment">
         
                    <button type="submit">Proceed to Payment</button>
                </div>  
            </form> 
        </div> 

    </div>  

</body>  
</html>