package kr.or.bit.dto;

import java.util.Arrays;

public class REAImage {					//중개사 이미지 DTO
	private String reaId;						//중개사 아이디
	private String reaImgOriginName;	//중개사 이미지 원본 파일명
	private String reaImgSaveName;		//중개사 이미지 저장 파일명
	
	
	public REAImage() {}


	public REAImage(String reaId, String reaImgOriginName, String reaImgSaveName) {
		super();
		this.reaId = reaId;
		this.reaImgOriginName = reaImgOriginName;
		this.reaImgSaveName = reaImgSaveName;
	}


	public String getReaId() {
		return reaId;
	}


	public void setReaId(String reaId) {
		this.reaId = reaId;
	}


	public String getReaImgOriginName() {
		return reaImgOriginName;
	}


	public void setReaImgOriginName(String reaImgOriginName) {
		this.reaImgOriginName = reaImgOriginName;
	}


	public String getReaImgSaveName() {
		return reaImgSaveName;
	}


	public void setReaImgSaveName(String reaImgSaveName) {
		this.reaImgSaveName = reaImgSaveName;
	}


	@Override
	public String toString() {
		return "REAImage [reaId=" + reaId + ", reaImgOriginName=" + reaImgOriginName + ", reaImgSaveName="
				+ reaImgSaveName + ", toString()=" + super.toString() + "]";
	}


	
	
}
