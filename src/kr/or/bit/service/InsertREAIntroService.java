package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.REAIntroBoardDao;
import kr.or.bit.dto.REAIntroBoard;

public class InsertREAIntroService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String reaId = (String) session.getAttribute("userId");
		System.out.println("아이디아이디"+reaId);
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		REAIntroBoard reaintro = new REAIntroBoard();
		reaintro.setId(reaId);
		reaintro.setSubject(subject);
		reaintro.setContent(content);
		
		int result = 0;
		try {
			REAIntroBoardDao dao = new REAIntroBoardDao();			
			result = dao.insertREAIntro(reaintro);
			if(result > 0) {
				forward = new ActionForward();
				forward.setPath("GetREAUserByIdService.d4b");
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return forward;
	}

}
