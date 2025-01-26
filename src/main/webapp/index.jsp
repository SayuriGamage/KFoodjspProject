

<%@ page import="java.sql.Connection" %>
<%@ page import="jakarta.annotation.Resource" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Categorydaoimpl" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Category" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Product" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Productdaoimpl" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
   Connection connection = null;
   javax.naming.Context ctx = new javax.naming.InitialContext();
   DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");
   connection = dataSource.getConnection();
   Categorydaoimpl categorydaoimpl = new Categorydaoimpl();
   List<Category> categories = categorydaoimpl.getAllCategories(connection);
   connection = dataSource.getConnection();
   Productdaoimpl productdaoimpl = new Productdaoimpl();
   List<Product> products = productdaoimpl.getAllProducts(connection);
%>
<!DOCTYPE html>
<html lang="en">
<head>
   <%@include file="includes/head.jsp"%>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
   <style>
      /* General body styling */
      body {
         background-color: #f8f9fa;
         font-family: 'Arial', sans-serif;
         margin: 0;
         padding: 0;
      }

      /* Hero Section Styling */
      .hero-section {
         background: url('product-images/fullhd.gif') no-repeat center center/cover;
         height: 60vh;
         display: flex;
         align-items: center;
         justify-content: center;
         color: #ffffff;
         text-shadow: 0 2px 4px rgba(0, 0, 0, 0.8);
         position: relative;
         overflow: hidden;
      }

      .hero-title {
         font-size: 3rem;
         font-weight: bold;
         margin: 0;
         animation: slideInFromLeft 1.5s ease-out;
      }

      .lead {
         font-size: 1.2rem;
         font-weight: 400;
         animation: fadeIn 2s ease-in-out;
      }

      /* About Section Styling */
      .about-section {
         background-color: #ffffff;
         padding: 50px;
         border-radius: 12px;
         box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
         margin-top: 30px;
         transition: transform 0.3s ease, box-shadow 0.3s ease;
      }

      .about-section:hover {
         transform: translateY(-10px);
         box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
      }

      .about-section img {
         display: block;
         margin: 20px auto;
         max-width: 100%;
         border-radius: 8px;
         box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }


      .navbar a {
         color: #ffffff !important;
         font-weight: 500;
      }

      .navbar a:hover {
         text-decoration: underline;
      }


      /* Animations */
      @keyframes slideInFromLeft {
         from {
            transform: translateX(-100%);
            opacity: 0;
         }
         to {
            transform: translateX(0);
            opacity: 1;
         }
      }

      @keyframes fadeIn {
         from {
            opacity: 0;
         }
         to {
            opacity: 1;
         }
      }

      .category-bar a {
         padding: 10px 25px;
         text-decoration: none;
         font-weight: 600;
         font-size: 14px;
         border-radius: 25px;
         color: #5a5a5a;
         background: linear-gradient(145deg, #ffffff, #f0f4f8);
         box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1), -2px -2px 5px rgba(255, 255, 255, 0.9);
         transition: all 0.3s ease-in-out;
      }


      .card {
         border: none;
         border-radius: 12px;
         background-color: #ffffff;
         box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
         transition: transform 0.3s ease, box-shadow 0.3s ease;
         overflow: hidden;
      }

      .card:hover {
         transform: translateY(-10px);
         box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
      }

      .card img {
         object-fit: cover;
         width: 100%;
         height: 180px;
      }

      .card-body {
         padding: 15px;
         display: flex;
         flex-direction: column;
         align-items: center;
      }

      .product-info h5 {
         font-size: 18px;
         font-weight: bold;
         color: #333;
         margin: 10px 0;
      }

      .price {
         color: #28a745;
         font-size: 16px;
         font-weight: 600;
      }

      .category {
         font-size: 14px;
         color: #888;
         margin-bottom: 15px;
      }


   </style>

</head>
<body>
<%@include file="includes/navbar.jsp"%>



<div class="hero-section">
   <div class="text-center">
      <h1 class="hero-title">Welcome to Korean Food</h1>
      <p class="lead">Explore the richness of authentic Korean cuisine!</p>
   </div>
</div>

<div class="container my-5">
   <div class="about-section">
      <h2 class="text-center mb-4">About KFoods</h2>
      <p>
         At Korean Food, we are passionate about bringing the authentic taste of Korea to your table. Our journey began with a love for the rich culinary traditions of Korea and a commitment to share them with the world.
         We source the finest ingredients and prepare each dish with care to ensure an exceptional dining experience for our customers.
      </p>
     <img src="product-images/ex1.jpg">

   </div>

   <hr>
   <div class="row">
      <% if (!products.isEmpty()) { %>
      <% for (Product product : products) { %>
      <div class="col-md-3 my-3">
         <div class="card h-100">
            <img class="card-img-top" src="product-images/<%= product.getImage() %>" alt="<%= product.getName() %>">
            <div class="card-body product-info">
               <h5 class="card-title"><%= product.getName() %></h5>
               <p class="price">Price: $<%= product.getPrice() %></p>
               <p class="category">Category: <%= product.getCategory() %></p>
               <div class="d-flex justify-content-between">
                  <a href="registration.jsp"
                     class="btn btn-dark">Add to Cart</a>
               </div>
            </div>
         </div>
      </div>
      <% }
      }
      %>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

   <%@include file="includes/footer.jsp"%>
</body>
</html>

