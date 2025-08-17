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
	    String query = "INSERT INTO bill (customerId, customerName, accountNumber, totalAmount, billDate) VALUES (?, ?, ?, ?, NOW())";
	    
	    Connection connection = DBConnectionFactory.getConnection();
	    PreparedStatement statement = connection.prepareStatement(query);
	    statement.setInt(1, bill.getCustomerId());
	    statement.setString(2, bill.getCustomerName());
	    statement.setString(3, bill.getAccountNumber());
	    statement.setDouble(4, bill.getTotalAmount());
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
	        double totalAmount = resultSet.getDouble("totalAmount");
	        java.util.Date billDate = resultSet.getTimestamp("billDate");
	        
	        bills.add(new Bill(billId, customerId, customerName, accountNumber, customerId, accountNumber, totalAmount, customerId, totalAmount, billDate));
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
	        double totalAmount = resultSet.getDouble("totalAmount");
	        java.util.Date billDate = resultSet.getTimestamp("billDate");
	        
	        return new Bill(id, customerId, customerName, accountNumber, customerId, accountNumber, totalAmount, customerId, totalAmount, billDate);
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
    
    public int getLastInsertedBillId() throws SQLException {
        String query = "SELECT LAST_INSERT_ID()";
        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        
        if (resultSet.next()) {
            return resultSet.getInt(1);
        }
        return 0;
    }
}