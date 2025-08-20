<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    
<title>Bill Details</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
  background: linear-gradient(135deg, #e3f2fd, #ffffff);
  min-height: 100vh;
  color: #2c3e50;
}
.card {
  background: linear-gradient(145deg, #ffffff, #f8f9fa);
  border: 1px solid #dee2e6;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.08);
  border-radius: 1rem;
  margin-bottom: 2rem;
}
.card-header {
  background: linear-gradient(90deg, #e3f2fd, #ffffff);
  border-bottom: 1px solid #dee2e6;
}
.table {
  background: white;
  border-radius: 0.7rem;
  overflow: hidden;
  margin-bottom: 0;
}
.btn-secondary {
  background: #dee2e6;
  color: #0d47a1;
  border: none;
  width: 100%;
  padding: 0.85rem 1.2rem;
  font-size: 1.1rem;
}
.btn-secondary:hover {
  background: #b0bec5;
  color: #0d47a1;
}
.bi {
  color: #0d47a1;
  font-size: 2rem;
  vertical-align: middle;
}
@media (max-width: 575.98px) {
  .card {
    padding: 1rem 0.3rem;
  }
}
</style>
</head>
<body>
    
<div class="container mt-5">
    <h1 class="text-center mb-4"><i class="bi bi-receipt me-2"></i>Bill Details</h1>
    
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
                    <p><strong>Total Amount:</strong> LKR : <fmt:formatNumber value="${bill.totalAmount}" pattern=",##0.00"/></p>
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
                        <td>LKR : <fmt:formatNumber value="${item.productPrice}" pattern=",##0.00"/></td>
                        <td>${item.quantity}</td>
                        <td>LKR : <fmt:formatNumber value="${item.subtotal}" pattern=",##0.00"/></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="text-center mt-4">
        <a href="bill?action=list" class="btn btn-secondary"><i class="bi bi-arrow-left me-1"></i>Back to Bills</a>
    </div>
</div>
</body>
</html>