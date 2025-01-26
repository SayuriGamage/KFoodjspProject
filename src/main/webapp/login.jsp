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
        .login-form-container {
            max-width: 400px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
        }


        .login-form-container .card {
            background: transparent;
            border: none;
        }


        .login-form-container .card-header {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ffffff;
            text-transform: uppercase;
            background: rgba(0, 0, 0, 0.2);
            padding: 15px;
            border-radius: 8px;
        }

        .login-form-container .form-control {
            border: 1px solid #ffffff;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            color: #333;
            padding: 10px;
        }

        .login-form-container .form-control:focus {
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
            border-color: #007bff;
            outline: none;
        }


        .login-form-container .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .login-form-container .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }


        .login-form-container .forgot-password {
            font-size: 0.9rem;
            color: #ffffff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .login-form-container .forgot-password:hover {
            color: #f8d7da;
        }


        @media (max-width: 768px) {
            .login-form-container {
                max-width: 90%;
                padding: 20px;
            }
            .login-form-container .card-header {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container login-form-container">
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
