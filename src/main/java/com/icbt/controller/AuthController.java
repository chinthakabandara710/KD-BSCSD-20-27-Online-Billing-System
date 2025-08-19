package com.icbt.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthController implements Filter {
    
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        
        boolean isLoginRequest = requestURI.equals(contextPath + "/login") || 
                                requestURI.equals(contextPath + "/login.jsp") ||
                                requestURI.equals(contextPath + "/register.jsp");
        
        boolean isStaticResource = requestURI.contains("/css/") || 
                                  requestURI.contains("/js/") || 
                                  requestURI.contains("/images/");
        
        boolean isLoggedIn = session != null && session.getAttribute("user") != null;
        
        if (isLoggedIn || isLoginRequest || isStaticResource) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect(contextPath + "/login.jsp");
        }
    }
    
    public void destroy() {
    }
}