<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<title>Add Customer</title>
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
  margin-top: 40px;
  padding: 2rem 1.5rem;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}
.form-group {
  margin-bottom: 18px;
}
.form-control {
  border-radius: 0.5rem;
  border: 1px solid #dee2e6;
  background: #f8f9fa;
}
.btn-primary {
  background: linear-gradient(45deg, #0d47a1, #1976d2);
  border: none;
  color: white;
  width: 100%;
  padding: 0.85rem 1.2rem;
  font-size: 1.1rem;
  margin-bottom: 0.5rem;
}
.btn-primary:hover {
  background: linear-gradient(45deg, #1976d2, #0d47a1);
}
.btn-secondary {
  width: 100%;
  padding: 0.85rem 1.2rem;
  font-size: 1.1rem;
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
<div class="card">
    <h1 class="text-center mb-4"><i class="bi bi-person-plus me-2"></i></h1>
        <h1 class="text-center mb-4">Add Customer</h1>
    <form action="customer?action=add" method="post">
        <div class="form-group">
            <label for="accountNumber">Account Number:</label>
            <input type="text" class="form-control" id="accountNumber" name="accountNumber" required>
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
        </div>
        <div class="form-group">
            <label for="telephone">Telephone:</label>
            <input type="tel" class="form-control" id="telephone" name="telephone" required>
        </div>
        <input type="number" class="form-control" id="unitsConsumed" name="unitsConsumed" min="0" value=0 hidden>
        <button type="submit" class="btn btn-primary">Add Customer</button>
    </form>
    <a href="customer?action=list" class="btn btn-secondary mt-2">Back to List</a>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>