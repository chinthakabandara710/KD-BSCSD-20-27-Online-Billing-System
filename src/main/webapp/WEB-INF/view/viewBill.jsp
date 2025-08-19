<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Bill Details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Bill Details</h1>
    
    <div class="card mb-4">
        <div class="card-header">
            <h4>Bill Information</h4>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <p><strong>Bill ID:</strong> ${bill.billId}</p>
                    <p><strong>Customer:</strong> ${bill.customerName}</p>
                    <p><strong>Account No:</strong> ${bill.accountNumber}</p>
                </div>
                <div class="col-md-6">
                    <p><strong>Date:</strong> <fmt:formatDate value="${bill.billDate}" pattern="yyyy-MM-dd HH:mm"/></p>
                    <p><strong>Total Amount:</strong> LKR : <fmt:formatNumber value="${bill.totalAmount}" pattern="#,##0.00"/></p>
                </div>
            </div>
        </div>
    </div>
    
    <div class="card">
        <div class="card-header">
            <h4>Items</h4>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${orderItems}">
                    <tr>
                        <td>${item.productName}</td>
                        <td>LKR : <fmt:formatNumber value="${item.productPrice}" pattern="#,##0.00"/></td>
                        <td>${item.quantity}</td>
                        <td>LKR : <fmt:formatNumber value="${item.subtotal}" pattern="#,##0.00"/></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="text-center mt-4">
        <a href="bill?action=list" class="btn btn-secondary">Back to Bills</a>
    </div>
</div>
</body>
</html>