<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Userdaoimpl" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.User" %>
<%@ include file="navbar.jsp" %>

<%
    Connection connection = null;

    javax.naming.Context ctx = new javax.naming.InitialContext();
    DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");

    connection = dataSource.getConnection();
    Userdaoimpl userdaoimpl = new Userdaoimpl();
    List<User> users = Userdaoimpl.getAllCustomers(connection);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Customers</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center mb-4">Manage Customers</h2>

    <!-- Add Customer Form -->
    <div class="card mb-4">
        <div class="card-header">Add New Customer</div>
        <div class="card-body">
            <form action="../addCustomer" method="post">
                <div class="row">
                    <div class="col-md-4">
                        <label for="customerName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="customerName" name="customerName" placeholder="Enter name" required>
                    </div>
                    <div class="col-md-4">
                        <label for="customerEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="customerEmail" name="customerEmail" placeholder="Enter email" required>
                    </div>
                    <div class="col-md-4">
                        <label for="customerPhone" class="form-label">Password</label>
                        <input type="text" class="form-control" id="customerPhone" name="customerPassword" placeholder="Enter your password" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary mt-3">Add Customer</button>
            </form>
        </div>
    </div>

    <!-- Customers Table -->
    <div class="card">
        <div class="card-header">Customers List</div>
        <div class="card-body">
            <table class="table table-bordered table-hover">
                <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (!users.isEmpty()) {
                        for (User user : users ) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td>
                        <a href="#"
                           class="btn btn-sm btn-warning"
                           onclick="openEditModal('<%= user.getId() %>','<%= user.getName() %>', '<%= user.getEmail() %>', '<%= user.getPassword()%>')">
                            Edit
                        </a>
                        <a href="#"
                           class="btn btn-sm btn-danger"
                           onclick="openDeleteModal('<%= user.getId() %>')">
                            Delete
                        </a>
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

    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit Customer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../updateCustomer" method="post">
                        <input type="hidden" id="editCustomerId" name="customerId">
                        <div class="mb-3">
                            <label for="editCustomerName" class="form-label">Name</label>
                            <input type="text" class="form-control" id="editCustomerName" name="ucustomerName" required>
                        </div>
                        <div class="mb-3">
                            <label for="editCustomerEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="editCustomerEmail" name="ucustomerEmail" required>
                        </div>
                        <div class="mb-3">
                            <label for="editCustomerPassword" class="form-label">Phone</label>
                            <input type="text" class="form-control" id="editCustomerPassword" name="editCustomerPassword" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this customer?
                    <form id="deleteCustomerForm" action="../deleteCustomer" method="post">
                        <input type="hidden" id="deleteCustomerId" name="customerId">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" form="deleteCustomerForm" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Include Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Open Edit Modal
    const editModal = new bootstrap.Modal(document.getElementById('editModal'));
    const editCustomerIdInput = document.getElementById('editCustomerId');
    const editCustomerNameInput = document.getElementById('editCustomerName');
    const editCustomerEmailInput = document.getElementById('editCustomerEmail');
    const editCustomerPhoneInput = document.getElementById('editCustomerPassword');

    function openEditModal(customerId, customerName, customerEmail, customerPhone) {
        editCustomerIdInput.value = customerId;
        editCustomerNameInput.value = customerName;
        editCustomerEmailInput.value = customerEmail;
        editCustomerPhoneInput.value = customerPhone;
        editModal.show();
    }

    // Open Delete Modal
    const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
    const deleteCustomerIdInput = document.getElementById('deleteCustomerId');

    function openDeleteModal(customerId) {
        deleteCustomerIdInput.value = customerId;
        deleteModal.show();
    }
</script>

</body>
</html>
