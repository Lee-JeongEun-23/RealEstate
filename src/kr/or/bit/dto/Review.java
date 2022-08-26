package kr.or.bit.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Review {				//후기 DTO
	private int reviewNum;			//후기 번호
	private String userId;			//후기 작성자 아이디
	private String reviewContent;	//후기 내용
	private String reviewDate;		//후기 작성 시간
	private String reaId;			//공인중개사 아이디
	
	public Review() {}
	
	public Review(int reviewNum, String userId, String reviewContent, String reviewDate, String reaId) {
		super();
		this.reviewNum = reviewNum;
		this.userId = userId;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reaId = reaId;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd");
		this.reviewDate = sdf.format(reviewDate);
	}

	public String getReaId() {
		return reaId;
	}

	public void setReaId(String reaId) {
		this.reaId = reaId;
	}

	@Override
	public String toString() {
		return "Review [reviewNum=" + reviewNum + ", userId=" + userId + ", reviewContent=" + reviewContent
				+ ", reviewDate=" + reviewDate + ", reaId=" + reaId + "]";
	}

}

