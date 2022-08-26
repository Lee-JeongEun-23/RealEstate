package kr.or.bit.dto;

public class OfficeImage {
	private String reaId;
	private String officeImgOriginName;
	private String officeImgSaveName;
	
	public OfficeImage(String reaId, String officeImgOriginName, String officeImgSaveName) {
		super();
		this.reaId = reaId;
		this.officeImgOriginName = officeImgOriginName;
		this.officeImgSaveName = officeImgSaveName;
	}

	public String getReaId() {
		return reaId;
	}

	public void setReaId(String reaId) {
		this.reaId = reaId;
	}

	public String getOfficeImgOriginName() {
		return officeImgOriginName;
	}

	public void setOfficeImgOriginName(String officeImgOriginName) {
		this.officeImgOriginName = officeImgOriginName;
	}

	public String getOfficeImgSaveName() {
		return officeImgSaveName;
	}

	public void setOfficeImgSaveName(String officeImgSaveName) {
		this.officeImgSaveName = officeImgSaveName;
	}

	@Override
	public String toString() {
		return "OfficeImage [reaId=" + reaId + ", officeImgOriginName=" + officeImgOriginName + ", officeImgSaveName="
				+ officeImgSaveName + ", toString()=" + super.toString() + "]";
	}
	
	
}
