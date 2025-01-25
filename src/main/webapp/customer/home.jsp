<%@ page import="java.sql.Connection" %>
<%@ page import="jakarta.annotation.Resource" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Productdaoimpl" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">

<%
    Connection connection = null;

    javax.naming.Context ctx = new javax.naming.InitialContext();
    DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");

    connection = dataSource.getConnection();
    Productdaoimpl productdaoimpl=new Productdaoimpl();
    List<Product> products=productdaoimpl.getAllProducts(connection);

     String userEmail = (String) session.getAttribute("loginEmail");
    if (userEmail == null) {
        System.out.println("user email is null");
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
<html>
<head>
    <%@include file="head.jsp"%>
    <style>
        body {
            background-color: #f8f9fa;
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
<%@include file="navbar.jsp"%>

<div class="container">
    <div class="card-header my-3">All products</div>
    <div class="row">
        <%
            if (!products.isEmpty()) {
                for (Product product : products) {
        %>
        <div class="col-md-3 my-3">
            <div class="card w-100" style="width: 18rem;">
                <img class="card-img-top" src="../product-images/<%=product.getImage()%>" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <h6 class="price">Price: $<%= product.getPrice() %></h6>
                    <h6 class="category">Category: <%= product.getCategory() %></h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a href="<%= request.getContextPath() %>/cart?pro_id=<%= product.getId() %>&u_email=<%= userEmail %>"
                           class="btn btn-primary">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@include file="footer.jsp"%>
</body>
</html>
