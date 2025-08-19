package com.icbt.model;

import java.util.Date;

public class Bill {
    
	private int billId;
	private int customerId;
	private String customerName;
	private String accountNumber;
	private double totalAmount;
	private Date billDate;
    public Bill() {
    }
    
    public Bill(int billId, int customerId, String customerName, String accountNumber, 
                int productId, String productName, double productPrice, 
                int unitsConsumed, double totalAmount, Date billDate) {
        this.billId = billId;
        this.customerId = customerId;
        this.customerName = customerName;
        this.accountNumber = accountNumber;      
        this.totalAmount = totalAmount;
        this.billDate = billDate;
    }
    
    public int getBillId() {
        return billId;
    }
    
    public void setBillId(int billId) {
        this.billId = billId;
    }
    
    public int getCustomerId() {
        return customerId;
    }
    
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    
    public String getCustomerName() {
        return customerName;
    }
    
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    public String getAccountNumber() {
        return accountNumber;
    }
    
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
    
    
    public double getTotalAmount() {
        return totalAmount;
    }
    
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
    
    public Date getBillDate() {
        return billDate;
    }
    
    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }
}