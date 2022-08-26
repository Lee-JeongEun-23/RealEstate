 package kr.or.bit.dto;

public class REAUser {	//중개사 DTO
	private String reaId; 
	private String reaPwd;
	private String reaName;
	private String reaPhoneNum;
	private String officeName;//사무실 이름
	private String officeAddr;	//사무실 주소
	private String officeDetailAddr; //사무실 상세주소
	private String officeHp; //사무실 번호
	private String regNum; //사업자 등록번호
	private String userCode;
	
	
	public REAUser(){}


	public REAUser(String reaId, String reaPwd, String reaName, String reaPhoneNum, String officeName,
			String officeAddr, String officeDetailAddr, String officeHp, String regNum, String userCode) {
		super();
		this.reaId = reaId;
		this.reaPwd = reaPwd;
		this.reaName = reaName;
		this.reaPhoneNum = reaPhoneNum;
		this.officeName = officeName;
		this.officeAddr = officeAddr;
		this.officeDetailAddr = officeDetailAddr;
		this.officeHp = officeHp;
		this.regNum = regNum;
		this.userCode = userCode;
	}


	public String getReaId() {
		return reaId;
	}


	public void setReaId(String reaId) {
		this.reaId = reaId;
	}


	public String getReaPwd() {
		return reaPwd;
	}


	public void setReaPwd(String reaPwd) {
		this.reaPwd = reaPwd;
	}


	public String getReaName() {
		return reaName;
	}


	public void setReaName(String reaName) {
		this.reaName = reaName;
	}


	public String getReaPhoneNum() {
		return reaPhoneNum;
	}


	public void setReaPhoneNum(String reaPhoneNum) {
		this.reaPhoneNum = reaPhoneNum;
	}


	public String getOfficeName() {
		return officeName;
	}


	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}


	public String getOfficeAddr() {
		return officeAddr;
	}


	public void setOfficeAddr(String officeAddr) {
		this.officeAddr = officeAddr;
	}


	public String getOfficeDetailAddr() {
		return officeDetailAddr;
	}


	public void setOfficeDetailAddr(String officeDetailAddr) {
		this.officeDetailAddr = officeDetailAddr;
	}


	public String getOfficeHp() {
		return officeHp;
	}


	public void setOfficeHp(String officeHp) {
		this.officeHp = officeHp;
	}


	public String getRegNum() {
		return regNum;
	}


	public void setRegNum(String regNum) {
		this.regNum = regNum;
	}


	public String getUserCode() {
		return userCode;
	}


	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}


	@Override
	public String toString() {
		return "REAUser [reaId=" + reaId + ", reaPwd=" + reaPwd + ", reaName=" + reaName + ", reaPhoneNum="
				+ reaPhoneNum + ", officeName=" + officeName + ", officeAddr=" + officeAddr + ", officeDetailAddr="
				+ officeDetailAddr + ", officeHp=" + officeHp + ", regNum=" + regNum + ", userCode=" + userCode
				+ ", toString()=" + super.toString() + "]";
	}

	
	

}
