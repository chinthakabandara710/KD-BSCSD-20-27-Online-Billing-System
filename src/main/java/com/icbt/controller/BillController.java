package com.icbt.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icbt.model.Bill;
import com.icbt.model.Customer;
import com.icbt.model.Product;
import com.icbt.service.BillService;
import com.icbt.service.CustomerService;
import com.icbt.service.ProductService;

@WebServlet("/bill")
public class BillController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private BillService billService;
    private CustomerService customerService;
    private ProductService productService;
    
    public void init() throws ServletException {
        billService = BillService.getInstance();
        customerService = CustomerService.getInstance();
        productService = ProductService.getInstance();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            listBills(request, response);
        } else if (action.equals("create")) {
            showCreateForm(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("generate")) {
            generateBill(request, response);
        } else if (action.equals("delete")) {
            deleteBill(request, response);
        }
    }
    
    private void listBills(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Bill> bills = billService.getAllBills();
            request.setAttribute("bills", bills);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("WEB-INF/view/listBills.jsp").forward(request, response);
    }
    
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Customer> customers = customerService.getAllCustomers();
            List<Product> products = productService.getAllProducts();
            request.setAttribute("customers", customers);
            request.setAttribute("products", products);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("WEB-INF/view/createBill.jsp").forward(request, response);
    }
    
    private void generateBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            int unitsConsumed = Integer.parseInt(request.getParameter("unitsConsumed"));
            
            Customer customer = customerService.getCustomerById(customerId);
            Product product = productService.getProductById(productId);
            
            if (customer == null || product == null) {
                request.setAttribute("errorMessage", "Customer or Product not found");
                request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
                return;
            }
            
            double totalAmount = billService.calculateTotalAmount(product.getPrice(), unitsConsumed);
            
            Bill bill = new Bill();
            bill.setCustomerId(customer.getCustomerId());
            bill.setCustomerName(customer.getName());
            bill.setAccountNumber(customer.getAccountNumber());
            bill.setProductId(product.getProductId());
            bill.setProductName(product.getName());
            bill.setProductPrice(product.getPrice());
            bill.setUnitsConsumed(unitsConsumed);
            bill.setTotalAmount(totalAmount);
            
            billService.addBill(bill);
            billService.saveBillAsTextFile(bill);
            
        } catch (SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
            return;
        }
        response.sendRedirect("bill?action=list");
    }
    
    private void deleteBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int billId = Integer.parseInt(request.getParameter("billId"));
        try {
            billService.deleteBill(billId);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
            return;
        }
        response.sendRedirect("bill?action=list");
    }
}