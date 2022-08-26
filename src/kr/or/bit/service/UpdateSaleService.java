package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SaleDao;
import kr.or.bit.dto.Sale;

public class UpdateSaleService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//공인중개사가 매물 수정하는 서비스
		ActionForward forward = new ActionForward();
		int result = 0;
		// 1. 데이터 받기 id, pwd, name, frontResNum, backResNum, phoneNum, addr
	
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
		String aptNum = request.getParameter("aptNum"); // aptNum받아오기
		System.out.println("매물 번호"+aptNum);
		HttpSession session = request.getSession();
		String reaId = (String) session.getAttribute("reaUserId");

		// 2. 객체에 데이터 저장

		Sale sale = new Sale();
		
		sale.setAptSize(aptSize);
		sale.setType(type);
		sale.setAddr(addr);
		sale.setAptName(aptName);
		sale.setAptDong(aptDong);
		sale.setAptHo(aptHo);
		sale.setPrice(price);
		sale.setDirection(direction);
		sale.setEtc(etc);
		sale.setIsContract(isContract);
		sale.setRoadAddr(roadAddr);
		sale.setAptNum(aptNum);
		
		try {
			SaleDao dao = new SaleDao();
			
			result = dao.updateSale(sale);
						
			if (result > 0) {
				forward.setPath("GetSaleImgService.d4b?aptNum="+aptNum);
				System.out.println(forward.getPath());
			} else {
				forward.setPath("Main.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("updateSaleService 실패");
		}

		return forward;
	}
}