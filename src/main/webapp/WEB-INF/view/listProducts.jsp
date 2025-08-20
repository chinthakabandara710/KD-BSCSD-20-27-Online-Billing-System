<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>List Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
          background: linear-gradient(135deg, #e3f2fd, #ffffff);
          color: #2c3e50;
          min-height: 100vh;
        }
        .card {
          background: linear-gradient(145deg, #ffffff, #f8f9fa);
          border: 1px solid #dee2e6;
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.08);
          border-radius: 1rem;
          margin-top: 40px;
          padding: 2rem 1.5rem;
        }
        .table {
          background: white;
          border-radius: 0.7rem;
          overflow: hidden;
          margin-bottom: 0;
        }
        .thead-dark th {
          background: linear-gradient(90deg, #0d47a1, #1976d2);
          color: white;
          border: none;
        }
        .btn-group {
          display: flex;
          gap: 0.5rem;
        }
        .btn-primary {
          background: linear-gradient(45deg, #0d47a1, #1976d2);
          border: none;
          color: white;
        }
        .btn-primary:hover {
          background: linear-gradient(45deg, #1976d2, #0d47a1);
        }
        .btn-warning {
          background: linear-gradient(45deg, #ffb300, #ffe082);
          border: none;
          color: #0d47a1;
        }
        .btn-warning:hover {
          background: linear-gradient(45deg, #ffe082, #ffb300);
          color: #0d47a1;
        }
        .btn-danger {
          background: linear-gradient(45deg, #e53935, #ff7043);
          border: none;
          color: white;
        }
        .btn-danger:hover {
          background: linear-gradient(45deg, #ff7043, #e53935);
        }
        .bi {
          vertical-align: middle;
          color: #0d47a1;
        }
        .btn .bi {
          color: white;
          font-size: 1rem;
        }
        .btn-warning .bi, .btn-danger .bi {
          color: #0d47a1;
        }
        .action-buttons {
          display: flex;
          flex-direction: column;
          gap: 1rem;
          align-items: center;
          margin-top: 2rem;
        }
        .action-buttons .btn {
          width: 100%;
          max-width: 350px;
          padding: 0.85rem 1.2rem;
          font-size: 1.1rem;
        }
        @media (max-width: 767.98px) {
          .card {
            padding: 1rem 0.3rem;
          }
          .table {
            font-size: 0.95rem;
          }
        }
    </style>
</head>
<body>
    
    <div class="container">
        <div class="card">
            <h1 class="text-center mb-4"><i class="bi bi-box-seam me-2"></i></h1>
               <h1 class="text-center mb-4">Product List</h1>
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.productId}</td>
                            <td>${product.name}</td>
                            <td class="text-right">${product.price}</td>
                            <td>${product.description}</td>
                            <td>
                                <div class="btn-group">
                                    <a href="product?action=edit&productId=${product.productId}" class="btn btn-warning btn-sm d-flex align-items-center justify-content-center"><i class="bi bi-pencil me-1"></i></a>
                                    <form action="product?action=delete" method="post" style="display:inline;">
                                        <input type="hidden" name="productId" value="${product.productId}">
                                        <button type="submit" class="btn btn-danger btn-sm d-flex align-items-center justify-content-center" onclick="return confirm('Are you sure you want to delete this product?')"><i class="bi bi-trash"></i></button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="action-buttons">
            <a href="product?action=add" class="btn btn-primary">Add New Product</a>
                    <a href="index.jsp" class="btn btn-secondary">Home</a>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
