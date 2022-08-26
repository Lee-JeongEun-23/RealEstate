package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.REAIntroBoardDao;
import kr.or.bit.dto.REAIntroBoard;

public class CheckIntroBoardService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		//db에 소개글이 있는지 없는지 확인
		HttpSession session = request.getSession();
		String reaId = (String) session.getAttribute("userId");
		REAIntroBoardDao dao = null;
		boolean check = false;
		try {
			dao = new REAIntroBoardDao();
			check = dao.checkREAIntro(reaId);
			if(check) { //이미 등록된 소개글이 있다면
				forward.setPath("GetREAIntroBoardContentService.d4b");

			}else { //아직 소개글이 없다면 
				forward.setPath("GetREAIntroBoardService.d4b");
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}

}
