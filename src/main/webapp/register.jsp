<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Register - Management System</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    
body {
  background: linear-gradient(135deg, #e3f2fd, #ffffff);
  min-height: 100vh;
  color: #2c3e50;
  display: flex;
  align-items: center;
  justify-content: center;
}
.card {
  background: linear-gradient(145deg, #ffffff, #f8f9fa);
  border: 1px solid #dee2e6;
  box-shadow: 0 4px 16px rgba(13, 71, 161, 0.10);
  border-radius: 1rem;
  padding: 40px 32px 32px 32px;
  max-width: 450px;
  width: 100%;
  margin: 32px 0;
}
.register-header {
  text-align: center;
  margin-bottom: 30px;
}
.register-header h2 {
  color: #0d47a1;
  font-weight: 700;
  margin-bottom: 0.5rem;
}
.register-header .bi {
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
.btn-register {
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
.btn-register .bi {
  font-size: 1.2rem;
  margin: 0.3rem 0 0 0;
  color: white;
}
.btn-register:hover {
  background: linear-gradient(45deg, #1976d2, #0d47a1);
  color: white;
}
.login-link {
  text-align: center;
  margin-top: 20px;
}
.alert {
  margin-bottom: 20px;
}
@media (max-width: 575.98px) {
  .card {
    padding: 24px 8px 16px 8px;
  }
}
</style>
</head>
<body>
<div class="card">
    <div class="register-header">
        <i class="bi bi-person-plus"></i>
        <h2>Create Account</h2>
        <p class="text-muted">Add Staff Member</p>
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
        <button type="submit" class="btn btn-register"><span>Create Account</span><i class="bi bi-person-plus"></i></button>      
          
    </form>
    
        <button  class="btn btn-secondary mt-2"> <a class="btn btn-secondary" href="index.jsp" >Back to Home</a></button>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>

function validateForm() {
    let isValid = true;
    const errors = [];   

    const fullName = document.getElementById('fullName').value.trim();
    const username = document.getElementById('username').value.trim();
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    
   
    clearErrors();   

    if (fullName === '') {
        showError('fullName', 'Full name is required');
        isValid = false;
    } else if (fullName.length < 2) {
        showError('fullName', 'Full name must be at least 2 characters long');
        isValid = false;
    } else if (!/^[a-zA-Z\s]+$/.test(fullName)) {
        showError('fullName', 'Full name can only contain letters and spaces');
        isValid = false;
    }    
    
    if (username === '') {
        showError('username', 'Username is required');
        isValid = false;
    } else if (username.length < 3) {
        showError('username', 'Username must be at least 3 characters long');
        isValid = false;
    } else if (!/^[a-zA-Z0-9_]+$/.test(username)) {
        showError('username', 'Username can only contain letters, numbers, and underscores');
        isValid = false;
    }
    
    
    if (email === '') {
        showError('email', 'Email is required');
        isValid = false;
    } else if (!isValidEmail(email)) {
        showError('email', 'Please enter a valid email address');
        isValid = false;
    }
    

    if (password === '') {
        showError('password', 'Password is required');
        isValid = false;
    } else if (password.length < 8) {
        showError('password', 'Password must be at least 8 characters long');
        isValid = false;
    } else if (!/(?=.*[a-z])/.test(password)) {
        showError('password', 'Password must contain at least one lowercase letter');
        isValid = false;
    } else if (!/(?=.*[A-Z])/.test(password)) {
        showError('password', 'Password must contain at least one uppercase letter');
        isValid = false;
    } else if (!/(?=.*\d)/.test(password)) {
        showError('password', 'Password must contain at least one number');
        isValid = false;
    } else if (!/(?=.*[@$!%*?&])/.test(password)) {
        showError('password', 'Password must contain at least one special character (@$!%*?&)');
        isValid = false;
    }
    
    if (confirmPassword === '') {
        showError('confirmPassword', 'Please confirm your password');
        isValid = false;
    } else if (password !== confirmPassword) {
        showError('confirmPassword', 'Passwords do not match');
        isValid = false;
    }
    
    return isValid;
}

function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}


function showError(fieldId, message) {
    const field = document.getElementById(fieldId);
    const formGroup = field.closest('.form-group');
    
  
    field.classList.add('is-invalid');
    
    
    let errorDiv = formGroup.querySelector('.invalid-feedback');
    if (!errorDiv) {
        errorDiv = document.createElement('div');
        errorDiv.className = 'invalid-feedback';
        formGroup.appendChild(errorDiv);
    }
    errorDiv.textContent = message;
    errorDiv.style.display = 'block';
}



function clearErrors() {
    const invalidInputs = document.querySelectorAll('.is-invalid');
    const errorMessages = document.querySelectorAll('.invalid-feedback');
    
    invalidInputs.forEach(input => {
        input.classList.remove('is-invalid');
    });
    
    errorMessages.forEach(error => {
        error.style.display = 'none';
    });
}



document.addEventListener('DOMContentLoaded', function() {
    const inputs = ['fullName', 'username', 'email', 'password', 'confirmPassword'];
    
    inputs.forEach(inputId => {
        const input = document.getElementById(inputId);
        input.addEventListener('blur', function() {
            validateField(inputId);
        });
        
        input.addEventListener('input', function() {
            
            if (this.classList.contains('is-invalid')) {
                this.classList.remove('is-invalid');
                const errorDiv = this.closest('.form-group').querySelector('.invalid-feedback');
                if (errorDiv) {
                    errorDiv.style.display = 'none';
                }
            }
        });
    });
});


function validateField(fieldId) {
    const field = document.getElementById(fieldId);
    const value = field.value.trim();
    
    clearFieldError(fieldId);
    
    switch(fieldId) {
        case 'fullName':
            if (value === '') {
                showError('fullName', 'Full name is required');
            } else if (value.length < 2) {
                showError('fullName', 'Full name must be at least 2 characters long');
            } else if (!/^[a-zA-Z\s]+$/.test(value)) {
                showError('fullName', 'Full name can only contain letters and spaces');
            }
            break;
            
        case 'username':
            if (value === '') {
                showError('username', 'Username is required');
            } else if (value.length < 3) {
                showError('username', 'Username must be at least 3 characters long');
            } else if (!/^[a-zA-Z0-9_]+$/.test(value)) {
                showError('username', 'Username can only contain letters, numbers, and underscores');
            }
            break;
            
        case 'email':
            if (value === '') {
                showError('email', 'Email is required');
            } else if (!isValidEmail(value)) {
                showError('email', 'Please enter a valid email address');
            }
            break;
            
        case 'password':
            if (value === '') {
                showError('password', 'Password is required');
            } else if (value.length < 8) {
                showError('password', 'Password must be at least 8 characters long');
            } else if (!/(?=.*[a-z])/.test(value)) {
                showError('password', 'Password must contain at least one lowercase letter');
            } else if (!/(?=.*[A-Z])/.test(value)) {
                showError('password', 'Password must contain at least one uppercase letter');
            } else if (!/(?=.*\d)/.test(value)) {
                showError('password', 'Password must contain at least one number');
            } else if (!/(?=.*[@$!%*?&])/.test(value)) {
                showError('password', 'Password must contain at least one special character (@$!%*?&)');
            }
            break;
            
        case 'confirmPassword':
            const password = document.getElementById('password').value;
            if (value === '') {
                showError('confirmPassword', 'Please confirm your password');
            } else if (password !== value) {
                showError('confirmPassword', 'Passwords do not match');
            }
            break;
    }
}


function clearFieldError(fieldId) {
    const field = document.getElementById(fieldId);
    const formGroup = field.closest('.form-group');
    
    field.classList.remove('is-invalid');
    
    const errorDiv = formGroup.querySelector('.invalid-feedback');
    if (errorDiv) {
        errorDiv.style.display = 'none';
    }
}


document.querySelector('form').addEventListener('submit', function(e) {
    if (!validateForm()) {
        e.preventDefault();
        
        showGeneralError('Please correct the errors below before submitting.');
    }
});


function showGeneralError(message) {
    let generalError = document.querySelector('.general-error');
    if (!generalError) {
        generalError = document.createElement('div');
        generalError.className = 'alert alert-danger general-error';
        const form = document.querySelector('form');
        form.insertBefore(generalError, form.firstChild);
    }
    generalError.textContent = message;
    generalError.style.display = 'block';
    

    window.scrollTo({ top: 0, behavior: 'smooth' });
}
</script>
</body>
</html>