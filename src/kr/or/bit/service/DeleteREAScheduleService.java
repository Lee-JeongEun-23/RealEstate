package kr.or.bit.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.REAScheduleDao;
import kr.or.bit.dto.REASchedule;

public class DeleteREAScheduleService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		String scheNum = request.getParameter("scheNum");
		System.out.println(scheNum);
		HttpSession session = request.getSession();
		String reaId = request.getParameter("reaId");
		System.out.println("아이디 " + reaId);
		int result = 0;
		REAScheduleDao dao = null;
		System.out.println("탄다");
		try {
			dao = new REAScheduleDao();
			result = dao.deleteREASchedule(reaId, scheNum);
			System.out.println(result);
			if (result > 0) {
				forward = new ActionForward();
	    		request.setAttribute("result", result);
	
	    		
	    	forward.setPath("/WEB-INF/rea/REASchedule.jsp");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return forward;
	}

}
