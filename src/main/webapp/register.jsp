<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Register - Management System</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}
.register-container {
    background: white;
    border-radius: 10px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
    padding: 40px;
    max-width: 450px;
    width: 100%;
}
.register-header {
    text-align: center;
    margin-bottom: 30px;
}
.register-header h2 {
    color: #333;
    font-weight: 600;
}
.form-group {
    margin-bottom: 20px;
}
.btn-register {
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border: none;
    border-radius: 5px;
    color: white;
    font-weight: 500;
}
.btn-register:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    color: white;
}
.login-link {
    text-align: center;
    margin-top: 20px;
}
.alert {
    margin-bottom: 20px;
}
</style>
</head>
<body>
<div class="register-container">
    <div class="register-header">
        <h2>Create Account</h2>
        <p class="text-muted">Join our management system</p>
    </div>
    
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
    
    <form action="login" method="post">
        <input type="hidden" name="action" value="register">
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" class="form-control" id="fullName" name="fullName" required>
        </div>
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
        </div>
        <button type="submit" class="btn btn-register">Create Account</button>
    </form>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
document.querySelector('form').addEventListener('submit', function(e) {
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    
    if (password !== confirmPassword) {
        e.preventDefault();
        alert('Passwords do not match!');
    }
});
</script>
</body>
</html>