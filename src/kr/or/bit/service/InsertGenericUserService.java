package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.AdminDao;
import kr.or.bit.dto.GenericUser;

public class InsertGenericUserService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		//1. 데이터 받기 id, pwd, name, frontResNum, backResNum, phoneNum, addr
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String frontResNum = request.getParameter("frontResNum");
		String backResNum = request.getParameter("backResNum");
		String userPhoneNum = request.getParameter("userPhoneNum");
		String userAddr = request.getParameter("userAddr");
		String userDetailAddr = request.getParameter("userDetailAddr");
		String userCode = request.getParameter("userCode");
		
		

		//2. 객체에 데이터 저장
		GenericUser user = new GenericUser();
		user.setUserId(userId);
		user.setUserPwd(userPwd);
		user.setUserName(userName);
		user.setFrontResNum(frontResNum);
		user.setBackResNum(backResNum);
		user.setUserPhoneNum(userPhoneNum);
		user.setUserAddr(userAddr);
		user.setUserDetailAddr(userDetailAddr);
		user.setUserCode(userCode);
		
		System.out.println("데이터" + user.toString());
		
		try {
			//3. DB 저장
			AdminDao dao = new AdminDao();
			int result = dao.insertGenericUser(user);
			if(result > 0) {
				forward.setPath("/WEB-INF/join/JoinFinish.jsp");
			}else {
				forward.setPath("/WEB-INF/join/JoinGeneric.jsp");
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("회원가입 서비스 실패");
		}
		
		return forward;
	}
}