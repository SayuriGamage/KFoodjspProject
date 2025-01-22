<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .forgot-password {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">User Login</div>
        <div class="card-body">
            <form action="user-login" method="post">
                <div class="form-group mb-3">
                    <label for="loginEmail">Email Address</label>
                    <input type="email" id="loginEmail" class="form-control" name="loginEmail" placeholder="Enter email address" required="required">
                </div>
                <div class="form-group mb-3">
                    <label for="loginPassword">Password</label>
                    <input type="password" id="loginPassword" class="form-control" name="loginPassword" placeholder="********" required="required">
                </div>
                <div class="text-end mb-3">
                    <a href="forgot-password.jsp" class="forgot-password text-muted">Forgot Password?</a>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
