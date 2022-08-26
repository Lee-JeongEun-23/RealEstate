package kr.or.bit.dto;

import java.util.Date;

public class BookMark {
	private String userId; //아이디 
	private String aptNum; //매물번호
	private Date bookDate; //북마크 등록 날짜
	private String aptSize; //면적
	private String type; //거래유형
	private String aptName; //아파트 이름
	private String price; //거래금액
	private String saleImgSaveName1; //아파트 사진
	
	public BookMark() {}
	
	public BookMark(String userId, String aptNum, Date bookDate, String aptSize, String type, String aptName, 
			String price, String saleImgSaveName1) {
		super();
		this.userId = userId;
		this.aptNum = aptNum;
		this.bookDate = bookDate;
		this.aptSize = aptSize;
		this.type = type;
		this.aptName = aptName;
		this.price = price;
		this.saleImgSaveName1 = saleImgSaveName1;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAptNum() {
		return aptNum;
	}

	public void setAptNum(String aptNum) {
		this.aptNum = aptNum;
	}

	public Date getBookDate() {
		return bookDate;
	}

	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}

	public String getAptSize() {
		return aptSize;
	}

	public void setAptSize(String aptSize) {
		this.aptSize = aptSize;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSaleImgSaveName1() {
		return saleImgSaveName1;
	}

	public void setSaleImgSaveName1(String saleImgSaveName1) {
		this.saleImgSaveName1 = saleImgSaveName1;
	}

	@Override
	public String toString() {
		return "BookMark [userId=" + userId + ", aptNum=" + aptNum + ", bookDate=" + bookDate + ", aptSize=" + aptSize
				+ ", type=" + type + ", aptName=" + aptName + ", price=" + price + ", saleImgSaveName1="
				+ saleImgSaveName1 + "]";
	}

	

	
}
