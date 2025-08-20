<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Bill List</title>
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
.btn-info {
  background: linear-gradient(45deg, #1976d2, #64b5f6);
  border: none;
  color: white;
}
.btn-info:hover {
  background: linear-gradient(45deg, #64b5f6, #1976d2);
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
.btn-info .bi, .btn-danger .bi {
  color: white;
}
.total-amount {
  font-weight: bold;
  color: #388e3c;
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
        <h1 class="text-center mb-4"><i class="bi bi-receipt me-2"></i></h1>
        <h1 class="text-center mb-4">Bill List</h1>
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
                        <td class="text-right total-amount">LKR : <fmt:formatNumber value="${bill.totalAmount}" pattern=",##0.00"/></td>
                        <td><fmt:formatDate value="${bill.billDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <div class="btn-group">
                                <a href="bill?action=view&billId=${bill.billId}" class="btn btn-info btn-sm d-flex align-items-center justify-content-center"><i class="bi bi-eye"></i></a>
                                <form action="bill?action=delete" method="post" style="display:inline;">
                                    <input type="hidden" name="billId" value="${bill.billId}">
                                    <button type="submit" class="btn btn-danger btn-sm d-flex align-items-center justify-content-center" onclick="return confirm('Are you sure you want to delete this bill?')"><i class="bi bi-trash"></i></button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="action-buttons">
        <a href="bill?action=create" class="btn btn-primary">Generate New Bill</a>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>