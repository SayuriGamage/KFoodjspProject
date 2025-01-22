<%@ page import="java.sql.Connection" %>
<%@ page import="jakarta.annotation.Resource" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Productdaoimpl" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Product" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Category" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Categorydaoimpl" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
   Connection connection = null;
   javax.naming.Context ctx = new javax.naming.InitialContext();
   DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");
   connection = dataSource.getConnection();
   Productdaoimpl productdaoimpl = new Productdaoimpl();
   List<Product> products = productdaoimpl.getAllProducts(connection);

   connection = dataSource.getConnection();
   Categorydaoimpl categorydaoimpl = new Categorydaoimpl();
   List<Category> categories = categorydaoimpl.getAllCategories(connection);
%>
<!DOCTYPE html>
<html lang="en">
<head>
   <%@include file="includes/head.jsp"%>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
   <style>
      body {
         background-color: #f8f9fa;
      }
      .hero-section {
         background: url('product-images/ch2.jpg') no-repeat center center/cover;
         height: 50vh;
         display: flex;
         align-items: center;
         justify-content: center;
         color: #ffffff;
         text-shadow: 0px 2px 4px rgba(0, 0, 0, 0.8);
      }
      .hero-title {
         font-size: 3rem;
         font-weight: bold;
      }
      .card {
         border: none;
         background-color: #ffffff;
         box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
         transition: transform 0.2s;
      }
      .card:hover {
         transform: translateY(-5px);
      }

   </style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="hero-section">
   <div class="text-center">
      <h1 class="hero-title">Welcome to Korean Food</h1>
      <p class="lead">Explore our delicious products!</p>
   </div>
</div>

<div class="container my-5">
   <div class="d-flex justify-content-between align-items-center mb-4">
      <%
      for(Category category : categories) {
      %>
      <h6><%=category.getName()%></h6>

      <%
         }
      %>
      <form class="d-flex" method="get" action="search.jsp">
         <input class="form-control me-2" type="search" name="query" placeholder="Search products..." aria-label="Search">
         <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
   </div>

   <div class="row">
      <% if (!products.isEmpty()) { %>
      <% for (Product product : products) { %>
      <div class="col-md-3 my-3">
         <div class="card h-100">
            <img class="card-img-top" src="product-images/<%= product.getImage() %>" alt="<%= product.getName() %>">
            <div class="card-body">
               <h5 class="card-title"><%= product.getName() %></h5>
               <p class="card-text">Price: $<%= product.getPrice() %></p>
               <p class="card-text">Category: <%= product.getCategory() %></p>
            </div>
            <div class="card-footer d-flex justify-content-between">
               <a href="cart.jsp"><img src="icons/cart1.png" width="25px" height="25px"></a>
               <a href="orders.jsp"><img src="icons/but1.png" width="25px" height="25px"></a>
            </div>
         </div>
      </div>
      <% } %>
      <% } else { %>
      <div class="col-12 text-center">
         <p class="text-muted">No products available.</p>
      </div>
      <% } %>
   </div>
</div>

<%@include file="includes/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>


</body>
</html>
