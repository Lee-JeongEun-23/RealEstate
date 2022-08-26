package kr.or.bit.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BookMarkDao;
import kr.or.bit.dto.BookMark;

public class InsertBookMarkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		BookMark bookMark = null;
		BookMarkDao dao = null;
		int result = 0;
		
		String userId = request.getParameter("userId");
		String aptNum = request.getParameter("aptNum");
		try {
			PrintWriter out = response.getWriter();
			dao = new BookMarkDao();
			bookMark = new BookMark();
			bookMark.setUserId(userId);
			bookMark.setAptNum(aptNum);
			
			result = dao.insertBookMark(bookMark);
			if(result > 0) {
				forward = new ActionForward();
				forward.setPath("GetSaleDataService.d4b?aptNum="+aptNum);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}

}
