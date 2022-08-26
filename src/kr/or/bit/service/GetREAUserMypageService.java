package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.REAImageDao;
import kr.or.bit.dao.REAIntroBoardDao;
import kr.or.bit.dao.REAUserDao;
import kr.or.bit.dto.REAImage;
import kr.or.bit.dto.REAIntroBoard;
import kr.or.bit.dto.REAUser;

public class GetREAUserMypageService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		REAUser reaUser = new REAUser();
		REAImage reaImg = new REAImage();
		
		REAUserDao reaDao = null;
		REAImageDao imgDao=null;
		
		HttpSession session = request.getSession();
		String reaId = (String)session.getAttribute("userId");
		try {

			forward = new ActionForward();
			reaDao = new REAUserDao();
			imgDao = new REAImageDao();
			
			reaUser = reaDao.getREAMypage(reaId);
			reaImg =imgDao.getREAImg(reaId);
			
			if (reaUser != null && reaImg != null) {
				System.out.println("조회 성공");
				request.setAttribute("reaUser", reaUser);
				request.setAttribute("reaImg", reaImg);
				forward.setPath("/WEB-INF/rea/REAMypageEdit.jsp");
			} else {
				System.out.println("조회 실패");
				forward.setPath("/AdminMain.jsp");
			}
		} catch (Exception e) {

		}
		return forward;
	}
}
