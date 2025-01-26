
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="includes/head.jsp"%>
    <style>

        .registration-form-container {
            max-width: 400px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
        }


        .registration-form-container .card {
            background: transparent;
            border: none;
        }


        .registration-form-container .card-header {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ffffff;
            text-transform: uppercase;
            background: rgba(0, 0, 0, 0.2);
            padding: 15px;
            border-radius: 8px;
        }


        .registration-form-container .form-control {
            border: 1px solid #ffffff;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            color: #333;
            padding: 10px;
        }

        .registration-form-container .form-control:focus {
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
            border-color: #007bff;
            outline: none;
        }


        .registration-form-container .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .registration-form-container .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .registration-form-container {
                max-width: 90%;
                padding: 20px;
            }
            .registration-form-container .card-header {
                font-size: 1.5rem;
            }
        }
    </style>

</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container registration-form-container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">Customer Registration</div>
        <div class="card-body">
            <form action="customer-registration" method="post">
                <div class="form-group mb-3">
                    <label for="name">Name</label>
                    <input type="text" id="name" class="form-control" name="name" placeholder="Enter your name" required="required">
                </div>
                <div class="form-group mb-3">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" class="form-control" name="email" placeholder="Enter email address" required="required">
                </div>
                <div class="form-group mb-3">
                    <label for="password">Password</label>
                    <input type="password" id="password" class="form-control" name="Password" placeholder="********" required="required">
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
            </form>
        </div>
    </div>
</div>


<%@include file="includes/footer.jsp"%>

</body>
</html>