package kr.or.bit.dto;

public class GenericUser{	//일반회원 DTO
	private String userId; 
	private String userPwd;
	private String userName;
	private String frontResNum; //주민등록번호 앞자리
	private String backResNum; //주민등록번호 뒷자리
	private String userPhoneNum;
	private String userAddr; //주소
	private String userDetailAddr; //상세주소
	private String userCode; //회원 코드 
	
	public GenericUser() {}

	public GenericUser(String userId, String userPwd, String userName, String frontResNum, String backResNum,
			String userPhoneNum, String userAddr, String userDetailAddr, String userCode) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.frontResNum = frontResNum;
		this.backResNum = backResNum;
		this.userPhoneNum = userPhoneNum;
		this.userAddr = userAddr;
		this.userDetailAddr = userDetailAddr;
		this.userCode = userCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFrontResNum() {
		return frontResNum;
	}

	public void setFrontResNum(String frontResNum) {
		this.frontResNum = frontResNum;
	}

	public String getBackResNum() {
		return backResNum;
	}

	public void setBackResNum(String backResNum) {
		this.backResNum = backResNum;
	}

	public String getUserPhoneNum() {
		return userPhoneNum;
	}

	public void setUserPhoneNum(String userPhoneNum) {
		this.userPhoneNum = userPhoneNum;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getUserDetailAddr() {
		return userDetailAddr;
	}

	public void setUserDetailAddr(String userDetailAddr) {
		this.userDetailAddr = userDetailAddr;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	@Override
	public String toString() {
		return "GenericUser [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", frontResNum="
				+ frontResNum + ", backResNum=" + backResNum + ", userPhoneNum=" + userPhoneNum + ", userAddr="
				+ userAddr + ", userDetailAddr=" + userDetailAddr + ", userCode=" + userCode + ", toString()="
				+ super.toString() + "]";
	}

	
	
}
