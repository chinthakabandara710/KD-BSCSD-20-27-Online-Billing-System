package com.icbt.service;

import java.sql.SQLException;
import java.util.List;

import com.icbt.dao.ProductDAO;
import com.icbt.model.Product;

public class ProductServiceV1 {
	private static ProductServiceV1 instance;
	private ProductDAO productDAO;
	
	private ProductServiceV1()
	{
		this.productDAO = productDAO;
	}
	
	public static ProductServiceV1 getInstance()
	{
		if(instance == null)
		{
			synchronized (ProductServiceV1.class) {
				if(instance == null)
				{
					instance = new ProductServiceV1();
				}
				
			}
		}
		return instance;
	}
	
	public void addProduct(Product product)
	{
		productDAO.addProduct(product);
	}
	
	public List<Product> getAllProducts() throws SQLException
	{
		return productDAO.getAllProducts();
	}

}
