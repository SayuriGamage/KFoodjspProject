<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="includes/head.jsp"%>
    <title>Place Order</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container py-5">
    <h1 class="text-center mb-4">Place Your Order</h1>

    <div class="row">
        <!-- Order Summary Section -->
        <div class="col-lg-6">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h4 class="card-title mb-3">Order Summary</h4>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Product 001 <span>kimchi</span><span>2</span> <span>$50</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Product 2 <span>$30</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Shipping <span>Free</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <strong>Total</strong> <strong>$80</strong>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- User Details and Payment Section -->
        <div class="col-lg-6">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h4 class="card-title mb-3">Shipping Details</h4>
                    <form action="" method="post">
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" id="fullName" name="fullName" class="form-control" placeholder="John Doe" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="johndoe@example.com" required>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <textarea id="address" name="address" class="form-control" rows="3" placeholder="123 Street Name, City, Country" required></textarea>
                        </div>

                        <h4 class="card-title mt-4 mb-3">Payment Method</h4>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="Credit Card" required>
                            <label class="form-check-label" for="creditCard">
                                Credit/Debit Card
                            </label>
                        </div>
                        <div class="form-check mb-4">
                            <input class="form-check-input" type="radio" name="paymentMethod" id="cod" value="Cash on Delivery" required>
                            <label class="form-check-label" for="cod">
                                Cash on Delivery
                            </label>
                        </div>

                        <button type="submit" class="btn btn-primary btn-lg w-100">Place Order</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
