package com.icbt.service;

import java.sql.SQLException;
import java.util.regex.Pattern;

import com.icbt.dao.UserDAO;
import com.icbt.model.User;

public class UserService {

    private static UserService instance;
    private UserDAO userDAO;
    

    private static final Pattern EMAIL_PATTERN = Pattern.compile(
        "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
    );
    
   
    private static final Pattern PASSWORD_PATTERN = Pattern.compile(
        "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
    );

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

    public boolean registerUser(User user) throws SQLException, IllegalArgumentException {
       
    	validateUserRegistration(user);
        
        if (userDAO.userExists(user.getUsername())) {
            throw new IllegalArgumentException("Username already exists");
        }
       
        
        userDAO.addUser(user);
        return true;
    }

    public boolean isValidUser(String username, String password) {
        try {
            return authenticateUser(username, password) != null;
        } catch (SQLException e) {
         
            System.err.println("Database error during authentication: " + e.getMessage());
            return false;
        }
    }

    public void validateUserRegistration(User user) throws IllegalArgumentException {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }

   
        if (user.getUsername() == null || user.getUsername().trim().isEmpty()) {
            throw new IllegalArgumentException("Username is required");
        }
        
        if (user.getUsername().trim().length() < 3) {
            throw new IllegalArgumentException("Username must be at least 3 characters long");
        }
        
        if (user.getUsername().trim().length() > 50) {
            throw new IllegalArgumentException("Username cannot exceed 50 characters");
        }
       
        if (!user.getUsername().trim().matches("^[a-zA-Z0-9_]+$")) {
            throw new IllegalArgumentException("Username can only contain letters, numbers, and underscores");
        }

     
        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            throw new IllegalArgumentException("Password is required");
        }
        
        if (user.getPassword().length() < 8) {
            throw new IllegalArgumentException("Password must be at least 8 characters long");
        }
        
        if (user.getPassword().length() > 128) {
            throw new IllegalArgumentException("Password cannot exceed 128 characters");
        }
        
        
        if (!PASSWORD_PATTERN.matcher(user.getPassword()).matches()) {
            throw new IllegalArgumentException("Password must contain at least one letter, one number, and one special character (@$!%*?&)");
        }


        if (user.getEmail() == null || user.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email is required");
        }
        
        if (!EMAIL_PATTERN.matcher(user.getEmail().trim()).matches()) {
            throw new IllegalArgumentException("Please enter a valid email address");
        }
        
        if (user.getEmail().trim().length() > 100) {
            throw new IllegalArgumentException("Email cannot exceed 100 characters");
        }

       
        if (user.getFullName() == null || user.getFullName().trim().isEmpty()) {
            throw new IllegalArgumentException("Full name is required");
        }
        
        if (user.getFullName().trim().length() < 2) {
            throw new IllegalArgumentException("Full name must be at least 2 characters long");
        }
        
        if (user.getFullName().trim().length() > 100) {
            throw new IllegalArgumentException("Full name cannot exceed 100 characters");
        }
        

        if (!user.getFullName().trim().matches("^[a-zA-Z\\s\\-']+$")) {
            throw new IllegalArgumentException("Full name can only contain letters, spaces, hyphens, and apostrophes");
        }
    }
    

    public boolean isUsernameAvailable(String username) throws SQLException {
        if (username == null || username.trim().isEmpty()) {
            return false;
        }
        return !userDAO.userExists(username.trim());
    }
    
 
    public boolean isValidEmailFormat(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        return EMAIL_PATTERN.matcher(email.trim()).matches();
    }
}