package kr.or.bit.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.AdminDao;
import kr.or.bit.dao.GenericUserDao;
import kr.or.bit.dao.REAUserDao;

public class LoginService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession(true);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		try {
			out=response.getWriter();
			AdminDao aDao = new AdminDao();
			GenericUserDao gDao = new GenericUserDao();
			REAUserDao rDao = new REAUserDao();
			String gResult = null;
			String rResult = null;

			if (aDao.adminLogin(id, pwd)) { // 관리자 로그인 성공 시
				forward.setPath("/WEB-INF/UserMain.jsp");
				session.setAttribute("userId", id);
				request.setAttribute("type", "A00");
				return forward;
			}
			gResult = gDao.GenericUserLogin(id, pwd);
			rResult = rDao.REAUserLogin(id, pwd);

			if (gResult.equals("U01") || rResult.equals("U02")) { // 블랙아닌 회원이 로그인했을 때
				if (gResult.equals("U01")) {
					session.setAttribute("userId", id);
					request.setAttribute("type", "U01"); // 일반 회원
					forward.setPath("/WEB-INF/UserMain.jsp");
					return forward;
				} else {
					session.setAttribute("userId", id);
					request.setAttribute("type", "U02"); // 공인중개사 회원
					forward.setPath("/WEB-INF/UserMain.jsp");
					return forward;
				}
			} else if (gResult.equals("B01") || rResult.equals("B02")) {// 블랙회원이 로그인 했을 때
				forward.setPath("/BlackLogin.jsp");
				return forward;
			}  else {
				forward.setPath("getLogin.d4b"); // 아이디 또는 비밀번호가 일치하지 않을 때
				request.setAttribute("type", "000");
				return forward;
			}
		} catch (Exception e) {
			System.out.println("LoginService 예외");
		}
		return forward;
	}
}
