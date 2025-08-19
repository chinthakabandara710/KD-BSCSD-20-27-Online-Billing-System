<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Generate Bill</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
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
      }a
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
              <select
                class="form-control"
                id="customerId"
                name="customerId"
                required
                onchange="updateCustomerInfo()"
              >
                <option value="">-- Select Customer --</option>
                <c:forEach var="customer" items="${customers}">
                  <option
                    value="${customer.customerId}"
                    data-name="${customer.name}"
                    data-account="${customer.accountNumber}"
                    data-units="${customer.unitsConsumed}"
                  >
                    ${customer.accountNumber} - ${customer.name}
                  </option>
                </c:forEach>
              </select>
            </div>
          </div>
          <div id="productRows">
            <div class="product-row border p-3 mb-3">
              <div class="row">
                <div class="col-md-6">
                  <select
                    class="form-control product-select"
                    name="productId[]"
                    required
                  >
                    <option value="">-- Select Product --</option>
                    <c:forEach var="product" items="${products}">
                      <option
                        value="${product.productId}"
                        data-name="${product.name}"
                        data-price="${product.price}"
                      >
                        ${product.name} - LKR : ${product.price}
                      </option>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-4">
                  <input
                    type="number"
                    class="form-control quantity-input"
                    name="quantity[]"
                    placeholder="Quantity"
                    min="1"
                    required
                  />
                </div>
                <div class="col-md-2">
                  <button type="button" class="btn btn-danger remove-product">
                    Remove
                  </button>
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-md-12">
                  <span class="product-info"></span>
                  <span class="subtotal float-right font-weight-bold"></span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <button type="button" id="addProduct" class="btn btn-info mb-3">
          Add Another Product
        </button>

        <div class="calculation-section">
          <h4>Bill Summary</h4>
          <div class="row">
            <div class="col-md-6">
              <p>
                <strong>Customer:</strong>
                <span id="selectedCustomer">Not selected</span>
              </p>
              <p>
                <strong>Account No:</strong>
                <span id="selectedAccount">Not selected</span>
              </p>
            </div>
            <div class="col-md-6">
              <p class="total-display">
                Total Amount: LKR : <span id="grandTotal">0.00</span>
              </p>
            </div>
          </div>
        </div>

        <div class="text-center mt-4">
          <button type="submit" class="btn btn-success btn-lg">
            Generate Bill
          </button>
          <a href="bill?action=list" class="btn btn-secondary">Back to Bills</a>
        </div>
        <small class="text-muted"
          >Bill will be automatically saved as a text file in your Bills
          folder</small
        >
      </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
      let productRowCount = 1;

      function updateCustomerInfo() {
        const select = document.getElementById("customerId");
        const option = select.options[select.selectedIndex];

        if (option.value) {
          document.getElementById("selectedCustomer").textContent =
            option.getAttribute("data-name");
          document.getElementById("selectedAccount").textContent =
            option.getAttribute("data-account");
        } else {
          document.getElementById("selectedCustomer").textContent =
            "Not selected";
          document.getElementById("selectedAccount").textContent =
            "Not selected";
        }
        calculateGrandTotal();
      }

      document
        .getElementById("addProduct")
        .addEventListener("click", function () {
          const productRows = document.getElementById("productRows");
          const newRow = document.querySelector(".product-row").cloneNode(true);

          newRow
            .querySelectorAll("select, input")
            .forEach((el) => (el.value = ""));
          newRow.querySelector(".product-info").textContent = "";
          newRow.querySelector(".subtotal").textContent = "";

          productRows.appendChild(newRow);
          attachEventListeners(newRow);
        });

      function attachEventListeners(row) {
        const productSelect = row.querySelector(".product-select");
        const quantityInput = row.querySelector(".quantity-input");
        const removeBtn = row.querySelector(".remove-product");

        productSelect.addEventListener("change", function () {
          updateProductRow(row);
        });

        quantityInput.addEventListener("input", function () {
          updateProductRow(row);
        });

        removeBtn.addEventListener("click", function () {
          if (document.querySelectorAll(".product-row").length > 1) {
            row.remove();
            calculateGrandTotal();
          }
        });
      }

      function updateProductRow(row) {
        const select = row.querySelector(".product-select");
        const quantityInput = row.querySelector(".quantity-input");
        const productInfo = row.querySelector(".product-info");
        const subtotalSpan = row.querySelector(".subtotal");

        if (select.value && quantityInput.value) {
          const option = select.options[select.selectedIndex];
          const price = parseFloat(option.getAttribute("data-price"));
          const quantity = parseInt(quantityInput.value);
          const subtotal = price * quantity;

          productInfo.textContent =
            option.getAttribute("data-name") +
            " - LKR : " +
            price.toFixed(2) +
            " x " +
            quantity;
          subtotalSpan.textContent = "LKR : " + subtotal.toFixed(2);
        } else {
          productInfo.textContent = "";
          subtotalSpan.textContent = "";
        }

        calculateGrandTotal();
      }

      function calculateGrandTotal() {
        let total = 0;
        document.querySelectorAll(".product-row").forEach((row) => {
          const select = row.querySelector(".product-select");
          const quantityInput = row.querySelector(".quantity-input");

          if (select.value && quantityInput.value) {
            const price = parseFloat(
              select.options[select.selectedIndex].getAttribute("data-price")
            );
            const quantity = parseInt(quantityInput.value);
            total += price * quantity;
          }
        });

        document.getElementById("grandTotal").textContent = total.toFixed(2);
      }

      document.addEventListener("DOMContentLoaded", function () {
        attachEventListeners(document.querySelector(".product-row"));
      });
    
    </script>
  </body>
</html>
