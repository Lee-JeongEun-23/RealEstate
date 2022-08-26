package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.AdminDao;
import kr.or.bit.dao.GenericUserDao;
import kr.or.bit.dao.REAImageDao;
import kr.or.bit.dto.GenericUser;
import kr.or.bit.dto.REAImage;
import kr.or.bit.dto.REAUser;

public class GetREAUserService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		REAUser reaUser = null;
		REAImage reaImg = null;
		AdminDao adao = null;
		REAImageDao imgdao = null;
		
		String REAUserId = request.getParameter("REAUserId");
		try {
			forward = new ActionForward();
			reaUser = new REAUser();
			reaImg = new REAImage();
			adao = new AdminDao();
			imgdao = new REAImageDao();
			reaUser = adao.getREAUser(REAUserId);
			reaImg = imgdao.getREAImg(REAUserId);
			if (reaUser != null && reaImg != null) {
				request.setAttribute("reaUser", reaUser);
				request.setAttribute("reaImg", reaImg);
				forward.setPath("/WEB-INF/admin/AdminREAUser.jsp?type=A00");
			} else {
				System.out.println("reaUser null");
				forward.setPath("/AdminMain.jsp");
			}
		} catch (Exception e) {
			System.out.println("getREAUserService 예외발생");
			System.out.println(e.getMessage());
		}
		
		return forward;
	}

}
