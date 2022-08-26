package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.GenericUserDao;
import kr.or.bit.dto.GenericUser;

public class GetGenericUserMypageMainService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		GenericUser user = new GenericUser();
		GenericUserDao dao = null;
		String genericUserId = (String)session.getAttribute("userId");
		String type=(String)request.getAttribute("type");
		System.out.println("genericUserId는 : " + genericUserId);
		try {

			forward = new ActionForward();
			dao = new GenericUserDao();
			user = dao.getGenericMypage(genericUserId);
			
			if (user != null) {
				System.out.println("일반 회원 마이페이지 페이지!!!!");
				request.setAttribute("genericUser", user);
				request.setAttribute("type",type);
				forward.setPath("/WEB-INF/generic/MypageMain.jsp");
			} else {
				System.out.println("조회 실패");
				forward.setPath("/Main.jsp");
			}
		} catch (Exception e) {

		}
		return forward;
	}
}
