<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Cartdaoimpl" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%

    Connection connection = null;

    javax.naming.Context ctx = new javax.naming.InitialContext();
    DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");

    connection = dataSource.getConnection();
    String userEmail = (String) session.getAttribute("loginEmail");
    Cartdaoimpl cartdao = new Cartdaoimpl();
    List<Cart> carts = cartdao.loadCartTable(connection,userEmail);

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="includes/head.jsp"%>
    <title>Place Order</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/monthSelect/style.css">
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container py-5">
    <h1 class="text-center mb-4">Place Your Order</h1>

    <div class="row">
        <!-- Order Summary Table Section -->
        <div class="col-lg-12">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h4 class="card-title mb-3">Order Summary</h4>
                    <table class="table table-hover align-middle">
                        <thead class="table-dark">
                        <tr>
                            <th>Image</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Total Price</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if(carts != null && carts.size() > 0){
                                for(Cart cart : carts){

                        %>
                        <tr>
                            <td><img src="product-images/<%=cart.getImage()%>" alt="Kimchi" class="rounded" width="70"></td>
                            <td><%=cart.getPro_name()%></td>
                            <td><%=cart.getPro_category()%></td>
                            <td><%=cart.getPro_price()%></td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="decrementQty(this)">
                                        <i class="bi bi-dash-circle"></i>
                                      </button>
                                    <input type="text" class="form-control qty-input text-center mx-2" style="width: 60px;" value="1" readonly>
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="incrementQty(this)">
                                        <i class="bi bi-plus-circle"></i>
                                    </button>
                                </div>
                            </td>
                            <td><%=cart.getPro_price()%></td>
                            <td>
                                <button type="button" class="btn btn-sm btn-danger">
                                    <i class="bi bi-trash"></i> Remove
                                </button>
                            </td>
                        </tr>
                        <%
                            }
                            }
                        %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- User Details -->
        <div class="col-lg-6 mt-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h4 class="card-title mb-3">Shipping Details</h4>
                    <form action="" method="post">
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" id="fullName" name="fullName" class="form-control" placeholder="John Doe" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" id="email" name="orderEmail" class="form-control" placeholder="johndoe@example.com" required>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <textarea id="address" name="address" class="form-control" rows="3" placeholder="123 Street Name, City, Country" required></textarea>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Payment Details -->
        <div class="col-lg-6 mt-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h4 class="card-title mb-3">Payment Details</h4>
                    <form action="saveOrder" method="post">
                        <div class="mb-3">
                            <label for="totalPayment" class="form-label">Total Payment</label>
                            <input type="text" id="totalPayment" name="totalPayment" class="form-control" readonly>
                        </div>


                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="expiryDate" class="form-label">Expiration Date</label>
                                <input type="date" id="expiryDate" name="expiryDate" class="form-control" placeholder="Select expiration date" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="cvv" class="form-label">Card No</label>
                                <input type="text" id="cvv" name="cardName" class="form-control" placeholder="*************" maxlength="12"  required>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success btn-lg w-100 mt-3">Place Order</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    </div>


<%@include file="includes/footer.jsp"%>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/monthSelect/monthSelect.js"></script>



<script>


    function incrementQty(button) {
        var qtyInput = button.closest('div').querySelector('.qty-input');
        var qty = parseInt(qtyInput.value);
        qtyInput.value = qty + 1;
        updateTotalPrice(button);
        updateFinalTotalPrice();
    }


    function decrementQty(button) {
        var qtyInput = button.closest('div').querySelector('.qty-input');
        var qty = parseInt(qtyInput.value);
        if (qty > 1) {
            qtyInput.value = qty - 1;
        }
        updateTotalPrice(button);
        updateFinalTotalPrice();
    }



    function updateTotalPrice(button) {
        var row = button.closest('tr');
        var price = parseFloat(row.cells[3].innerText.replace('$', ''));
        var qty = parseInt(row.querySelector('.qty-input').value);
        var totalPrice = price * qty;
        row.cells[5].innerText = '$' + totalPrice.toFixed(2);
    }

    function updateFinalTotalPrice() {
        var rows = document.querySelectorAll('table tbody tr');
        var finalTotal = 0;

        rows.forEach(function(row) {
            var totalPriceCell = row.cells[5].innerText.replace('$', '');
            finalTotal += parseFloat(totalPriceCell);
        });


        document.getElementById('totalPayment').value = '$' + finalTotal.toFixed(2);
    }


    window.onload = updateFinalTotalPrice;


</script>

</body>
</html>
