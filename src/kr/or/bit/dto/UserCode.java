package kr.or.bit.dto;

public class UserCode {
	private String userCode;
	private String userType;
	
	public UserCode() {}

	public UserCode(String userCode, String userType) {
		super();
		this.userCode = userCode;
		this.userType = userType;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "UserCode [userCode=" + userCode + ", userType=" + userType + ", toString()=" + super.toString() + "]";
	}

	
	
	
}
