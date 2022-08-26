package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SaleDao;
import kr.or.bit.dto.Sale;

public class GetSaleEditPageService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String aptNum = request.getParameter("aptNum"); //매물 번호 받아오기
		try {
			SaleDao dao = new SaleDao(); //매물 번호로 DB에서 매물 정보 가져오기
			Sale sale = new Sale();
			sale = dao.getSaleDataByAptNum(aptNum); //DB에서 가져온 정보 객체에 저장
			if(sale !=null) {
				request.setAttribute("sale", sale);
				forward.setPath("/WEB-INF/sale/SaleEdit.jsp?aptNum="+aptNum);
			}
		}catch(Exception e) {
			
		}
		return forward;
	}

}
