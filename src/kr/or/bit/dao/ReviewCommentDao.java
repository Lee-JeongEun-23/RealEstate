package kr.or.bit.dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.ReviewComment;

public class ReviewCommentDao {
	/*
	 * 작성자 : 공인중개사 리뷰 댓글 쓰기, 댓글 가져오기, 댓글 수정, 댓글 삭제
	 */
	DataSource ds = null;

	public ReviewCommentDao() throws NamingException {
	      Context context = new InitialContext();
	      ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	   }

	public int insertReviewCom(ReviewComment reviewcom) { // 댓글 쓰기
		return 0;
	}

	public ReviewComment getReviewComData(int reviewNum) { // 리뷰 글번호로 댓글 가져오기
		return null;
	}

	public int updateReviewCom(ReviewComment reviewcom) { // 댓글 수정
		return 0;
	}

	public int deleteReviewCom(int comNum) { // 댓글 삭제(댓글 번호로)
		return 0;
	}
}
