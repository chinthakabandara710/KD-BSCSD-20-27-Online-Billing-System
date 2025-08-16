<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Generate Bill</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.container {
    margin-top: 50px;
    max-width: 700px;
}
.form-group {
    margin-bottom: 20px;
}
.calculation-section {
    background-color: #f8f9fa;
    padding: 20px;
    border-radius: 5px;
    margin-top: 20px;
}
.total-display {
    font-size: 24px;
    font-weight: bold;
    color: #28a745;
}
</style>
</head>
<body>
<div class="container">
    <h1 class="text-center">Generate Bill</h1>
    <form action="bill?action=generate" method="post" id="billForm">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="customerId">Select Customer:</label>
                    <select class="form-control" id="customerId" name="customerId" required onchange="updateCustomerInfo()">
                        <option value="">-- Select Customer --</option>
                        <c:forEach var="customer" items="${customers}">
                            <option value="${customer.customerId}" 
                                    data-name="${customer.name}" 
                                    data-account="${customer.accountNumber}"
                                    data-units="${customer.unitsConsumed}">
                                ${customer.accountNumber} - ${customer.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="productId">Select Product/Service:</label>
                    <select class="form-control" id="productId" name="productId" required onchange="updateProductInfo()">
                        <option value="">-- Select Product --</option>
                        <c:forEach var="product" items="${products}">
                            <option value="${product.productId}" 
                                    data-name="${product.name}" 
                                    data-price="${product.price}">
                                ${product.name} - $${product.price}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="unitsConsumed">Units Consumed:</label>
                    <input type="number" class="form-control" id="unitsConsumed" name="unitsConsumed" 
                           min="1" required onchange="calculateTotal()">
                </div>
            </div>
        </div>
        
        <div class="calculation-section">
            <h4>Bill Summary</h4>
            <div class="row">
                <div class="col-md-6">
                    <p><strong>Customer:</strong> <span id="selectedCustomer">Not selected</span></p>
                    <p><strong>Account No:</strong> <span id="selectedAccount">Not selected</span></p>
                </div>
                <div class="col-md-6">
                    <p><strong>Service:</strong> <span id="selectedProduct">Not selected</span></p>
                    <p><strong>Rate per Unit:</strong> $<span id="selectedPrice">0.00</span></p>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-6">
                    <p><strong>Units:</strong> <span id="displayUnits">0</span></p>
                    <p><strong>Rate:</strong> $<span id="displayPrice">0.00</span></p>
                </div>
                <div class="col-md-6">
                    <p class="total-display">Total Amount: $<span id="totalAmount">0.00</span></p>
                </div>
            </div>
        </div>
        
        <div class="text-center mt-4">
            <button type="submit" class="btn btn-success btn-lg">Generate Bill</button>
            <a href="bill?action=list" class="btn btn-secondary">Back to Bills</a>
        </div>
        <small class="text-muted">Bill will be automatically saved as a text file in your Bills folder</small>
    </form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
function updateCustomerInfo() {
    const select = document.getElementById('customerId');
    const option = select.options[select.selectedIndex];
    
    if (option.value) {
        document.getElementById('selectedCustomer').textContent = option.getAttribute('data-name');
        document.getElementById('selectedAccount').textContent = option.getAttribute('data-account');
        
        const customerUnits = option.getAttribute('data-units');
        document.getElementById('unitsConsumed').value = customerUnits;
        calculateTotal();
    } else {
        document.getElementById('selectedCustomer').textContent = 'Not selected';
        document.getElementById('selectedAccount').textContent = 'Not selected';
        document.getElementById('unitsConsumed').value = '';
        calculateTotal();
    }
}

function updateProductInfo() {
    const select = document.getElementById('productId');
    const option = select.options[select.selectedIndex];
    
    if (option.value) {
        document.getElementById('selectedProduct').textContent = option.getAttribute('data-name');
        document.getElementById('selectedPrice').textContent = parseFloat(option.getAttribute('data-price')).toFixed(2);
        calculateTotal();
    } else {
        document.getElementById('selectedProduct').textContent = 'Not selected';
        document.getElementById('selectedPrice').textContent = '0.00';
        calculateTotal();
    }
}

function calculateTotal() {
    const productSelect = document.getElementById('productId');
    const unitsInput = document.getElementById('unitsConsumed');
    
    if (productSelect.value && unitsInput.value) {
        const option = productSelect.options[productSelect.selectedIndex];
        const price = parseFloat(option.getAttribute('data-price'));
        const units = parseInt(unitsInput.value);
        const total = price * units;
        
        document.getElementById('displayPrice').textContent = price.toFixed(2);
        document.getElementById('displayUnits').textContent = units;
        document.getElementById('totalAmount').textContent = total.toFixed(2);
    } else {
        document.getElementById('displayPrice').textContent = '0.00';
        document.getElementById('displayUnits').textContent = '0';
        document.getElementById('totalAmount').textContent = '0.00';
    }
}
</script>
</body>
</html>