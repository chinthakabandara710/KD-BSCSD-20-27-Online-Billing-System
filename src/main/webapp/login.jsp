<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Login - Management System</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
  background: linear-gradient(135deg, #e3f2fd, #ffffff);
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}
.login-container {
  background: linear-gradient(145deg, #ffffff, #f8f9fa);
  border-radius: 1rem;
  box-shadow: 0 4px 16px rgba(13, 71, 161, 0.10);
  padding: 40px 32px 32px 32px;
  max-width: 400px;
  width: 100%;
  margin: 32px 0;
}
.login-header {
  text-align: center;
  margin-bottom: 30px;
}
.login-header h2 {
  color: #0d47a1;
  font-weight: 700;
  margin-bottom: 0.5rem;
}
.login-header .bi {
  font-size: 2.5rem;
  color: #0d47a1;
  margin-bottom: 0.5rem;
}
.form-group {
  margin-bottom: 20px;
}
.form-control {
  border-radius: 0.5rem;
  border: 1px solid #dee2e6;
  background: #f8f9fa;
}
.btn-login {
  width: 100%;
  padding: 12px;
  background: linear-gradient(45deg, #0d47a1, #1976d2);
  border: none;
  border-radius: 0.5rem;
  color: white;
  font-weight: 500;
  font-size: 1.1rem;
  transition: all 0.3s ease-in-out;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.btn-login .bi {
  font-size: 1.2rem;
  margin: 0.3rem 0 0 0;
  color: white;
}
.btn-login:hover {
  background: linear-gradient(45deg, #1976d2, #0d47a1);
  color: white;
}
.register-link {
  text-align: center;
  margin-top: 20px;
}
.alert {
  margin-bottom: 20px;
}
@media (max-width: 575.98px) {
  .login-container {
    padding: 24px 8px 16px 8px;
  }
}
</style>
</head>
<body>
<div class="login-container">
    <div class="login-header">
        <i class="bi bi-journal-bookmark"></i>
        <h2>Pahana EDU</h2>
        <p class="text-muted">Please sign in to continue</p>
    </div>
    
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
    
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    
    <form action="login" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-login"><span>Sign In</span><i class="bi bi-box-arrow-in-right"></i></button>
    </form>
    

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>