package com.icbt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.icbt.model.OrderItem;

public class OrderItemDAO {
    
    public void addOrderItem(OrderItem orderItem) throws SQLException {
        String query = "INSERT INTO order_items (billId, productId, productName, productPrice, quantity, subtotal) VALUES (?, ?, ?, ?, ?, ?)";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, orderItem.getBillId());
        statement.setInt(2, orderItem.getProductId());
        statement.setString(3, orderItem.getProductName());
        statement.setDouble(4, orderItem.getProductPrice());
        statement.setInt(5, orderItem.getQuantity());
        statement.setDouble(6, orderItem.getSubtotal());
        statement.executeUpdate();
    }
    
    public List<OrderItem> getOrderItemsByBillId(int billId) throws SQLException {
        List<OrderItem> orderItems = new ArrayList<>();
        String query = "SELECT * FROM order_items WHERE billId = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, billId);
        ResultSet resultSet = statement.executeQuery();
        
        while (resultSet.next()) {
            OrderItem item = new OrderItem(
                resultSet.getInt("orderItemId"),
                resultSet.getInt("billId"),
                resultSet.getInt("productId"),
                resultSet.getString("productName"),
                resultSet.getDouble("productPrice"),
                resultSet.getInt("quantity"),
                resultSet.getDouble("subtotal")
            );
            orderItems.add(item);
        }
        return orderItems;
    }
}