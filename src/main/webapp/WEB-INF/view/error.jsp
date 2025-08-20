<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
    
    <title>Error</title>
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
  margin-top: 60px;
  padding: 2rem 1.5rem;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}
.alert-danger {
  background: linear-gradient(90deg, #e53935, #ff7043);
  color: white;
  border: none;
  border-radius: 0.7rem;
  padding: 1.5rem 1rem;
}
.btn-primary {
  background: linear-gradient(45deg, #0d47a1, #1976d2);
  border: none;
  color: white;
  width: 100%;
  padding: 0.85rem 1.2rem;
  font-size: 1.1rem;
}
.btn-primary:hover {
  background: linear-gradient(45deg, #1976d2, #0d47a1);
}
.bi {
  color: #fff;
  font-size: 2.2rem;
  vertical-align: middle;
  margin-bottom: 0.5rem;
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
        <div class="alert alert-danger text-center">
            <i class="bi bi-exclamation-triangle mb-2"></i>
            <h1>Error</h1>
            <p>${errorMessage}</p>
            <a href="index.jsp" class="btn btn-primary mt-3"><i class="bi bi-house me-1"></i>Back to Home</a>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
