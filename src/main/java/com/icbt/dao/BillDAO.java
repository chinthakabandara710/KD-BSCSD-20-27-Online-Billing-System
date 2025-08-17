package com.icbt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.icbt.model.Bill;

public class BillDAO {
    
    public void addBill(Bill bill) throws SQLException {
        String query = "INSERT INTO bill (customerId, customerName, accountNumber, productId, productName, productPrice, unitsConsumed, totalAmount, billDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, bill.getCustomerId());
        statement.setString(2, bill.getCustomerName());
        statement.setString(3, bill.getAccountNumber());
        statement.setInt(4, bill.getProductId());
        statement.setString(5, bill.getProductName());
        statement.setDouble(6, bill.getProductPrice());
        statement.setInt(7, bill.getUnitsConsumed());
        statement.setDouble(8, bill.getTotalAmount());
        statement.executeUpdate();
    }
    
    public List<Bill> getAllBills() throws SQLException {
        List<Bill> bills = new ArrayList<>();
        String query = "SELECT * FROM bill ORDER BY billDate DESC";
        
        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        
        while (resultSet.next()) {
            int billId = resultSet.getInt("billId");
            int customerId = resultSet.getInt("customerId");
            String customerName = resultSet.getString("customerName");
            String accountNumber = resultSet.getString("accountNumber");
            int productId = resultSet.getInt("productId");
            String productName = resultSet.getString("productName");
            double productPrice = resultSet.getDouble("productPrice");
            int unitsConsumed = resultSet.getInt("unitsConsumed");
            double totalAmount = resultSet.getDouble("totalAmount");
            java.util.Date billDate = resultSet.getTimestamp("billDate");
            
            bills.add(new Bill(billId, customerId, customerName, accountNumber, 
                             productId, productName, productPrice, unitsConsumed, 
                             totalAmount, billDate));
        }
        return bills;
    }
    
    public Bill getBillById(int billId) throws SQLException {
        String query = "SELECT * FROM bill WHERE billId = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, billId);
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            int id = resultSet.getInt("billId");
            int customerId = resultSet.getInt("customerId");
            String customerName = resultSet.getString("customerName");
            String accountNumber = resultSet.getString("accountNumber");
            int productId = resultSet.getInt("productId");
            String productName = resultSet.getString("productName");
            double productPrice = resultSet.getDouble("productPrice");
            int unitsConsumed = resultSet.getInt("unitsConsumed");
            double totalAmount = resultSet.getDouble("totalAmount");
            java.util.Date billDate = resultSet.getTimestamp("billDate");
            
            return new Bill(id, customerId, customerName, accountNumber, 
                          productId, productName, productPrice, unitsConsumed, 
                          totalAmount, billDate);
        }
        return null;
    }
    
    public void deleteBill(int billId) throws SQLException {
        String query = "DELETE FROM bill WHERE billId = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, billId);
        statement.executeUpdate();
    }
}