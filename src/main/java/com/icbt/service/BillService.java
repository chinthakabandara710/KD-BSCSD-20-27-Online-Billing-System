package com.icbt.service;

import java.sql.SQLException;
import java.util.List;

import com.icbt.dao.BillDAO;
import com.icbt.dao.OrderItemDAO;
import com.icbt.model.Bill;
import com.icbt.model.OrderItem;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class BillService {

	private static BillService instance;
	private BillDAO billDAO;
	private OrderItemDAO orderItemDAO;

	private BillService() {
		this.billDAO = new BillDAO();
		this.orderItemDAO = new OrderItemDAO();

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

	public void saveBillAsTextFile(Bill bill, List<OrderItem> orderItems) {
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
	            writer.println("ITEMS PURCHASED:");
	            writer.println("----------------");
	            
	            for (OrderItem item : orderItems) {
	                writer.println("Product: " + item.getProductName());
	                writer.println("Rate per Unit: LKR : " + String.format("%.2f", item.getProductPrice()));
	                writer.println("Quantity: " + item.getQuantity());
	                writer.println("Subtotal: LKR : " + String.format("%.2f", item.getSubtotal()));
	                writer.println();
	            }
	            
	            writer.println("BILLING SUMMARY:");
	            writer.println("----------------");
	            writer.println("Total Amount: LKR : " + String.format("%.2f", bill.getTotalAmount()));
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

	public void addBillWithItems(Bill bill, List<OrderItem> orderItems) throws SQLException {
		billDAO.addBill(bill);

		int billId = billDAO.getLastInsertedBillId();
		bill.setBillId(billId);

		for (OrderItem item : orderItems) {
			item.setBillId(billId);
			orderItemDAO.addOrderItem(item);
		}
	}

	public List<OrderItem> getOrderItemsByBillId(int billId) throws SQLException {
		return orderItemDAO.getOrderItemsByBillId(billId);
	}
}