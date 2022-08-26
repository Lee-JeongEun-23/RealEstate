package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BookMarkDao;
import kr.or.bit.dao.REAImageDao;
import kr.or.bit.dao.REAUserDao;
import kr.or.bit.dao.SaleDao;
import kr.or.bit.dao.SaleImageDao;
import kr.or.bit.dto.REAImage;
import kr.or.bit.dto.REAUser;
import kr.or.bit.dto.Sale;
import kr.or.bit.dto.SaleImage;

public class GetSaleDataService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String aptNum =request.getParameter("aptNum");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String type=(String) request.getParameter("type");
		Sale sale = null;	//매물
		SaleImage saleImg = null; //매물 사진
		REAUser reaUser = null; //공인중개사
		REAImage reaImg = null; //공인중개사 사진
		boolean bkCheck = false;
		
		try {
			SaleDao saleDao = new SaleDao();
			SaleImageDao saleImgDao = new SaleImageDao();
			REAUserDao reaDao = new REAUserDao();
			REAImageDao reaImgDao = new REAImageDao();
			BookMarkDao bkDao = new BookMarkDao();
			
			sale = new Sale();
			saleImg = new SaleImage();
			reaUser = new REAUser();
			reaImg = new REAImage();
			sale = saleDao.getSaleDetail(aptNum); //매물 정보 가져오기
			String reaId = sale.getId();
			System.out.println("공인중개사 아이디 " +reaId);
			saleImg = saleImgDao.getSaleImg(aptNum); //매물 사진 가져오기
			reaUser = reaDao.getREAUserInfo(reaId); //공인중개사 정보 가져오기
			reaImg = reaImgDao.getREAImg(reaId); //공인중개사 이미지 가져오기
			bkCheck = bkDao.checkBookMark(userId, aptNum); //북마크 여부 가져오기
			if(sale !=null && saleImg!=null && reaUser !=null && reaImg!=null) {
				request.setAttribute("saleData", sale);
				request.setAttribute("saleImg", saleImg);
				request.setAttribute("reaUser", reaUser);
				request.setAttribute("reaImg", reaImg);
				request.setAttribute("bkCheck", bkCheck);
				request.setAttribute("type", type);
				
				forward.setPath("GetSaleDataServiceOk.d4b");
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
