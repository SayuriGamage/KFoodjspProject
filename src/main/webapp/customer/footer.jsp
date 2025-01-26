<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer Example</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .footer {
            background-color: #343a40;
            color: white;
            padding: 40px 0;
        }
        .footer a {
            color: #f8c94d;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .social-icons a {
            color: white;
            margin: 0 10px;
            font-size: 1.2rem;
            transition: color 0.3s ease;
        }
        .social-icons a:hover {
            color: #f8c94d;
        }
    </style>
</head>
<body>
<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <!-- About Section -->
            <div class="col-md-4">
                <h5 class="text-uppercase mb-4">About Us</h5>
                <p>KFoods is dedicated to delivering authentic Korean cuisine directly to your door. Our commitment to quality and taste ensures every bite feels like home.</p>
            </div>
            <!-- Links Section -->
            <div class="col-md-4">
                <h5 class="text-uppercase mb-4">Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="../index.jsp">Home</a></li>
                    <li><a href="../login.jsp">Login</a></li>
                    <li><a href="../orders.jsp">Orders</a></li>
                    <li><a href="#contact">Contact Us</a></li>
                </ul>
            </div>
            <!-- Social Section -->
            <div class="col-md-4">
                <h5 class="text-uppercase mb-4">Follow Us</h5>
                <p>Connect with us on social media!</p>
                <div class="social-icons">
                    <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
                    <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
                    <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        <hr class="my-4" style="border-color: rgba(255, 255, 255, 0.2);">
        <div class="text-center">
            <p class="mb-0">&copy; 2025 KFoods. All Rights Reserved.</p>
        </div>
    </div>
</footer>

<!-- FontAwesome for Icons -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
