package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.REAIntroBoardDao;
import kr.or.bit.dto.REAIntroBoard;

public class DeleteREAIntroService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String reaId = (String) session.getAttribute("userId");
		REAIntroBoardDao dao = null;
		int result = 0;
		try {
			dao = new REAIntroBoardDao();
			result = dao.deleteREAIntro(reaId);
			if(result>0) {
				forward.setPath("GetREAUserByIdService.d4b?reaUserId"+reaId);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}

}
