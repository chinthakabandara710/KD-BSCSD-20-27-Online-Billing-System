package com.icbt.service;

import java.sql.SQLException;
import java.util.List;

import com.icbt.dao.BillDAO;
import com.icbt.model.Bill;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class BillService {
    
    private static BillService instance;
    private BillDAO billDAO;
    
    private BillService() {
        this.billDAO = new BillDAO();
    }
    
    public static BillService getInstance() {
        if (instance == null) {
            synchronized (BillService.class) {
                if (instance == null) {
                    instance = new BillService();
                }
            }
        }
        return instance;
    }
    
    public void addBill(Bill bill) throws SQLException {
        billDAO.addBill(bill);
    }
    
    public List<Bill> getAllBills() throws SQLException {
        return billDAO.getAllBills();
    }
    
    public Bill getBillById(int billId) throws SQLException {
        return billDAO.getBillById(billId);
    }
    
    public void deleteBill(int billId) throws SQLException {
        billDAO.deleteBill(billId);
    }
    
    public double calculateTotalAmount(double productPrice, int unitsConsumed) {
        return productPrice * unitsConsumed;
    }
    public void saveBillAsTextFile(Bill bill) {
        try {
            String fileName = "Bill_" + bill.getAccountNumber() + "_" + 
                             new java.text.SimpleDateFormat("yyyyMMdd_HHmmss").format(new java.util.Date()) + ".txt";
            
            String filePath = System.getProperty("user.home") + File.separator + "Bills" + File.separator + fileName;
            
            File directory = new File(System.getProperty("user.home") + File.separator + "Bills");
            if (!directory.exists()) {
                directory.mkdirs();
            }
            
            try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
                writer.println("===============================================");
                writer.println("              PAHANA EDU BOOKSHOP BILL");
                writer.println("===============================================");
                writer.println();
                writer.println("Bill ID: " + bill.getBillId());
                writer.println("Date: " + new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
                writer.println();
                writer.println("CUSTOMER DETAILS:");
                writer.println("-----------------");
                writer.println("Account Number: " + bill.getAccountNumber());
                writer.println("Customer Name: " + bill.getCustomerName());
                writer.println();
                writer.println("SERVICE DETAILS:");
                writer.println("----------------");
                writer.println("Service: " + bill.getProductName());
                writer.println("Rate per Unit: $" + String.format("%.2f", bill.getProductPrice()));
                writer.println("Units Consumed: " + bill.getUnitsConsumed());
                writer.println();
                writer.println("BILLING CALCULATION:");
                writer.println("--------------------");
                writer.println("Rate per Unit: $" + String.format("%.2f", bill.getProductPrice()));
                writer.println("Units Consumed: " + bill.getUnitsConsumed());
                writer.println("Total Amount: $" + String.format("%.2f", bill.getTotalAmount()));
                writer.println();
                writer.println("===============================================");
                writer.println("           Thank you for your business!");
                writer.println("===============================================");
            }
            
            System.out.println("Bill saved as: " + filePath);
            
        } catch (IOException e) {
            System.err.println("Error saving bill to file: " + e.getMessage());
            e.printStackTrace();
        }
    }
}