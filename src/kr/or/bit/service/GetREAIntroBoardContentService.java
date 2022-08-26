package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.REAIntroBoardDao;
import kr.or.bit.dto.REAIntroBoard;

public class GetREAIntroBoardContentService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String reaId = (String) session.getAttribute("userId");
		REAIntroBoard introBoard = null;
		REAIntroBoardDao dao = null;
		try {
			dao = new REAIntroBoardDao();
			introBoard = dao.getREAIntroData(reaId);
			if(introBoard != null) {
				forward.setPath("/WEB-INF/rea/REAIntroBoard_content.jsp");
				request.setAttribute("introBoard", introBoard);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}

}
