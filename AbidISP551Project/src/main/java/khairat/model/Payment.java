package khairat.model;

import java.util.Date;

public class Payment {
	private int paymentid;
	private Date payment_date;
	private double payment_amount;
	private String payment_receipt;
	private int memberid;
	private int transactionid;
	private String bankname;
	
	public Payment() {
		
	}
	public int getPaymentid() {
		return paymentid;
	}
	public void setPaymentid(int paymentid) {
		this.paymentid = paymentid;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public double getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(double payment_amount) {
		this.payment_amount = payment_amount;
	}
	public String getPayment_receipt() {
		return payment_receipt;
	}
	public void setPayment_receipt(String payment_receipt) {
		this.payment_receipt = payment_receipt;
	}
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public int getTransactionid() {
		return transactionid;
	}
	public void setTransactionid(int transactionid) {
		this.transactionid = transactionid;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
}
