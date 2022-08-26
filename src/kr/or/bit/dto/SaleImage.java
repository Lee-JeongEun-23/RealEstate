package kr.or.bit.dto;


public class SaleImage { //매물이미지
	private String saleImgOriginName1; //매물사진 원본 파일명1
	private String saleImgSaveName1; //매물사진 저장 파일명1
	private String saleImgOriginName2; //매물사진 원본 파일명2
	private String saleImgSaveName2; //매물사진 저장 파일명2
	private String saleImgOriginName3; //매물사진 원본 파일명3
	private String saleImgSaveName3; //매물사진 저장 파일명3

	private String aptNum; //매물번호

	
	public SaleImage() {}


	public SaleImage(String saleImgOriginName1, String saleImgSaveName1, String saleImgOriginName2,
			String saleImgSaveName2, String saleImgOriginName3, String saleImgSaveName3, String aptNum) {
		super();
		this.saleImgOriginName1 = saleImgOriginName1;
		this.saleImgSaveName1 = saleImgSaveName1;
		this.saleImgOriginName2 = saleImgOriginName2;
		this.saleImgSaveName2 = saleImgSaveName2;
		this.saleImgOriginName3 = saleImgOriginName3;
		this.saleImgSaveName3 = saleImgSaveName3;
		this.aptNum = aptNum;
	}


	public String getSaleImgOriginName1() {
		return saleImgOriginName1;
	}


	public void setSaleImgOriginName1(String saleImgOriginName1) {
		this.saleImgOriginName1 = saleImgOriginName1;
	}


	public String getSaleImgSaveName1() {
		return saleImgSaveName1;
	}


	public void setSaleImgSaveName1(String saleImgSaveName1) {
		this.saleImgSaveName1 = saleImgSaveName1;
	}


	public String getSaleImgOriginName2() {
		return saleImgOriginName2;
	}


	public void setSaleImgOriginName2(String saleImgOriginName2) {
		this.saleImgOriginName2 = saleImgOriginName2;
	}


	public String getSaleImgSaveName2() {
		return saleImgSaveName2;
	}


	public void setSaleImgSaveName2(String saleImgSaveName2) {
		this.saleImgSaveName2 = saleImgSaveName2;
	}


	public String getSaleImgOriginName3() {
		return saleImgOriginName3;
	}


	public void setSaleImgOriginName3(String saleImgOriginName3) {
		this.saleImgOriginName3 = saleImgOriginName3;
	}


	public String getSaleImgSaveName3() {
		return saleImgSaveName3;
	}


	public void setSaleImgSaveName3(String saleImgSaveName3) {
		this.saleImgSaveName3 = saleImgSaveName3;
	}


	public String getAptNum() {
		return aptNum;
	}


	public void setAptNum(String aptNum) {
		this.aptNum = aptNum;
	}


	@Override
	public String toString() {
		return "SaleImage [saleImgOriginName1=" + saleImgOriginName1 + ", saleImgSaveName1=" + saleImgSaveName1
				+ ", saleImgOriginName2=" + saleImgOriginName2 + ", saleImgSaveName2=" + saleImgSaveName2
				+ ", saleImgOriginName3=" + saleImgOriginName3 + ", saleImgSaveName3=" + saleImgSaveName3 + ", aptNum="
				+ aptNum + ", toString()=" + super.toString() + "]";
	}
	

}
