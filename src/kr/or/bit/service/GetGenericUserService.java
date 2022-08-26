package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.AdminDao;
import kr.or.bit.dao.GenericUserDao;
import kr.or.bit.dto.GenericUser;

public class GetGenericUserService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		GenericUser genericuser = null;
		AdminDao adao = null;
		String genericUserId = request.getParameter("genericUserId");
		try {
			forward = new ActionForward();
			genericuser = new GenericUser();
			adao = new AdminDao();
			
			genericuser = adao.getGenericUser(genericUserId);
			if (genericuser != null) {
				request.setAttribute("genericUser", genericuser);
				forward.setPath("/WEB-INF/admin/AdminGenericUser.jsp?type=A00");
			} else {
				System.out.println("genericuser null");
			}
		} catch (Exception e) {
			System.out.println("getGenericUserService 예외발생");
			System.out.println(e.getMessage());
		}
		
		return forward;
	}

}
