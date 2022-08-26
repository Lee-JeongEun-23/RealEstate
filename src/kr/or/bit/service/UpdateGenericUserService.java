package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.AdminDao;
import kr.or.bit.dao.GenericUserDao;
import kr.or.bit.dto.GenericUser;

public class UpdateGenericUserService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String genericUserId = (String)session.getAttribute("userId");

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String frontResNum = request.getParameter("frontResNum");
		String backResNum = request.getParameter("backResNum");
		String userPhoneNum = request.getParameter("userPhoneNum");
		String userAddr = request.getParameter("userAddr");
		String userDetailAddr = request.getParameter("userDetailAddr");
		String userCode = request.getParameter("userCode");

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
			GenericUserDao dao = new GenericUserDao();
			int result = dao.updateGenericUser(user);
			String type = user.getUserCode();
			if(result > 0) {
				request.setAttribute("userId", user.getUserId());
				request.setAttribute("type",type);
				forward.setPath("/WEB-INF/generic/GenericUserEditOk.jsp");
				System.out.println("db 수정완료");
			}else {
				forward.setPath("GetGenericUserMypageMainService.d4b?genericUserId="+genericUserId);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("개인회원 정보수정 서비스 실패");
		}
		
		return forward;
	}
}