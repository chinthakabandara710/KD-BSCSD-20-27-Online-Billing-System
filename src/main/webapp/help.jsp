<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support - Pahana EDU</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
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
            transition: all 0.3s ease-in-out;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
        }
        
        .btn-primary {
            background: linear-gradient(45deg, #0d47a1, #1976d2);
            border: none;
            color: white;
            transition: all 0.3s ease-in-out;
        }
        
        .btn-primary:hover {
            background: linear-gradient(45deg, #1976d2, #0d47a1);
            transform: translateY(-2px);
        }
        
        .navbar {
            background: linear-gradient(90deg, #ffffff, #f1f5f9);
            border-bottom: 1px solid #dee2e6;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .help-section {
            background: linear-gradient(135deg, #0d47a1 0%, #1976d2 100%);
            color: white;
            padding: 60px 0;
        }
        
        .feature-card {
            transition: all 0.3s ease-in-out;
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
        }
        
        .accordion-button {
            background: linear-gradient(145deg, #ffffff, #f8f9fa);
            border: 1px solid #dee2e6;
            color: #2c3e50;
            transition: all 0.3s ease-in-out;
        }
        
        .accordion-button:not(.collapsed) {
            background: linear-gradient(45deg, #0d47a1, #1976d2);
            color: white;
        }
        
        .accordion-button:focus {
            box-shadow: none;
            border-color: #0d47a1;
        }
        
        .accordion-button:hover {
            background: linear-gradient(145deg, #f8f9fa, #e9ecef);
        }
        
        .accordion-button:not(.collapsed):hover {
            background: linear-gradient(45deg, #1976d2, #0d47a1);
        }
        
        .bi {
            color: #0d47a1;
        }
        
        .nav-link:hover .bi {
            color: #1976d2;
        }
        
        .btn .bi {
            color: white;
        }
        
        .accordion-button:not(.collapsed) .bi {
            color: white;
        }
        
        .bg-light {
            background: linear-gradient(135deg, #f8f9fa, #e9ecef) !important;
        }
        
        .bg-dark {
            background: linear-gradient(135deg, #2c3e50, #34495e) !important;
        }
        
        .text-primary {
            color: #0d47a1 !important;
        }
        
        .display-4 {
            font-weight: 600;
        }
        
        .lead {
            font-weight: 400;
        }
    </style>
</head>
<body>



    <section class="help-section">
        <div class="container text-center">
            <h1 class="display-4 mb-4">
                <i class="bi bi-question-circle me-3"></i>Help & Support
            </h1>
            <p class="lead">Welcome to Pahana EDU System Usage Guidelines</p>
            <p>Your comprehensive guide to managing bookshop operations efficiently</p>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="text-center mb-5">
                        <i class="bi bi-info-circle me-2"></i>System Overview
                    </h2>
                    <div class="card mb-4">
                        <div class="card-body">
                            <h4><i class="bi bi-gear me-2"></i>About Pahana EDU System</h4>
                            <p>Pahana EDU is a comprehensive web-based management system designed for bookshop operations in Colombo City. The system helps you manage customer accounts, product inventory, billing information, and user accounts efficiently.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-5">
                <i class="bi bi-star me-2"></i>System Features
            </h2>
            <div class="row g-4">
                <div class="col-md-6 col-lg-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <i class="bi bi-shield-lock display-4 mb-3"></i>
                            <h5>User Authentication</h5>
                            <p>Secure login system with username and password protection</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <i class="bi bi-person-plus display-4 mb-3"></i>
                            <h5>Customer Management</h5>
                            <p>Add, edit, and manage customer account details efficiently</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <i class="bi bi-box display-4 mb-3"></i>
                            <h5>Product Management</h5>
                            <p>Add, update, and delete product information with ease</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <i class="bi bi-receipt display-4 mb-3"></i>
                            <h5>Billing System</h5>
                            <p>Calculate and generate customer bills automatically</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <i class="bi bi-eye display-4 mb-3"></i>
                            <h5>Account Display</h5>
                            <p>View and retrieve customer account information quickly</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <i class="bi bi-people display-4 mb-3"></i>
                            <h5>User Management</h5>
                            <p>Create new member accounts and manage user roles</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">
                <i class="bi bi-chat-question me-2"></i>Frequently Asked Questions
            </h2>
            <div class="accordion" id="helpAccordion">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1">
                            <i class="bi bi-person-plus me-2"></i>How do I add a new customer?
                        </button>
                    </h2>
                    <div id="collapse1" class="accordion-collapse collapse show" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <ol>
                                <li>Navigate to <strong>Customer Management</strong> from the dashboard</li>
                                <li>Click on <strong>"Add New Customer"</strong> button</li>
                                <li>Fill in the customer details: Account Number, Name, Address, Telephone Number</li>
                                <li>Click <strong>"Save"</strong> to add the customer to the system</li>
                            </ol>
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2">
                            <i class="bi bi-receipt me-2"></i>How do I generate a customer bill?
                        </button>
                    </h2>
                    <div id="collapse2" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <ol>
                                <li>Go to <strong>Bill Management</strong> from the dashboard</li>
                                <li>Select the customer from the list or search by account number</li>
                                <li>Enter the units consumed or items purchased</li>
                                <li>The system will automatically calculate the bill amount</li>
                                <li>Click <strong>"Generate Bill"</strong> to create and print the bill</li>
                            </ol>
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3">
                            <i class="bi bi-box me-2"></i>How do I manage product information?
                        </button>
                    </h2>
                    <div id="collapse3" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <ol>
                                <li>Access <strong>Product Management</strong> from the main dashboard</li>
                                <li>To add: Click <strong>"Add New Product"</strong> and fill in product details</li>
                                <li>To edit: Find the product and click <strong>"Edit"</strong> button</li>
                                <li>To delete: Select the product and click <strong>"Delete"</strong> (confirm the action)</li>
                                <li>Save changes to update the product database</li>
                            </ol>
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4">
                            <i class="bi bi-pencil me-2"></i>How do I edit customer information?
                        </button>
                    </h2>
                    <div id="collapse4" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <ol>
                                <li>Navigate to <strong>Customer Management</strong></li>
                                <li>Find the customer using search or browse through the list</li>
                                <li>Click the <strong>"Edit"</strong> button next to the customer's name</li>
                                <li>Update the required information (name, address, telephone, etc.)</li>
                                <li>Click <strong>"Update"</strong> to save the changes</li>
                            </ol>
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse5">
                            <i class="bi bi-shield-check me-2"></i>What are the different user roles?
                        </button>
                    </h2>
                    <div id="collapse5" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <p>The system supports different user roles with varying permissions:</p>
                            <ul>
                                <li><strong>Admin:</strong> Full access to all system features including user management</li>
                                <li><strong>User:</strong> Limited access to view product information and generate bills</li>
                            </ul>
                            <p>Note: Only Admin roles can create new member accounts.</p>
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse6">
                            <i class="bi bi-box-arrow-right me-2"></i>How do I logout securely?
                        </button>
                    </h2>
                    <div id="collapse6" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <ol>
                                <li>Click the <strong>"Logout"</strong> button (red button) at the bottom of the dashboard</li>
                                <li>You will be automatically redirected to the login page</li>
                                <li>Your session will be terminated securely</li>
                                <li>Always logout when finished to protect your account</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
      <section class="py-5 text-center">
        <div class="container">
                     <a href="index.jsp" class="btn btn-primary btn-lg mt-4">
                <i class="bi bi-house me-2"></i>Back to Dashboard
            </a>
        </div>
        </section>
        
    
   

    <section class="py-5 bg-dark text-white">
        <div class="container text-center">
            <h2 class="mb-4">
                <i class="bi bi-headset me-2"></i>Need More Help?
            </h2>
            <p class="lead mb-4">If you can't find the answer you're looking for, contact our support team</p>
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="d-flex align-items-center justify-content-center mb-3">
                        <i class="bi bi-envelope display-6 me-3"></i>
                        <div>
                            <h5>Email Support</h5>
                            <p class="mb-0">support@pahanaedu.lk</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="d-flex align-items-center justify-content-center mb-3">
                        <i class="bi bi-telephone display-6 me-3"></i>
                        <div>
                            <h5>Phone Support</h5>
                            <p class="mb-0">+94 11 234 5678</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>