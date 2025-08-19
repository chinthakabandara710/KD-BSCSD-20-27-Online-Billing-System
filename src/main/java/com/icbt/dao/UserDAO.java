package com.icbt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.icbt.model.User;

public class UserDAO {
    
    public User authenticateUser(String username, String password) throws SQLException {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, username);
        statement.setString(2, hashPassword(password));
        
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            int userId = resultSet.getInt("userId");
            String dbUsername = resultSet.getString("username");
            String dbPassword = resultSet.getString("password");
            String fullName = resultSet.getString("fullName");
            String email = resultSet.getString("email");
            String role = resultSet.getString("role");
            
            return new User(userId, dbUsername, dbPassword, fullName, email, role);
        }
        return null;
    }
    
    public boolean userExists(String username) throws SQLException {
        String query = "SELECT COUNT(*) FROM users WHERE username = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, username);
        
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            return resultSet.getInt(1) > 0;
        }
        return false;
    }
    
    public void addUser(User user) throws SQLException {
        String query = "INSERT INTO users (username, password, fullName, email, role) VALUES (?, ?, ?, ?, ?)";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, user.getUsername());
        statement.setString(2, hashPassword(user.getPassword()));
        statement.setString(3, user.getFullName());
        statement.setString(4, user.getEmail());
        statement.setString(5, user.getRole());
        statement.executeUpdate();
    }
    
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}