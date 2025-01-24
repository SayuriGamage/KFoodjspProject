<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="includes/head.jsp"%>
    <title>Shopping Cart</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .cart-table th, .cart-table td {
            vertical-align: middle;
        }
        .summary-card {
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container py-5">
    <h1 class="text-center mb-4">Your Cart (4 items)</h1>
    <div class="row">
        <!-- Cart Items -->
        <div class="col-lg-8">
            <table class="table cart-table table-bordered">
                <thead class="table-light">
                <tr>
                    <th>ProductId</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td> <div class="input-group">
                        <button class="btn btn-outline-secondary btn-sm decrement-btn" type="button">-</button>
                        <input type="number" class="form-control form-control-sm text-center quantity-input" value="1" min="1">
                        <button class="btn btn-outline-secondary btn-sm increment-btn" type="button">+</button>
                    </div>
                    </td>
                    <td>
                        <button class="btn btn-danger btn-sm">Remove</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- Cart Summary -->
        <div class="col-lg-4">
            <div class="summary-card">
                <h4>Cart Summary</h4>
                <hr>
                <p>Subtotal: <strong></strong></p>
                <hr>
                <h5>Grand Total: <strong></strong></h5>
                <button class="btn btn-primary btn-lg w-100 mt-3">Purchase</button>
            </div>
        </div>
    </div>2
</div>

<%@include file="includes/footer.jsp"%>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Add event listeners to the buttons
    document.querySelectorAll('.increment-btn').forEach(function (button) {
        button.addEventListener('click', function () {
            let input = this.parentElement.querySelector('.quantity-input');
            let currentValue = parseInt(input.value);
            input.value = currentValue + 1; // Increment the value
        });
    });

    document.querySelectorAll('.decrement-btn').forEach(function (button) {
        button.addEventListener('click', function () {
            let input = this.parentElement.querySelector('.quantity-input');
            let currentValue = parseInt(input.value);
            if (currentValue > parseInt(input.min)) {
                input.value = currentValue - 1; // Decrement the value, ensuring it doesn't go below the minimum
            }
        });
    });
</script>
</body>
</html>
