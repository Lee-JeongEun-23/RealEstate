package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BookMarkDao;
import kr.or.bit.dto.BookMark;

public class GetBookMarkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");		
		List<BookMark> brList = null;
		
		try {
			BookMarkDao dao = new BookMarkDao();
			brList = dao.getBookMark(userId);
			request.setAttribute("brList", brList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		forward = new ActionForward();
		forward.setPath("/ListOk.d4b");
		return forward;
	}

}
