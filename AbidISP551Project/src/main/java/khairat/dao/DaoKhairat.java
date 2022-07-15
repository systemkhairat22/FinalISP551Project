package khairat.dao;

import java.sql.*;
import java.util.*;
import java.util.Date;

import connectionDB.*;
import khairat.model.*;
public class DaoKhairat {
	static Connection con = null;
	static PreparedStatement ps = null;
	static java.sql.Statement st = null;
	static ResultSet rs = null;
	
	private int paymentid,memberid,transactionid;
	private double payment_amount;
	private String payment_receipt,bankname;
	private Date payment_date;
	//CREATE CASH PAYMENT
	public void cashPayment(Payment p) {
		java.util.Date utilDate = p.getPayment_date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		paymentid = p.getPaymentid();
		payment_amount = p.getPayment_amount();
		payment_receipt = p.getPayment_receipt();
		memberid = p.getMemberid();
		
		try {
			//call getConnection() method
			con = ConnectionManager.getConnection();
			
			//create statement
			ps = con.prepareStatement("INSERT INTO payment(payment_date,payment_amount,payment_receipt,memberid) values(?,?,?,?)");
			ps.setDate(1, sqlDate);
			ps.setDouble(2, payment_amount);
			ps.setString(3, payment_receipt);
			ps.setInt(4, memberid);
			//execute query
			ps.executeUpdate();
			System.out.println("Successfully inserted");
			
			//close connection
            con.close();
		}catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	//CREATE ONLINE PAYMENT
	public void onlinePayment(Payment p) {
		java.util.Date utilDate = p.getPayment_date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		paymentid = p.getPaymentid();
		payment_amount = p.getPayment_amount();
		payment_receipt = p.getPayment_receipt();
		memberid = p.getMemberid();
		transactionid = p.getTransactionid();
		bankname = p.getBankname();
		try {
			//call getConnection() method
			con = ConnectionManager.getConnection();
			
			//create statement
			ps = con.prepareStatement("INSERT INTO online (payment_date,payment_amount,payment_receipt,memberid,transactionid,bank_name) values(?,?,?,?,?,?)");
			ps.setDate(1, sqlDate);
			ps.setDouble(2, payment_amount);
			ps.setString(3, payment_receipt);
			ps.setInt(4, memberid);
			ps.setInt(5, transactionid);
			ps.setString(6, bankname);
			//execute query
			ps.executeUpdate();
			System.out.println("Successfully inserted");
			
			//close connection
            con.close();
		}catch (Exception e) {
            e.printStackTrace();
        }
	}
}
