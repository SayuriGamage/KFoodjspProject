<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Orderdaoimpl" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>
<%
  Connection connection = null;
  List<Order> orders = null;

  try {
    javax.naming.Context ctx = new javax.naming.InitialContext();
    DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");
    connection = dataSource.getConnection();

    Orderdaoimpl orderdaoimpl = new Orderdaoimpl();
    String date = request.getParameter("date");
    if (date != null && !date.isEmpty()) {
      orders = orderdaoimpl.getAllOrders(connection, date);
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    if (connection != null) {
      try {
        connection.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order History</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .search-bar {
      margin: 20px 0;
    }
    .order-table {
      margin-top: 20px;
    }
    .card {
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      border-radius: 12px;
    }
  </style>
</head>
<body>
<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-lg-10">
      <div class="card">
        <div class="card-body">
          <h3 class="text-center mb-4">Order History</h3>

          <form class="search-bar" method="get">
            <div class="input-group">
              <input type="date" class="form-control" name="date" value="<%= request.getParameter("date") %>" placeholder="Search by Date" aria-label="Search by Date">
              <button class="btn btn-primary" type="submit">Search</button>
            </div>
          </form>

          <div class="order-table">
            <table class="table table-striped table-hover">
              <thead class="table-dark">
              <tr>
                <th>Order ID</th>
                <th>Order Date</th>
                <th>Total</th>
                <th>Customer Email</th>
              </tr>
              </thead>
              <tbody>
              <%
                if (orders != null && !orders.isEmpty()) {
                  for (Order order : orders) {
              %>
              <tr>
                <td><%= order.getOrder_id() %></td>
                <td><%= order.getOrderDate() %></td>
                <td><%= order.getTotal() %></td>
                <td><%= order.getCustomerEmail() %></td>
              </tr>
              <%
                }
              } else {
              %>
              <tr>
                <td colspan="4" class="text-center">No orders found for the selected date.</td>
              </tr>
              <%
                }
              %>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
