package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SaleDao;
import kr.or.bit.dao.SaleImageDao;
import kr.or.bit.dto.SaleImage;

public class GetTotalSaleCount implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		SaleDao dao = null;
		try {
			dao=new SaleDao();
			int count = dao.getTotalSaleCount();
			System.out.println("Count: " + count);
			request.setAttribute("count", count);
			forward.setPath("");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return forward;
	}

}
