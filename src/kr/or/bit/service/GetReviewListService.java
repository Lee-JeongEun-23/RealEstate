package kr.or.bit.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.REAImageDao;
import kr.or.bit.dao.REAUserDao;
import kr.or.bit.dao.ReviewDao;
import kr.or.bit.dto.REAImage;
import kr.or.bit.dto.REAUser;
import kr.or.bit.dto.Review;

public class GetReviewListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		REAUserDao readao = null;
		REAUser reaUser = null;
		HttpSession session = request.getSession();
		String reaId = (String) session.getAttribute("reaUserId");
		ReviewDao rvdao = null;
		List<Review> reviewList = null;
		
		try {
			forward = new ActionForward();
			readao = new REAUserDao();
			reaUser = new REAUser();
			reaUser = readao.getREAMypage(reaId);
			rvdao = new ReviewDao();
			reviewList = new ArrayList<Review>();
			reviewList = rvdao.getReviewList(reaId);
			request.setAttribute("reaId", reaId);
			if (reaUser != null) {
				forward.setPath("GetReviewListServiceOk.d4b");
				
			} else {
				System.out.println("reviewList 실패");
				forward.setPath("Main.jsp"); // 임시
			}
		} catch (Exception e) {
			System.out.println("getReviewListService 예외발생");
			System.out.println(e.getMessage());
		}
		return forward;
	}

}
