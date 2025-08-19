package com.icbt.service;

import java.sql.SQLException;

import com.icbt.dao.UserDAO;
import com.icbt.model.User;

public class UserService {
    
    private static UserService instance;
    private UserDAO userDAO;
    
    private UserService() {
        this.userDAO = new UserDAO();
    }
    
    public static UserService getInstance() {
        if (instance == null) {
            synchronized (UserService.class) {
                if (instance == null) {
                    instance = new UserService();
                }
            }
        }
        return instance;
    }
    
    public User authenticateUser(String username, String password) throws SQLException {
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            return null;
        }
        return userDAO.authenticateUser(username.trim(), password);
    }
    
    public boolean registerUser(User user) throws SQLException {
        if (userDAO.userExists(user.getUsername())) {
            return false;
        }
        userDAO.addUser(user);
        return true;
    }
    
    public boolean isValidUser(String username, String password) {
        try {
            return authenticateUser(username, password) != null;
        } catch (SQLException e) {
            return false;
        }
    }
}