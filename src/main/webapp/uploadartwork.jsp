<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart - Tribal Handicrafts Platform</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 1em;
            text-align: center;
            position: relative;
        }

        header h1 {
            margin: 0;
            font-size: 1.8em;
        }

        .proceed-button {
            font-size: 1.5em;
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 1em;
        }

        main {
            padding: 1em;
        }

        .cart-list {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 1em;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.5em 0;
            border-bottom: 1px solid #ddd;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .cart-item img {
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
        }

        .quantity-controls button {
            margin: 0 5px;
            padding: 5px;
            cursor: pointer;
        }

        .save-for-next {
            background-color: #f0ad4e;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
        }

        #total-quantity, #total-amount {
            font-size: 1.5em;
            text-align: center;
            margin-top: 1em;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 1em;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Your Cart</h1>
        <button class="proceed-button" onclick="redirectToPayment()">Proceed to Buy</button>
    </header>
    <main>
        <div class="cart-list" id="cart-list">
            <!-- Cart items will be dynamically added here -->
        </div>
        <div id="total-quantity"></div>
        <div id="total-amount"></div>
    </main>

    <script>
        // Function to display cart items and total quantity
        function displayCart() {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            let cartList = document.getElementById('cart-list');
            cartList.innerHTML = '';
            let totalAmount = 0;
            let totalQuantity = 0;

            cart.forEach(item => {
                let cartItem = document.createElement('div');
                cartItem.className = 'cart-item';
                cartItem.innerHTML = `
                    <img src="${item.image}" alt="${item.name}">
                    <span>${item.name}</span>
                    <div class="quantity-controls">
                        <button onclick="updateQuantity('${item.name}', -1)">-</button>
                        <span>${item.quantity}</span>
                        <button onclick="updateQuantity('${item.name}', 1)">+</button>
                        x $${item.price.toFixed(2)}
                    </div>
                    <button class="save-for-next" onclick="saveForNext('${item.name}')">Save for Later</button>
                `;
                cartList.appendChild(cartItem);

                // Calculate total amount and quantity
                totalAmount += item.price * item.quantity;
                totalQuantity += item.quantity;
            });

            // Display total quantity and total amount
            document.getElementById('total-quantity').innerText = Total Items: ${totalQuantity};
            document.getElementById('total-amount').innerText = Total Amount: $${totalAmount.toFixed(2)};
        }

        // Function to update item quantity
        function updateQuantity(itemName, change) {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            cart = cart.map(item => {
                if (item.name === itemName) {
                    item.quantity = Math.max(1, item.quantity + change); // Ensure quantity stays above 1
                }
                return item;
            });
            localStorage.setItem('cart', JSON.stringify(cart));
            displayCart();  // Re-render cart
        }

        // Function to save item for later
        function saveForNext(itemName) {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            const savedItems = JSON.parse(localStorage.getItem('savedItems')) || [];

            // Find and remove item from cart
            cart = cart.filter(item => {
                if (item.name === itemName) {
                    savedItems.push(item); // Save for later
                    return false;
                }
                return true;
            });

            // Update localStorage with updated cart and saved items
            localStorage.setItem('cart', JSON.stringify(cart));
            localStorage.setItem('savedItems', JSON.stringify(savedItems));

            displayCart();  // Re-render cart
        }

        // Function to redirect to payment page with total amount
        function redirectToPayment() {
            if (JSON.parse(localStorage.getItem('cart')).length > 0) {
                window.location.href = 'payment.html';
            } else {
                alert("Your cart is empty! Add items to the cart before proceeding.");
            }
        }

        // Display the cart when the page loads
        displayCart();
    </script>
</body>
</html>