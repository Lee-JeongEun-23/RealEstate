package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.REAIntroBoardDao;
import kr.or.bit.dto.REAIntroBoard;

public class UpdateREAIntroService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		int result = 0;
		String reaId = (String) session.getAttribute("userId");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		REAIntroBoard introBoard = new REAIntroBoard();
		introBoard.setId(reaId);
		introBoard.setSubject(subject);
		introBoard.setContent(content);
		REAIntroBoardDao dao = null;
		try {
			dao = new REAIntroBoardDao();
			result = dao.updateREAIntro(introBoard);
			if(result > 0) {
				forward.setPath("GetREAUserByIdService.d4b");
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}

}
