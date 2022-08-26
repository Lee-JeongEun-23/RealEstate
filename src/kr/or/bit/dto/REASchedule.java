package kr.or.bit.dto;

import java.util.Date;

public class REASchedule { //공인중개사 매물 일정 관리
	private int scheNum; //일정번호
	private Date scheDate; //일정 날짜
	private String content; //내용
	private String reaId; //공인중개사 아이디
	
	public REASchedule() {}

	public REASchedule(int scheNum, Date scheDate, String content, String reaId) {
		super();
		this.scheNum = scheNum;
		this.scheDate = scheDate;
		this.content = content;
		this.reaId = reaId;
	}

	public int getScheNum() {
		return scheNum;
	}

	public void setScheNum(int scheNum) {
		this.scheNum = scheNum;
	}

	public Date getScheDate() {
		return scheDate;
	}

	public void setScheDate(Date scheDate) {
		this.scheDate = scheDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReaId() {
		return reaId;
	}

	public void setReaId(String reaId) {
		this.reaId = reaId;
	}

	@Override
	public String toString() {
		return "REASchedule [scheNum=" + scheNum + ", scheDate=" + scheDate + ", content=" + content + ", reaId="
				+ reaId + "]";
	}
	
	
	
}
