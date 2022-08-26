package kr.or.bit.dto;

import java.util.Date;

public class Contract {		//계약서 DTO
	private String aptNum;	//매물번호
	private Date conDate;		//계약날짜
	private String conPrice;	//계약금
	private String midPrice;	//중도금
	private String balance;	//잔금
	
	public Contract() {}

	public Contract(String aptNum, Date conDate, String conPrice, String midPrice, String balance) {
		super();
		this.aptNum = aptNum;
		this.conDate = conDate;
		this.conPrice = conPrice;
		this.midPrice = midPrice;
		this.balance = balance;
	}

	public String getAptNum() {
		return aptNum;
	}

	public void setAptNum(String aptNum) {
		this.aptNum = aptNum;
	}

	public Date getConDate() {
		return conDate;
	}

	public void setConDate(Date conDate) {
		this.conDate = conDate;
	}

	public String getConPrice() {
		return conPrice;
	}

	public void setConPrice(String conPrice) {
		this.conPrice = conPrice;
	}

	public String getMidPrice() {
		return midPrice;
	}

	public void setMidPrice(String midPrice) {
		this.midPrice = midPrice;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "Contract [aptNum=" + aptNum + ", conDate=" + conDate + ", conPrice=" + conPrice + ", midPrice="
				+ midPrice + ", balance=" + balance + ", toString()=" + super.toString() + "]";
	}
	
	
}
