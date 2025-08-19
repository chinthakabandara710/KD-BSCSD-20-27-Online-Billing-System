<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Bill List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.container {
    margin-top: 50px;
}
.table {
    margin: auto;
    width: 98%;
    font-size: 14px;
}
.btn-group {
    display: flex;
    gap: 5px;
}
.total-amount {
    font-weight: bold;
    color: #28a745;
}
</style>
</head>
<body>
<div class="container">
    <h1 class="text-center">Bill List</h1>
	<table class="table table-striped table-bordered">
        <thead class="thead-dark">
            <tr>
            <th>Bill ID</th>
            <th>Account No</th>
            <th>Customer</th>
            <th>Total Amount</th>
            <th>Date</th>
            <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="bill" items="${bills}">
            <tr>
            <td>${bill.billId}</td>
            <td>${bill.accountNumber}</td>
            <td>${bill.customerName}</td>
            <td class="text-right total-amount">LKR : <fmt:formatNumber value="${bill.totalAmount}" pattern="#,##0.00"/></td>
            <td><fmt:formatDate value="${bill.billDate}" pattern="yyyy-MM-dd HH:mm"/></td>
            <td>
            <a href="bill?action=view&billId=${bill.billId}" class="btn btn-info btn-sm">View Items</a>
            <form action="bill?action=delete" method="post" style="display:inline;">
            <input type="hidden" name="billId" value="${bill.billId}">
            <button type="submit" class="btn btn-danger btn-sm"
            onclick="return confirm('Are you sure you want to delete this bill?')">
            Delete
            </button>
            </form>
            </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="text-center">
        <a href="bill?action=create" class="btn btn-primary">Generate New Bill</a>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>