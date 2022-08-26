package kr.or.bit.dto;

public class Admin {
	private String adminId;
	private String adminPwd;
	private String userCode;
	
	public Admin() {}
	
	public Admin(String adminId, String adminPwd, String userCode) {
		super();
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		this.userCode = userCode;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminPwd=" + adminPwd + ", userCode=" + userCode + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
