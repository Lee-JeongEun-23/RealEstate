package kr.or.bit.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ContractDao;
import kr.or.bit.dao.REAImageDao;
import kr.or.bit.dao.REAUserDao;
import kr.or.bit.dao.SaleDao;
import kr.or.bit.dto.REAImage;
import kr.or.bit.dto.REAUser;
import kr.or.bit.dto.Sale;

public class SelectContractListService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		REAUser reaUser = new REAUser();
		REAImage reaImg = new REAImage();
		List<Sale> saleList = new ArrayList<Sale>();

		REAUserDao reaDao = null;
		REAImageDao imgDao = null;
		ContractDao conDao = null;
		HttpSession session = request.getSession();
		String reaId = (String) session.getAttribute("userId");			
		try {
			forward = new ActionForward();
			reaDao = new REAUserDao();
			imgDao = new REAImageDao();
			conDao = new ContractDao();	
			reaUser = reaDao.getREAMypage(reaId);
			reaImg = imgDao.getREAImg(reaId);
			saleList = conDao.getSaleContractList(reaId);

			if (reaUser != null && reaImg != null && saleList != null) {
				request.setAttribute("reaUser", reaUser);
				request.setAttribute("reaImg", reaImg);
				request.setAttribute("saleList", saleList);
				forward.setPath("/WEB-INF/rea/REAMypageContract.jsp");
			} else {
				System.out.println("조회 실패");
				forward.setPath("/AdminMain.jsp");
			}
		} catch (Exception e) {

		}
		return forward;
	}

}
