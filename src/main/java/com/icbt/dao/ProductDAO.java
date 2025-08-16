package com.icbt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.icbt.model.Product;

public class ProductDAO {
	public void addProduct(Product product) {
        String query = "INSERT INTO product (name, price, description) VALUES (?, ?, ?)";

        try 
        {   Connection connection = DBConnectionFactory.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.executeUpdate();
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM product";

        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) 
        {
        	int id = resultSet.getInt("productid");
        	String name = resultSet.getString("name");
        	double price = resultSet.getDouble("price");
        	String desc = resultSet.getString("description");
        	products.add(new Product(id, name, desc, price));
        }

        return products;
    }
    
    public void deleteProduct(int productId) throws SQLException {
        String query = "DELETE FROM product WHERE productid = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, productId);
        statement.executeUpdate();
    }
    
    public Product getProductById(int productId) throws SQLException {
        String query = "SELECT * FROM product WHERE productid = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, productId);
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            int id = resultSet.getInt("productid");
            String name = resultSet.getString("name");
            double price = resultSet.getDouble("price");
            String desc = resultSet.getString("description");
            return new Product(id, name, desc, price);
        }
        return null;
    }
    
    
    public void updateProduct(Product product) throws SQLException {
        String query = "UPDATE product SET name = ?, price = ?, description = ? WHERE productid = ?";
        
        Connection connection = DBConnectionFactory.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, product.getName());
        statement.setDouble(2, product.getPrice());
        statement.setString(3, product.getDescription());
        statement.setInt(4, product.getProductId());
        statement.executeUpdate();
    }
}