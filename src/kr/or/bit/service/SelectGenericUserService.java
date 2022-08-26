package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.GenericUserDao;
import kr.or.bit.dao.REAUserDao;
import kr.or.bit.dto.GenericUser;
import kr.or.bit.dto.REAUser;

public class SelectGenericUserService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		List<GenericUser> glist = null;
		HttpSession session = request.getSession();
		String userId=(String)session.getAttribute("userId");
// 		System.out.println("userId: " + userId); 관리자 아이디
		try {
			GenericUserDao gdao = new GenericUserDao();
			
			glist = gdao.getGenericUserList();
			request.setAttribute("GenericUserList", glist);
		} catch (Exception e) {
			System.out.println("서비스 예외발생");
			System.out.println(e.getMessage());
		}
		
		forward = new ActionForward();
		forward.setPath("/SelectGenericUserOk.d4b");
		return forward;
	}

}
