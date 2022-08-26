package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.REAScheduleDao;
import kr.or.bit.dto.REASchedule;

public class GetREAScheduleListByIdService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String reaId = (String)session.getAttribute("userId");
		List<REASchedule> sList = null;
		try {
			REAScheduleDao dao = new REAScheduleDao();
			sList = dao.getSchedule(reaId);
			request.setAttribute("sList", sList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		forward = new ActionForward();
		forward.setPath("/GetREAScheduleListByIdServiceOk.d4b");
		return forward;
	}

}
