package com.icbt.service;

import java.sql.SQLException;
import java.util.List;

import com.icbt.dao.CustomerDAO;
import com.icbt.model.Customer;

public class CustomerService {
    
    private static CustomerService instance;
    private CustomerDAO customerDAO;
    
    private CustomerService() {
        this.customerDAO = new CustomerDAO();
    }
    
    public static CustomerService getInstance() {
        if (instance == null) {
            synchronized (CustomerService.class) {
                if (instance == null) {
                    instance = new CustomerService();
                }
            }
        }
        return instance;
    }
    
    public void addCustomer(Customer customer) throws SQLException {
        customerDAO.addCustomer(customer);
    }
    
    public List<Customer> getAllCustomers() throws SQLException {
        return customerDAO.getAllCustomers();
    }
    
    public Customer getCustomerById(int customerId) throws SQLException {
        return customerDAO.getCustomerById(customerId);
    }
    
    public void updateCustomer(Customer customer) throws SQLException {
        customerDAO.updateCustomer(customer);
    }
    
    public void deleteCustomer(int customerId) throws SQLException {
        customerDAO.deleteCustomer(customerId);
    }
}