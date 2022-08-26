package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.BookMarkDao;
import kr.or.bit.dao.REAScheduleDao;
import kr.or.bit.dto.REASchedule;


@WebServlet("/DeleteSchedule")
public class DeleteSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteSchedule() {
        super();

    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		REASchedule reaSchedule = null;
		REAScheduleDao dao = null;
		int result = 0;
		
		String reaId = request.getParameter("reaId");
		String scheNum = request.getParameter("scheNum");		
		try {
			dao = new REAScheduleDao();
			result = dao.deleteREASchedule(reaId, scheNum);
			if(result > 0) {
				System.out.println("result"+result);
				out.print("<script>alert('해당 일정이 삭제 되었습니다.')</script>");
			}
    
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
