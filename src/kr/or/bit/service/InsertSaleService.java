package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.AdminDao;
import kr.or.bit.dao.SaleDao;
import kr.or.bit.dto.GenericUser;
import kr.or.bit.dto.Sale;

public class InsertSaleService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String userType = (String) request.getAttribute("type");
		int result = 0;
		// 1. 데이터 받기 id, pwd, name, frontResNum, backResNum, phoneNum, addr, roadAddr
		// String aptNum = request.getParameter("aptNum");

		String aptSize = "";
		String[] aptSizes = request.getParameterValues("aptSize");

		for (String value : aptSizes) {
			aptSize = value;
		}
		// System.out.println("면적" + aptSize);
		String type = "";
		String[] types = request.getParameterValues("type");
		for (String value : types) {
			type = value;
		}

		String addr = request.getParameter("addr");
		String roadAddr = request.getParameter("roadAddr");
		System.out.println(roadAddr);
		String aptName = request.getParameter("aptName");
		String aptDong = request.getParameter("aptDong");
		String aptHo = request.getParameter("aptHo");
		String price = request.getParameter("price");
		String directions[] = request.getParameterValues("direction");
		String direction = "";
		for (String value : directions) {
			direction = value;
		}
		String etc = request.getParameter("etc");
		String isContract = request.getParameter("isContract");

		// 2. 객체에 데이터 저장

		Sale sale = new Sale();
		sale.setAptSize(aptSize);
		sale.setType(type);
		sale.setAddr(addr);
		sale.setRoadAddr(roadAddr);
		sale.setAptName(aptName);
		sale.setAptDong(aptDong);
		sale.setAptHo(aptHo);
		sale.setPrice(price);
		sale.setDirection(direction);
		sale.setEtc(etc);
		sale.setIsContract(isContract);
		sale.setId(userId);
		
		try {
			SaleDao dao = new SaleDao();
			result = dao.insertSale(sale);
			System.out.println("result : " + result);
			String aptNum = dao.getAptNumByAptInfo(sale.getAptName(), sale.getAptDong(), sale.getAptHo());
			Sale sale2 = dao.getSaleDataByAptNum(aptNum);
						
			if (result > 0) {
				forward.setPath("WEB-INF/sale/SaleAdd2.jsp?type="+userType);
				request.setAttribute("sale2", sale2);
				request.setAttribute("aptNum", aptNum);
			} else {
				forward.setPath("/Main.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("insertSaleService 실패");
		}

		return forward;
	}
}