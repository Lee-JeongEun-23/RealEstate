package kr.or.bit.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ContractDao;
import kr.or.bit.dto.REAUser;
import kr.or.bit.dto.Sale;

public class GetContractService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		String reaId = request.getParameter("userId");
		String aptNum = request.getParameter("aptNum");
		Map<REAUser, Sale> conMap = new HashMap<REAUser, Sale>();
		try {
			ContractDao dao = new ContractDao();
			System.out.println("dao 탄다");
			//Sale sale = new Sale();			
			conMap = dao.getThisContract(reaId, aptNum);
			
			request.setAttribute("reaId", reaId);
			request.setAttribute("aptNum", aptNum);
			request.setAttribute("conMap", conMap);
			System.out.println(conMap);
		} catch (Exception e) {
			System.out.println("서비스 예외발생");
			System.out.println(e.getMessage());
		}
		
		forward = new ActionForward();
		forward.setPath("/GetContractServiceOk.d4b");
		return forward;
	}

}
