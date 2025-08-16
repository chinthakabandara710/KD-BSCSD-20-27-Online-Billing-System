<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Edit Product</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.container {
    margin-top: 50px;
    max-width: 600px;
}
.form-group {
    margin-bottom: 15px;
}
.btn-primary {
    width: 100%;
}
</style>
</head>
<body>
<div class="container">
    <h1 class="text-center">Edit Product</h1>
    <form action="product?action=update" method="post">
        <input type="hidden" name="productId" value="${product.productId}">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" class="form-control" step="0.01" id="price" name="price" value="${product.price}" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <input type="text" class="form-control" id="description" name="description" value="${product.description}" required>
        </div>
        <button type="submit" class="btn btn-primary">Update Product</button>
    </form>
    <div class="text-center mt-3">
        <a href="product?action=list" class="btn btn-secondary">Back to List</a>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>