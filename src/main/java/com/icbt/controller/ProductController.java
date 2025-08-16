package com.icbt.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icbt.model.Product;
import com.icbt.service.ProductService;



@WebServlet("/product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductService productService;
     
	public void init() throws ServletException {
        productService = ProductService.getInstance();
    }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            listProducts(request, response);
        } else if (action.equals("add")) {
            showAddForm(request, response);
        } else if (action.equals("edit")) {
            showEditForm(request, response);
        }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String action = request.getParameter("action");
	        if (action.equals("add")) {
	            addProduct(request, response);
	        }else if (action.equals("delete")) {  
	            deleteProduct(request, response);
	        } else if (action.equals("update")) {
	            updateProduct(request, response);
	        }
	}
	
	 private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	    	List<Product> productList = new ArrayList<Product>();
			try {
				productList = productService.getAllProducts();
				request.setAttribute("products", productList);
			} catch ( SQLException e) {
				request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
	            return;
			}
	    	
	        request.getRequestDispatcher("WEB-INF/view/listProducts.jsp").forward(request, response);
	    }

	    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.getRequestDispatcher("WEB-INF/view/addProduct.jsp").forward(request, response);
	    }
	    
	    
	    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int productId = Integer.parseInt(request.getParameter("productId"));
	        try {
	            Product product = productService.getProductById(productId);
	            request.setAttribute("product", product);
	            request.getRequestDispatcher("WEB-INF/view/editProduct.jsp").forward(request, response);
	        } catch (SQLException e) {
	            request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
	        }
	    }

	    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String name = request.getParameter("name");
	        double price = Double.parseDouble(request.getParameter("price"));
	        String description = request.getParameter("description");
	        Product product = new Product();
	        product.setName(name);
	        product.setPrice(price);
	        product.setDescription(description);
	        productService.addProduct(product);
	        response.sendRedirect("product?action=list");
	    }
	    
	    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int productId = Integer.parseInt(request.getParameter("productId"));
	        try {
	            productService.deleteProduct(productId);
	        } catch ( SQLException e) {
	            request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
	            return;
	        }
	        response.sendRedirect("product?action=list");
	    }
	    
	    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int productId = Integer.parseInt(request.getParameter("productId"));
	        String name = request.getParameter("name");
	        double price = Double.parseDouble(request.getParameter("price"));
	        String description = request.getParameter("description");
	        
	        Product product = new Product();
	        product.setProductId(productId);
	        product.setName(name);
	        product.setPrice(price);
	        product.setDescription(description);
	        
	        try {
	            productService.updateProduct(product);
	        } catch (SQLException e) {
	            request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
	            return;
	        }
	        response.sendRedirect("product?action=list");
	    }
	    

}
