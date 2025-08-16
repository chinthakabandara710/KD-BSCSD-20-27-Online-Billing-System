<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Management System</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
    background-color: #f8f9fa;
    text-align: center;
    padding-top: 50px;
}
.container {
    max-width: 800px;
    margin: auto;
}
.btn {
    margin: 10px;
    width: 200px;
}
.card {
    margin: 20px;
    padding: 20px;
}
.user-info {
    background: white;
    padding: 15px;
    border-radius: 5px;
    margin-bottom: 30px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}
.logout-btn {
    position: absolute;
    top: 20px;
    right: 20px;
}
</style>
</head>
<body>
<a href="login?action=logout" class="btn btn-danger btn-sm logout-btn">Logout</a>

<div class="container">
    <div class="user-info">
        <h5>Welcome, ${sessionScope.fullName}!</h5>
        <p class="text-muted">Logged in as: ${sessionScope.username} | Role: ${sessionScope.role}</p>
    </div>
    
    <h1 class="display-4">Management System</h1>
    <p class="lead">Choose what you want to manage</p>
    
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <h3>Product Management</h3>
                <p>Manage your products efficiently</p>
                <a href="product?action=list" class="btn btn-primary btn-lg">Manage Products</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <h3>Customer Management</h3>
                <p>Manage customer accounts and details</p>
                <a href="customer?action=list" class="btn btn-success btn-lg">Manage Customers</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <h3>Bill Management</h3>
                <p>Generate and manage customer bills</p>
                <a href="bill?action=list" class="btn btn-warning btn-lg">Manage Bills</a>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>