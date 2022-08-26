package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ContractDao;
import kr.or.bit.dto.Sale;

public class UpdateContractService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		int result = 0;
		String aptNum = request.getParameter("aptNum"); // aptNum받아오기
		System.out.println("매물 번호"+aptNum);
		
		HttpSession session = request.getSession();
		String reaId = (String) session.getAttribute("reaUserId");
		System.out.println("중개인 아이디 : " + reaId);

		// 2. 객체에 데이터 저장

		Sale sale = new Sale();
		
		sale.setIsContract("유");
		sale.setAptNum(aptNum);
		
		try {
			ContractDao dao = new ContractDao();
			System.out.println("다오 들어가는 중");
			result = dao.updateContractSale(sale);
						
			if (result > 0) {
				forward.setPath("/WEB-INF/sale/ContractFinish.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("updateContractSaleService 실패");
		}

		return forward;
	}
}
