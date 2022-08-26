package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.REAScheduleDao;
import kr.or.bit.dto.REASchedule;


@WebServlet("/InsertSchedule")
public class InsertSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertSchedule() {
        super();
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
		  response.setContentType("text/html;charset=UTF-8"); //클라언트에게 전달한 페이지의 정보 구성
		  String reaId = request.getParameter("reaId");
		  String content = request.getParameter("myInput2");
		  String scheDate=request.getParameter("myInput1");

		 // Date scheDate = new SimpleDateFormat("yyyy/MM/dd").parse();
		  
		  REAScheduleDao dao = null;
		 		  
		  try {
			  dao = new REAScheduleDao();
			  dao.insertSchedule(reaId, content, scheDate);
			  
		  }catch (Exception e) {
			// TODO: handle exception
		}
		  
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
