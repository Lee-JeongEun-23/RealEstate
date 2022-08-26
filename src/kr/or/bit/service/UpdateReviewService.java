package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ReviewDao;
import kr.or.bit.dto.Review;

public class UpdateReviewService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
    	String editId = (String)session.getAttribute("userId");
    	String editNum = request.getParameter("editNum"); //글번호 받아오기
    	String editContent = request.getParameter("editContent"); //글 내용 받아오기
    	String reaId = request.getParameter("editREAId"); //공인중개사 아이디 받아오기 >> 다른 서비스에서 사용
    	System.out.println("수정수정탄다~~~~~~");
    	System.out.println("수정" + editId+ "/"+editNum+"/"+editContent);
    	Review review = null;
    	ReviewDao rvdao = null;
    	int result = 0;
    	
    	try {
    		review = new Review();
    		rvdao = new ReviewDao();
    		//2. DB에서 수정하기
    		review.setReviewNum(Integer.parseInt(editNum));
    		review.setReviewContent(editContent);
    		review.setUserId(editId);
    		System.out.println("==========================");
    		result = rvdao.updateReview(review);
    	
    		if (result > 0) {
    			System.out.println("수정 완료?"+result);
				forward.setPath("GetREAIntroPageServiceForUser.d4b?reaId="+reaId);
    		}
    	} catch (Exception e) {
    		System.out.println("Update ajax 예외발생");
			System.out.println(e.getMessage());
		}
    	return forward;
    }
}