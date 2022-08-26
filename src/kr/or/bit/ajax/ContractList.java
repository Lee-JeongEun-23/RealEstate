package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.ContractDao;
import kr.or.bit.dto.Sale;
import net.sf.json.JSONArray;


@WebServlet("/ContractList")
public class ContractList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ContractList() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	  request.setCharacterEncoding("UTF-8");
		  response.setContentType("text/html;charset=UTF-8"); //클라언트에게 전달한 페이지의 정보 구성
		  PrintWriter out = response.getWriter();
		  
		  String isContract = request.getParameter("isContract");
	  	  ContractDao dao = null;
		try {
			dao = new ContractDao();
			List<Sale> sList = dao.getSaleContractList(isContract);
			System.out.println(sList);
	  	    JSONArray jsonlist = JSONArray.fromObject(sList);
	  	    out.print(jsonlist);
	  	    
		} catch (Exception e1) {
			e1.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
