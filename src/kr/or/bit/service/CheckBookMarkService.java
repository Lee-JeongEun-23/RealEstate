package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BookMarkDao;
import kr.or.bit.dao.REAIntroBoardDao;

public class CheckBookMarkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		//db에 북마크가 있는지 없는지 확인
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String aptNum = request.getParameter("aptNum");
		BookMarkDao dao = null;
		boolean check = false;
		try {
			dao = new BookMarkDao();
			check = dao.checkBookMark(userId, aptNum);
			
			if(check) { //이미 등록된 북마크가 있다면

			}else { //아직 북마크가 없다면 
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}

		
		return forward;
	}

}