
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="includes/head.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">Customer Registration</div>
        <div class="card-body">
            <form action="customer-registration" method="post">
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" name="name" placeholder="Enter your name" required="required">
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" class="form-control" name="email" placeholder="Enter email address" required="required">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="Password" placeholder="********" required="required">
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