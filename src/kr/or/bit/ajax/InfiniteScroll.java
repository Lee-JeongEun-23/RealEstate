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

import kr.or.bit.dao.REAUserDao;
import kr.or.bit.dao.SaleDao;
import kr.or.bit.dto.REAUser;
import kr.or.bit.dto.Sale;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/InfiniteScroll")
public class InfiniteScroll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InfiniteScroll() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); // 클라언트에게 전달한 페이지의 정보 구성
		HttpSession session = request.getSession();
		String reaId = (String) session.getAttribute("userId");
		String type = (String) request.getParameter("type");
		
		REAUserDao reaDao = null;
		REAUser reaUser = null;
		SaleDao saleDao = null;
		int count=0;
		String ps = request.getParameter("pageSize"); // pagesize
		String cp = request.getParameter("cPage"); 

		PrintWriter out = response.getWriter();

		List<Sale> saleList = new ArrayList<Sale>();

		try {
			reaDao = new REAUserDao();
			saleDao = new SaleDao();
			reaUser = reaDao.getREAMypage(reaId);
			
			count = saleDao.getSaleListCount(reaId);
			
			if (ps == null || ps.trim().equals("")) {
				// default 값 설정
				ps = "5";
			}
			if (cp == null || cp.trim().equals("")) {
				// default 값 설정
				cp = "1";
			}
			int pageSize = Integer.parseInt(ps);
			int cPage = Integer.parseInt(cp);
			
			
			saleList = saleDao.getSaleList(reaId, cPage, pageSize);
			

			if (saleList != null) {
				JSONArray jsonlist = JSONArray.fromObject(saleList);
				out.print(jsonlist);
				
			} else {
				System.out.println("InfiniteScroll Ajax 오류");
			}
		} catch (

		Exception e) {
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
