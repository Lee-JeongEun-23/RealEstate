package kr.or.bit.dto;

public class SaleList {
	private String aptNum;
	private String size;
	private String price;
	private String saleimgnum;
	private String saleimgsavename;
	
	public SaleList() {}

	
	public SaleList(String aptNum, String size, String price, String saleimgnum, String saleimgsavename) {
		super();
		this.aptNum = aptNum;
		this.size = size;
		this.price = price;
		this.saleimgnum = saleimgnum;
		this.saleimgsavename = saleimgsavename;
	}


	public String getAptNum() {
		return aptNum;
	}


	public void setAptNum(String aptNum) {
		this.aptNum = aptNum;
	}


	public String getSize() {
		return size;
	}


	public void setSize(String size) {
		this.size = size;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getSaleimgnum() {
		return saleimgnum;
	}


	public void setSaleimgnum(String saleimgnum) {
		this.saleimgnum = saleimgnum;
	}


	public String getSaleimgsavename() {
		return saleimgsavename;
	}


	public void setSaleimgsavename(String saleimgsavename) {
		this.saleimgsavename = saleimgsavename;
	}


	@Override
	public String toString() {
		return "SaleList [aptNum=" + aptNum + ", size=" + size + ", price=" + price + ", saleimgnum=" + saleimgnum
				+ ", saleimgsavename=" + saleimgsavename + ", toString()=" + super.toString() + "]";
	}

	
	
}
