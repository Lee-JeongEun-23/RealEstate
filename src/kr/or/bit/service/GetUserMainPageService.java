package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.AdminDao;
import kr.or.bit.dao.GenericUserDao;
import kr.or.bit.dto.GenericUser;

public class GetUserMainPageService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String type = request.getParameter("type");
		if(type.trim().equals("U01") || type.trim().equals("U02") || type.trim().equals("A00")) {
				forward.setPath("/WEB-INF/UserMain.jsp?type="+type);
			} else {
				System.out.println("genericuser null");
			}
		
		return forward;
	}

}
