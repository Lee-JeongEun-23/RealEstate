package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.GenericUserDao;
import kr.or.bit.dao.REAUserDao;
import kr.or.bit.dto.GenericUser;
import kr.or.bit.dto.REAUser;

public class SelectREAUserService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		List<REAUser> rlist = null;
		
		try {
			REAUserDao rdao = new REAUserDao();
			
			rlist = rdao.getREAUserList();
			request.setAttribute("REAUserList", rlist);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		forward = new ActionForward();
		forward.setPath("/SelectREAUserOk.d4b");
		
		return forward;
	}

}
