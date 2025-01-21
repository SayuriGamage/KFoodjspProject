<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Productdaoimpl" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Product" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Categorydaoimpl" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Category" %>
<%@ include file="navbar.jsp" %>

<%
    Connection connection = null;

    javax.naming.Context ctx = new javax.naming.InitialContext();
    DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");

    connection = dataSource.getConnection();
    Productdaoimpl productdaoimpl=new Productdaoimpl();
    List<Product> products=productdaoimpl.getAllProducts(connection);
%>
<%
    Categorydaoimpl categorydaoimpl=new Categorydaoimpl();
    List<Category> categories=categorydaoimpl.getAllCategories(connection);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Products</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 20px;
        }
        .table img {
            width: 50px;
            height: 50px;
            object-fit: cover;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center mb-4">Manage Products</h2>

    <!-- Add Product Form -->
    <div class="card mb-4">
        <div class="card-header">Add New Product</div>
        <div class="card-body">
            <form action="../product" method="post" >
                <div class="row">
                    <div class="col-md-3">
                        <label for="name" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="col-md-3">
                        <label for="category" class="form-label">Category</label>
                        <select class="form-control" id="category" name="category" required>
                            <option value="" disabled selected>Select a Category</option>

                            <%
                                if(!categories.isEmpty()){
                                    for(Category category : categories) {
                            %>
                            <option value="<%= category.getName()%>"><%=category.getName()%></option>
                            <% }
                            }
                            %>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="price" class="form-label">Price</label>
                        <input type="number" step="0.01" class="form-control" id="price" name="price" required>
                    </div>
                    <div class="col-md-3">
                        <label for="image" class="form-label">Choose Image</label>
                        <input type="file" class="form-control" id="image" name="images" accept="image/*" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary mt-3">Add Product</button>
            </form>
        </div>
    </div>

    <!-- Products Table -->
    <div class="card">
        <div class="card-header">Products List</div>
        <div class="card-body">
            <table class="table table-bordered table-hover">
                <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if(!products.isEmpty()){
                        for(Product product : products) {%>
                <tr>
                    <td><%= product.getId() %></td>
                    <td><img src="../product-images/<%= product.getImage() %>" alt="Product Image"></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getCategory() %></td>
                    <td>$<%= product.getPrice() %></td>
                    <td>
                        <a href="#"
                           class="btn btn-sm btn-warning"
                           onclick="openEditModal('<%= product.getId() %>', '<%= product.getName() %>', '<%= product.getCategory() %>', '<%= product.getPrice() %>')">
                            Edit
                        </a>

                        <a href="#"
                           class="btn btn-sm btn-danger"
                           onclick="openDeleteModal('<%= product.getId() %>')">
                            Delete
                        </a>

                    </td>
                </tr>
                <% }
                }
                %>
                </tbody>
            </table>
        </div>
        <%-- model--%>
        <!-- Modal Template -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form  action="../updateProduct" method="post">
                            <input type="hidden" id="productId" name="uid">
                            <div class="mb-3">
                                <label for="productName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="productName" name="uname" required>
                            </div>
                            <div class="mb-3">
                                <label for="productCategory" class="form-label">Category</label>
                                <select class="form-control" id="productCategory" name="ucategory" required>
                                    <option value="" disabled>Select a Category</option>
                                    <% for (Category category : categories) { %>
                                    <option value="<%= category.getName() %>"><%= category.getName() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="productPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" id="productPrice" name="uprice" step="0.01" required>
                            </div>
                            <div class="mb-3">
                                <label for="productImage" class="form-label">Product Image</label>
                                <input type="file" class="form-control" id="productImage" name="uimage" accept="image/*">
                                <small>Leave blank to keep the current image.</small>
                            </div>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <%--model end--%>

        <!-- Delete Modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete this product?
                        <form id="deleteProductForm" action="../deleteProduct" method="post">
                            <input type="hidden" id="deleteProductId" name="did">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" form="deleteProductForm" class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </div>
        </div>

    <%--delete model end--%>
    </div>
</div>

<!-- Include Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Get references to modal and form elements
    const editModal = new bootstrap.Modal(document.getElementById('editModal'));
    const productIdInput = document.getElementById('productId');
    const productNameInput = document.getElementById('productName');
    const productCategoryInput = document.getElementById('productCategory');
    const productPriceInput = document.getElementById('productPrice');
    const editProductForm = document.getElementById('editProductForm');

    // Function to handle Edit button click
    function openEditModal(productId, productName, productCategory, productPrice) {
        // Populate modal fields with product details
        productIdInput.value = productId;
        productNameInput.value = productName;
        productCategoryInput.value = productCategory;
        productPriceInput.value = productPrice;

        // Show the modal
        editModal.show();
    }
</script>
<script>
    // Reference the Delete Modal
    const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
    const deleteProductIdInput = document.getElementById('deleteProductId');

    // Function to open the Delete Modal
    function openDeleteModal(productId) {
        deleteProductIdInput.value = productId; // Set product ID in hidden input
        deleteModal.show(); // Show the modal
    }
</script>


</body>
</html>
