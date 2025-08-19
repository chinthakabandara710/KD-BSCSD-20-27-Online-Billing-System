package com.icbt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.icbt.model.User;
import com.icbt.service.UserService;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private UserService userService;
    
    public void init() throws ServletException {
        userService = UserService.getInstance();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("logout".equals(action)) {
            logout(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("register".equals(action)) {
            registerUser(request, response);
        } else {
            authenticateUser(request, response);
        }
    }
    
    private void authenticateUser(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            User user = userService.authenticateUser(username, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("username", user.getUsername());
                session.setAttribute("fullName", user.getFullName());
                session.setAttribute("role", user.getRole());
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error occurred");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
    private void registerUser(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String role = "user";
        
        User user = new User(username, password, fullName, email, role);
        
        try {
            if (userService.registerUser(user)) {
                request.setAttribute("successMessage", "Registration successful! Please login.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Username already exists");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error occurred");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
    
    private void logout(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("login.jsp");
    }
}