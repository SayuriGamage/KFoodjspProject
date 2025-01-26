
<%@ page import="java.sql.Connection" %>
<%@ page import="jakarta.annotation.Resource" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Productdaoimpl" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Product" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Categorydaoimpl" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Category" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">

<%
    Connection connection = null;
    javax.naming.Context ctx = new javax.naming.InitialContext();
    DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");
    connection = dataSource.getConnection();
    Productdaoimpl productdaoimpl = new Productdaoimpl();
    List<Product> products = productdaoimpl.getAllProducts(connection);

    Categorydaoimpl categorydaoimpl = new Categorydaoimpl();
    List<Category> categories = categorydaoimpl.getAllCategories(connection);

    String selectedCategory = request.getParameter("category");
    String searchQuery = request.getParameter("search");

    if (selectedCategory != null && !selectedCategory.isEmpty()) {
        products = productdaoimpl.getProductsByCategory(connection, selectedCategory);
    }

    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
        products = products.stream()
                .filter(product -> product.getName().toLowerCase().contains(searchQuery.toLowerCase()))
                .collect(Collectors.toList());
    }

    String userEmail = (String) session.getAttribute("loginEmail");
    if (userEmail == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<%
    String addCartMessage = (String) session.getAttribute("addCartMessage");
    if (addCartMessage != null) {
        session.removeAttribute("addCartMessage");
%>
<script>
    Swal.fire({
        icon: '<%= addCartMessage.contains("successfully") ? "success" : "error" %>',
        title: '<%= addCartMessage %>',
        timer: 1500,
        showConfirmButton: false
    });
</script>
<%
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="head.jsp" %>
    <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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

        .category-bar a:hover, .category-bar a.active {
            background: linear-gradient(145deg, #007bff, #0056b3);
            color: #ffffff;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
            transform: scale(1.05);
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

        .btn-primary {
            padding: 8px 20px;
            font-size: 14px;
            border-radius: 8px;
            background: linear-gradient(145deg, #007bff, #0056b3);
            color: #ffffff;
            text-transform: uppercase;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            background: linear-gradient(145deg, #0056b3, #003a7a);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25);
        }

        .search-bar {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            padding: 15px;
            margin-bottom: 30px;
        }

        .search-bar .form-control,
        .search-bar .form-select {
            border: none;
            border-radius: 25px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1), -2px -2px 5px rgba(255, 255, 255, 0.9);
            transition: box-shadow 0.3s ease-in-out;
        }

        .search-bar .form-control:focus,
        .search-bar .form-select:focus {
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
            outline: none;
        }

        .search-bar .btn-primary {
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            border-radius: 25px;
            background: linear-gradient(145deg, #007bff, #0056b3);
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease-in-out;
        }

        .search-bar .btn-primary:hover {
            background: linear-gradient(145deg, #0056b3, #003a7a);
            box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.25);
            transform: scale(1.05);
        }

    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container mt-4">
    <!-- Search Bar -->
    <form method="get" class="search-bar">
        <div class="row">
            <div class="col-md-6">
                <input type="text" name="search" class="form-control" placeholder="Search products by name..."
                       value="<%= searchQuery != null ? searchQuery : "" %>">
            </div>
            <div class="col-md-4">
                <select name="category" class="form-select">
                    <option value="">All Categories</option>
                    <% for (Category category : categories) { %>
                    <option value="<%= category.getName() %>"
                            <%= category.getName().equals(selectedCategory) ? "selected" : "" %>>
                        <%= category.getName() %>
                    </option>
                    <% } %>
                </select>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">Search</button>
            </div>
        </div>
    </form>


    <!-- Product Cards -->
    <div class="row">
        <% if (!products.isEmpty()) { %>
        <% for (Product product : products) { %>
        <div class="col-md-3 my-3">
            <div class="card h-100">
                <img class="card-img-top" src="../product-images/<%= product.getImage() %>" alt="<%= product.getName() %>">
                <div class="card-body product-info">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <p class="price">Price: $<%= product.getPrice() %></p>
                    <p class="category">Category: <%= product.getCategory() %></p>
                    <div class="d-flex justify-content-between">
                        <a href="<%= request.getContextPath() %>/cart?pro_id=<%= product.getId() %>&u_email=<%= userEmail %>"
                           class="btn btn-primary">Add to Cart</a>
                    </div>
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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@ include file="footer.jsp" %>
</body>
</html>
