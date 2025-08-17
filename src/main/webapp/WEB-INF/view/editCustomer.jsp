<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Edit Customer</title>
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
    <h1 class="text-center">Edit Customer</h1>
    <form action="customer?action=update" method="post">
        <input type="hidden" name="customerId" value="${customer.customerId}">
        <div class="form-group">
            <label for="accountNumber">Account Number:</label>
            <input type="text" class="form-control" id="accountNumber" name="accountNumber" value="${customer.accountNumber}" required>
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${customer.name}" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <textarea class="form-control" id="address" name="address" rows="3" required>${customer.address}</textarea>
        </div>
        <div class="form-group">
            <label for="telephone">Telephone:</label>
            <input type="tel" class="form-control" id="telephone" name="telephone" value="${customer.telephone}" required>
        </div>
        <div class="form-group">
            <label for="unitsConsumed">Units Consumed:</label>
            <input type="number" class="form-control" id="unitsConsumed" name="unitsConsumed" min="0" value="${customer.unitsConsumed}" required>
        </div>
        <button type="submit" class="btn btn-primary">Update Customer</button>
    </form>
    <div class="text-center mt-3">
        <a href="customer?action=list" class="btn btn-secondary">Back to List</a>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>