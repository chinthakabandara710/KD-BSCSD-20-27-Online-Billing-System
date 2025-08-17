<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Customer List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.container {
    margin-top: 50px;
}
.table {
    margin: auto;
    width: 95%;
}
.btn-group {
    display: flex;
    gap: 5px;
}
</style>
</head>
<body>
<div class="container">
    <h1 class="text-center">Customer List</h1>
    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Account Number</th>
                <th>Name</th>
                <th>Address</th>
                <th>Telephone</th>
                <th>Units Consumed</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td>${customer.customerId}</td>
                    <td>${customer.accountNumber}</td>
                    <td>${customer.name}</td>
                    <td>${customer.address}</td>
                    <td>${customer.telephone}</td>
                    <td class="text-right">${customer.unitsConsumed}</td>
                    <td>
                        <div class="btn-group">
                            <a href="customer?action=edit&customerId=${customer.customerId}" 
                               class="btn btn-warning btn-sm">Edit</a>
                            <form action="customer?action=delete" method="post" style="display:inline;">
                                <input type="hidden" name="customerId" value="${customer.customerId}">
                                <button type="submit" class="btn btn-danger btn-sm" 
                                        onclick="return confirm('Are you sure you want to delete this customer?')">
                                    Delete
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="text-center">
        <a href="customer?action=add" class="btn btn-primary">Add New Customer</a>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>