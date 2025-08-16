package com.icbt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.icbt.model.Customer;

public class CustomerDAO {
    
    public void addCustomer(Customer customer) throws SQLException {
        String query = "INSERT INTO customer (accountNumber, name, address, telephone, unitsConsumed) VALUES (?, ?, ?, ?, ?)";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, customer.getAccountNumber());
        statement.setString(2, customer.getName());
        statement.setString(3, customer.getAddress());
        statement.setString(4, customer.getTelephone());
        statement.setInt(5, customer.getUnitsConsumed());
        statement.executeUpdate();
    }
    
    public List<Customer> getAllCustomers() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        String query = "SELECT * FROM customer";
        
        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        
        while (resultSet.next()) {
            int id = resultSet.getInt("customerId");
            String accountNumber = resultSet.getString("accountNumber");
            String name = resultSet.getString("name");
            String address = resultSet.getString("address");
            String telephone = resultSet.getString("telephone");
            int unitsConsumed = resultSet.getInt("unitsConsumed");
            customers.add(new Customer(id, accountNumber, name, address, telephone, unitsConsumed));
        }
        return customers;
    }
    
    public Customer getCustomerById(int customerId) throws SQLException {
        String query = "SELECT * FROM customer WHERE customerId = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, customerId);
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            int id = resultSet.getInt("customerId");
            String accountNumber = resultSet.getString("accountNumber");
            String name = resultSet.getString("name");
            String address = resultSet.getString("address");
            String telephone = resultSet.getString("telephone");
            int unitsConsumed = resultSet.getInt("unitsConsumed");
            return new Customer(id, accountNumber, name, address, telephone, unitsConsumed);
        }
        return null;
    }
    
    public void updateCustomer(Customer customer) throws SQLException {
        String query = "UPDATE customer SET accountNumber = ?, name = ?, address = ?, telephone = ?, unitsConsumed = ? WHERE customerId = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, customer.getAccountNumber());
        statement.setString(2, customer.getName());
        statement.setString(3, customer.getAddress());
        statement.setString(4, customer.getTelephone());
        statement.setInt(5, customer.getUnitsConsumed());
        statement.setInt(6, customer.getCustomerId());
        statement.executeUpdate();
    }
    
    public void deleteCustomer(int customerId) throws SQLException {
        String query = "DELETE FROM customer WHERE customerId = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, customerId);
        statement.executeUpdate();
    }
}