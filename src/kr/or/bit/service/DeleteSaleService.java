package kr.or.bit.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SaleDao;
import kr.or.bit.dto.Sale;

public class DeleteSaleService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	    ActionForward forward = null;
	    String aptNum = request.getParameter("aptNum");
	    HttpSession session = request.getSession();
	    String reaId = (String) request.getAttribute("reaUserId");
	    int result = 0;
	    List<Sale> saleList = new ArrayList<Sale>();
	    try {
	    	SaleDao dao = new SaleDao();
	    	result = dao.deleteSale(aptNum);
	    	saleList = dao.getSaleList(reaId);
	    	if(result > 0) {
	    		forward = new ActionForward();
	    		request.setAttribute("reaUserId", reaId);
	    		request.setAttribute("saleList", saleList);
	    		forward.setPath("WEB-INF/include/SaleList.jsp");
	    	}
	    }catch(Exception e) {
	    	
	    }
		return forward;
	}

}
