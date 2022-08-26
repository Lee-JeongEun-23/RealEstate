package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.dao.SaleDao;
import kr.or.bit.dto.Sale;
import net.sf.json.JSONArray;

@WebServlet("/SaleDelete")
public class SaleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SaleDelete() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); //클라언트에게 전달한 페이지의 정보 구성
		PrintWriter out = response.getWriter();
	  	String aptNum = request.getParameter("aptNum");
	    HttpSession session = request.getSession();
	    String reaId = (String) session.getAttribute("reaUserId");
	  	int result = 0;
	    List<Sale> saleList = null;
	    try {
	    	SaleDao dao = new SaleDao();
	    	result = dao.deleteSale(aptNum); //sale 지우기
	    	if(result > 0) {
	    		System.out.println("여기 타니?");
	    		saleList = new ArrayList<Sale>();
		    	saleList = dao.getSaleList(reaId);
			  	JSONArray jsonlist = JSONArray.fromObject(saleList);
			  	out.print(jsonlist);
	    	}
	    
	    }catch(Exception e) {
	    	System.out.println(e.getMessage());
	    	System.out.println("ajax 오류");
	    }
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
