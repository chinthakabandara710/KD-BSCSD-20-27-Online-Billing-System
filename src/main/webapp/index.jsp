<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Management System</title>
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
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  border-radius: 1rem;
  transition: all 0.3s ease-in-out;
  min-height: 370px;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0;
}
.card-body-flex {
  flex: 1 1 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  width: 100%;
  padding: 2rem 1.5rem 1rem 1.5rem;
}
.card .btn {
  margin-top: auto;
  width: 90%;
  margin-bottom: 1.5rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-size: 1.1rem;
}
.card .bi {
  font-size: 2.8rem;
  margin-bottom: 1rem;
  color: #0d47a1;
}
.btn-primary {
  background: linear-gradient(45deg, #0d47a1, #1976d2);
  border: none;
  color: white;
  transition: all 0.3s ease-in-out;
}
.btn-primary:hover {
  background: linear-gradient(45deg, #1976d2, #0d47a1);
}
.btn-success {
  background: linear-gradient(45deg, #43a047, #66bb6a);
  border: none;
  color: white;
}
.btn-success:hover {
  background: linear-gradient(45deg, #388e3c, #43a047);
}
.btn-warning {
  background: linear-gradient(45deg, #ffb300, #ffe082);
  border: none;
  color: #0d47a1;
}
.btn-warning:hover {
  background: linear-gradient(45deg, #ffe082, #ffb300);
  color: #0d47a1;
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
  color: #0d47a1;
  vertical-align: middle;
}
.btn .bi {
  color: white;
}
.display-4 {
  color: #0d47a1;
  font-weight: 700;
}
.lead {
  color: #1976d2;
}
.user-info {
  background: linear-gradient(90deg, #e3f2fd, #ffffff);
  padding: 15px 30px;
  border-radius: 1rem;
  margin-bottom: 30px;
  box-shadow: 0 2px 8px rgba(13, 71, 161, 0.07);
  text-align: left;
  flex-wrap: wrap;
}
@media (max-width: 991.98px) {
  .card {
    min-height: 340px;
  }
}
@media (max-width: 767.98px) {
  .card {
    min-height: 0;
  }
  .user-info {
    flex-direction: column;
    align-items: flex-start !important;
    padding: 15px 10px;
  }
  .logout-btn {
    position: static;
    margin-top: 15px;
    width: 100%;
  }
}
.logout-btn {
  position: fixed;
  bottom: 32px;
  right: 32px;
  z-index: 1000;
  box-shadow: 0 2px 8px rgba(13, 71, 161, 0.07);
}
@media (max-width: 767.98px) {
  .logout-btn {
    bottom: 16px;
    right: 16px;
    width: 90%;
    left: 5%;
  }
}
.card .btn .bi {
  font-size: 1.2rem;
  display: block;
  margin: 0.2rem auto 0.1rem auto;
  color: white;
}
.card .btn .bi {
  font-size: 1.3rem;
  margin: 0.3rem 0 0 0;
  color: white;
}
</style>
</head>
<body>


<div class="container py-5">
    <div class="user-info mb-4 d-flex align-items-center justify-content-between flex-wrap">
        <div class="flex-grow-1">
            <h5 class="mb-1"><i class="bi bi-person-circle m-4 "></i>Welcome, ${sessionScope.fullName}!</h5>
            <!-- <p class="text-muted mb-0">Logged in as: ${sessionScope.username} | Role: ${sessionScope.role}</p> -->
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <h1 class="display-4 mb-3 text-center"><i class="bi bi-house me-2"></i></h1>
    </div>
    <div class="d-flex justify-content-center">
        <h1 class="display-4 mb-3 text-center">Pahana EDU Dashboard</h1>
    </div>
    <p class="lead mb-5 text-center">Choose what you want to manage</p>
    <div class="row justify-content-center g-4">
        <div class="col-12 col-sm-6 col-md-5 col-lg-3 d-flex  m-2">
            <div class="card w-100 text-center">
                <div class="card-body-flex">
                    <i class="bi bi-graph-up"></i>
                    <h3 class="mb-2">Product Management</h3>
                    <p class="mb-3">Manage your products efficiently</p>
                </div>
                <a href="product?action=list" class="btn btn-primary btn-lg"><span>Manage Products</span><i class="bi bi-eye"></i></a>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-5 col-lg-3 d-flex  m-2">
            <div class="card w-100 text-center">
                <div class="card-body-flex">
                    <i class="bi bi-person"></i>
                    <h3 class="mb-2">Customer Management</h3>
                    <p class="mb-3">Manage customer accounts and details</p>
                </div>
                <a href="customer?action=list" class="btn btn-success btn-lg"><span>Manage Customers</span><i class="bi bi-eye"></i></a>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-5 col-lg-3 d-flex  m-2">
            <div class="card w-100 text-center">
                <div class="card-body-flex">
                    <i class="bi bi-receipt"></i>
                    <h3 class="mb-2">Bill Management</h3>
                    <p class="mb-3">Generate and manage customer bills</p>
                </div>
                <a href="bill?action=list" class="btn btn-warning btn-lg"><span>Manage Bills</span><i class="bi bi-eye"></i></a>
            </div>
        </div>
		  <c:if test="${sessionScope.role != 'user'}">
			<div class="col-12 col-sm-6 col-md-5 col-lg-3 d-flex  m-2">
			<div class="card w-100 text-center">
			<div class="card-body-flex">
			<i class="bi bi-plus-circle"></i>
			<h3 class="mb-2">Create Member</h3>
			<p class="mb-3">Add a new member</p>
			</div>
			<a href="register.jsp" class="btn btn-warning btn-lg"><span>Create</span><i class="bi bi-plus-circle"></i></a>
			</div>
			</div>
		</c:if>
  
   		 
   		 <div class="col-12 col-sm-6 col-md-5 col-lg-3 d-flex m-2">
			<div class="card w-100 text-center">
			<div class="card-body-flex">
			<i class="bi bi-question-circle"></i>
			<h3 class="mb-2">Help & Support</h3>
			<p class="mb-3">System usage guidelines and support</p>
			</div>
			<a href="help.jsp" class="btn btn-info btn-lg"><span>Get Help</span><i class="bi bi-question-circle"></i></a>
			</div>
			</div>
			</div>
			<a href="login?action=logout" class="btn btn-danger btn-lg logout-btn"><i class="bi bi-box-arrow-right me-2"></i></a>
			</div>
			 		 
    	<a href="login?action=logout" class="btn btn-danger btn-lg logout-btn"><i class="bi bi-box-arrow-right me-2"></i></a>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>