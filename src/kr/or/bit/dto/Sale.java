package kr.or.bit.dto;

public class Sale { //매물
	private String aptNum; //매물번호
	private String aptSize; //면적
	private String type; //거래유형
	private String addr; //지번주소
	private String roadAddr; //도로명주소
	private String aptName; //아파트 이름
	private String aptDong; //동
	private String aptHo; //호	
	private String price; //거래금액
	private String direction; //향
	private String etc; //매물 특징
	private String isContract; //계약 여부
	private String id; //공인중개사 아이디
	
	public Sale() {}
	
	public Sale(String aptNum, String aptSize, String type, String addr, String roadAddr, String aptName,
			String aptDong, String aptHo, String price, String direction, String etc, String isContract, String id) {
		super();
		this.aptNum = aptNum;
		this.aptSize = aptSize;
		this.type = type;
		this.addr = addr;
		this.roadAddr = roadAddr;
		this.aptName = aptName;
		this.aptDong = aptDong;
		this.aptHo = aptHo;
		this.price = price;
		this.direction = direction;
		this.etc = etc;
		this.isContract = isContract;
		this.id = id;
	}

	public String getAptNum() {
		return aptNum;
	}

	public void setAptNum(String aptNum) {
		this.aptNum = aptNum;
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

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public String getAptDong() {
		return aptDong;
	}

	public void setAptDong(String aptDong) {
		this.aptDong = aptDong;
	}

	public String getAptHo() {
		return aptHo;
	}

	public void setAptHo(String aptHo) {
		this.aptHo = aptHo;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getIsContract() {
		return isContract;
	}

	public void setIsContract(String isContract) {
		this.isContract = isContract;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getRoadAddr() {
		return roadAddr;
	}

	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}

	@Override
	public String toString() {
		return "Sale [aptNum=" + aptNum + ", aptSize=" + aptSize + ", type=" + type + ", addr=" + addr + ", roadAddr="
				+ roadAddr + ", aptName=" + aptName + ", aptDong=" + aptDong + ", aptHo=" + aptHo + ", price=" + price
				+ ", direction=" + direction + ", etc=" + etc + ", isContract=" + isContract + ", id=" + id + "]";
	}
	
	
}
