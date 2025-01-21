<%--
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

<%@include file="footer.jsp"%>

</body>
</html>--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="jakarta.annotation.Resource" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Productdaoimpl" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    Connection connection = null;

    javax.naming.Context ctx = new javax.naming.InitialContext();
    DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");

    connection = dataSource.getConnection();
    Productdaoimpl productdaoimpl=new Productdaoimpl();
    List<Product> products=productdaoimpl.getAllProducts(connection);
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>


<div  class="container">
    <div class="card-header my-3">All products</div>
    <div class="row">

        <%
            if(!products.isEmpty()){
                for(Product product : products) {%>

        <div class="col-md-3 my-3">
            <div class="card w-100" style="width: 18rem;">
                <img class="card-img-top" src="../product-images/<%=product.getImage()%>" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName()%></h5>
                    <h6 class="price">Price: $<%=product.getPrice()%></h6>
                    <h6 class="category">Category: <%=product.getCategory()%></h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a href="#" class="btn btn-primary">Add to Cart</a>
                        <a href="#" class="btn btn-primary">Buy Now</a>
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


<%@include file="footer.jsp"%>

</body>
</html>
