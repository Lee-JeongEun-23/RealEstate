package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BookMarkDao;

public class DeleteBookMarkService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		String aptNum = request.getParameter("aptNum");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		int result = 0;
		BookMarkDao dao = null;
		try {
			dao = new BookMarkDao();
			result = dao.deleteBookMark(userId, aptNum);
			if (result > 0) {
				forward = new ActionForward();
	    		request.setAttribute("result", result);
	    		request.setAttribute("type", "U01");
	    		System.out.println("북마크 삭제");
	    	forward.setPath("DeleteBookMarkServiceOk.d4b");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return forward;
	}
}
