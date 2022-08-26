package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.REAScheduleDao;
import kr.or.bit.dto.REASchedule;
import net.sf.json.JSONArray;


@WebServlet("/ScheduleList")
public class ScheduleList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ScheduleList() {
        super();
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		  response.setContentType("text/html;charset=UTF-8"); //클라언트에게 전달한 페이지의 정보 구성
		  PrintWriter out = response.getWriter();
	  	  String reaId = request.getParameter("reaId");
	  	  REAScheduleDao dao = null;
		try {
			dao = new REAScheduleDao();
		  List<REASchedule> sList = dao.getSchedule(reaId);
	  	  JSONArray jsonlist = JSONArray.fromObject(sList);
	  	  System.out.println(jsonlist);
	  	  out.print(jsonlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
