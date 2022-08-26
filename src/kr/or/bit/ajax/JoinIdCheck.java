package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.GenericUserDao;
import kr.or.bit.dao.REAUserDao;

@WebServlet("/JoinIdCheck")
public class JoinIdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JoinIdCheck() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); // 클라언트에게 전달한 페이지의 정보 구성
		PrintWriter out = response.getWriter();
		String userId= request.getParameter("userId");
		
		GenericUserDao gDao = null;
		REAUserDao reaDao=null;
		try {
			gDao = new GenericUserDao();
			reaDao=new REAUserDao();
			int result = gDao.genericUserIdCheck(userId);
			result += reaDao.REAUserIdCheck(userId);
			if(result > 0) {
				out.print(1);
			}else {
				out.print(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
