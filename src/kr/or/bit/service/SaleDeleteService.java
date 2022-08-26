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
import net.sf.json.JSONArray;

public class SaleDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
	  	String aptNum = request.getParameter("aptNum");
	    HttpSession session = request.getSession();
	    String reaId = (String) session.getAttribute("reaUserId");
	  	int result = 0;
	    List<Sale> saleList = null;
	    try {
	    	SaleDao dao = new SaleDao();
	    	result = dao.deleteSale(aptNum); //sale 지우기
	    	if(result > 0) {
	    		System.out.println("delete 성공");
	    		forward = new ActionForward();
	    		forward.setPath("GetREAMypageService.d4b?reaId=" +reaId);
	    	} else {
	    		forward.setPath("GetREAMypageService.d4b?reaId=" +reaId);
	    	}
	    }catch(Exception e) {
	    	System.out.println(e.getMessage());
	    	System.out.println("delete 오류");
	    }
	    
		return forward;
	}

}
