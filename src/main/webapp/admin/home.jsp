<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Userdaoimpl" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="lk.ijse.koreanfoodjspproject.controller.UserLoginServlet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="head.jsp"%>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .dashboard-container {
            padding: 40px;
        }
        .card {
            transition: transform 0.3s ease;
            height: 400px;
            border-radius: 15px;
        }
        .card:hover {
            transform: scale(1.08);
        }
        .card-row {
            margin-top: 60px;
        }
        .card img {
            height: 180px;
            object-fit: cover;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .card i {
            font-size: 2.5rem;
            display: block;
            margin-bottom: 10px;
        }
        a{
            text-decoration: none;
            color: grey;
        }
        a:hover{
            text-decoration: none;
            color: grey;
        }
        h2 {
            font-family: "Arial", sans-serif;
            font-weight: bold;
        }
        h5{
            font-family: sans-serif;
        }
        p{
            font-family: "Comic Sans MS";
            color: royalblue;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>

<div class="container-fluid dashboard-container">
    <div class="row">
        <div class="col-12 mb-4">

           <h2 class="text-center text-primary">Hi !!! admin</h2>


        </div>
    </div>

    <div class="row g-4 card-row">
        <!-- Product Management -->
        <div class="col-lg-3 col-md-6">
            <a href="product.jsp">
            <div class="card text-center shadow">
                <img class="card-img-top" src="pictures/food-processing-foodie.gif" alt="Product Management">
                <div class="card-body">
                    <i class="bi bi-box-seam text-primary"></i>
                    <h5>Manage your Products</h5>
                    <p>안녕하세요 관리자님</p>
                </div>
            </div>
            </a>
        </div>

        <!-- Category Management -->
        <div class="col-lg-3 col-md-6">
            <a href="category.jsp">
            <div class="card text-center shadow">
                <img class="card-img-top" src="pictures/food-processing-foodie4.gif" alt="Category Management">
                <div class="card-body">
                    <i class="bi bi-list-ul text-success"></i>
                   <h5>Manage your categories</h5>
                    <p>안녕하세요 관리자님</p>
                </div>
            </div>
            </a>
        </div>

        <!-- Order Management -->
        <div class="col-lg-3 col-md-6">
            <a href="order.jsp">
            <div class="card text-center shadow">
                <img class="card-img-top" src="pictures/food-processing2-foodie.gif" alt="Order Management">
                <div class="card-body">
                    <i class="bi bi-cart-check text-warning"></i>
                    <h5>All Orders</h5>
                    <p>안녕하세요 관리자님</p>

                </div>
            </div>
            </a>
        </div>

        <!-- User Management -->
        <div class="col-lg-3 col-md-6">
            <a href="customers.jsp">
            <div class="card text-center shadow">
                <img class="card-img-top" src="pictures/shopping.gif" alt="User Management">
                <div class="card-body">
                    <i class="bi bi-people text-danger"></i>
                   <h5>Manage your customers</h5>
                    <p>안녕하세요 관리자님</p>
                </div>
            </div>
            </a>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>

<!-- Include Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
