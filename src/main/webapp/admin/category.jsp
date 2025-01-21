<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="lk.ijse.koreanfoodjspproject.dao.impl.Categorydaoimpl" %>
<%@ page import="lk.ijse.koreanfoodjspproject.entity.Category" %>
<%@ include file="navbar.jsp" %>

<%
    Connection connection = null;

    javax.naming.Context ctx = new javax.naming.InitialContext();
    DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");

    connection = dataSource.getConnection();
    Categorydaoimpl categorydaoimpl = new Categorydaoimpl();
    List<Category> categories = categorydaoimpl.getAllCategories(connection);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Categories</title>
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
    <h2 class="text-center mb-4">Manage Categories</h2>

    <!-- Add Category Form -->
    <div class="card mb-4">
        <div class="card-header">Add New Category</div>
        <div class="card-body">
            <form action="../addCategory" method="post">
                <div class="mb-3">
                    <label for="categoryName" class="form-label">Category Name</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName" placeholder="Enter category name" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Category</button>
            </form>
        </div>
    </div>

    <!-- Categories Table -->
    <div class="card">
        <div class="card-header">Categories List</div>
        <div class="card-body">
            <table class="table table-bordered table-hover">
                <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (!categories.isEmpty()) {
                        for (Category category : categories) {
                %>
                <tr>
                    <td><%= category.getId() %></td>
                    <td><%= category.getName() %></td>
                    <td>
                        <a href="#"
                           class="btn btn-sm btn-warning"
                           onclick="openEditModal('<%= category.getId() %>', '<%= category.getName() %>')">
                            Edit
                        </a>
                        <a href="#"
                           class="btn btn-sm btn-danger"
                           onclick="openDeleteModal('<%= category.getId() %>')">
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
                    <h5 class="modal-title" id="editModalLabel">Edit Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../updateCategory" method="post">
                        <input type="hidden" id="editCategoryId" name="categoryId">
                        <div class="mb-3">
                            <label for="editCategoryName" class="form-label">Category Name</label>
                            <input type="text" class="form-control" id="editCategoryName" name="categoryName" required>
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
                    Are you sure you want to delete this category?
                    <form id="deleteCategoryForm" action="../deleteCategory" method="post">
                        <input type="hidden" id="deleteCategoryId" name="Id">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" form="deleteCategoryForm" class="btn btn-danger">Delete</button>
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
    const editCategoryIdInput = document.getElementById('editCategoryId');
    const editCategoryNameInput = document.getElementById('editCategoryName');

    function openEditModal(categoryId, categoryName) {
        editCategoryIdInput.value = categoryId;
        editCategoryNameInput.value = categoryName;
        editModal.show();
    }

    // Open Delete Modal
    const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
    const deleteCategoryIdInput = document.getElementById('deleteCategoryId');

    function openDeleteModal(categoryId) {
        deleteCategoryIdInput.value = categoryId;
        deleteModal.show();
    }
</script>

</body>
</html>
