package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.ajax.DeleteBookMark;
import kr.or.bit.service.CheckIntroBoardService;
import kr.or.bit.service.DeleteBookMarkService;
import kr.or.bit.service.DeleteREAIntroService;
import kr.or.bit.service.DeleteREAScheduleService;
import kr.or.bit.service.DeleteSaleService;
import kr.or.bit.service.GetBookMarkService;
import kr.or.bit.service.GetContractService;
import kr.or.bit.service.GetGenericUserEditService;
import kr.or.bit.service.GetGenericUserMypageMainService;
import kr.or.bit.service.GetGenericUserService;
import kr.or.bit.service.GetREAIntroBoardContentService;
import kr.or.bit.service.GetREAIntroDataService;
import kr.or.bit.service.GetREAIntroPageService;
import kr.or.bit.service.GetREAIntroPageServiceForUser;
import kr.or.bit.service.GetREAMypageService;
import kr.or.bit.service.GetREAScheduleListByIdService;
import kr.or.bit.service.GetREAUserByIdService;
import kr.or.bit.service.GetREAUserMypageService;
import kr.or.bit.service.GetREAUserService;
import kr.or.bit.service.GetReviewListService;
import kr.or.bit.service.GetSaleDataService;
import kr.or.bit.service.GetSaleEditPageService;
import kr.or.bit.service.GetSaleImgService;
import kr.or.bit.service.GetUserMainPageService;
import kr.or.bit.service.InsertBookMarkService;
import kr.or.bit.service.InsertGenericUserService;
import kr.or.bit.service.InsertREAIntroService;
import kr.or.bit.service.InsertREAUserService;
import kr.or.bit.service.InsertReviewService;
import kr.or.bit.service.InsertSaleImgService;
import kr.or.bit.service.InsertSaleService;
import kr.or.bit.service.LoginService;
import kr.or.bit.service.LogoutService;
import kr.or.bit.service.SaleDeleteService;
import kr.or.bit.service.SelectAtpListService;
import kr.or.bit.service.SelectContractListService;
import kr.or.bit.service.SelectGenericUserService;
import kr.or.bit.service.SelectREAUserService;
import kr.or.bit.service.UpdateContractService;
import kr.or.bit.service.UpdateGenericUserService;
import kr.or.bit.service.UpdateREAIntroService;
import kr.or.bit.service.UpdateREAUserService;
import kr.or.bit.service.UpdateReviewService;
import kr.or.bit.service.UpdateSaleImgService;
import kr.or.bit.service.UpdateSaleService;

@WebServlet("*.d4b")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());

		Action action = null;
		ActionForward forward = null;
		// 삭제=========================================
		if (url_Command.equals("/CheckIntroBoardService.d4b")) {
			action = new CheckIntroBoardService();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/DeleteREAIntroService.d4b")) {
			try {
				action = new DeleteREAIntroService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/DeleteREAScheduleService.d4b")) {
			try {
				action = new DeleteREAScheduleService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/DeleteSaleService.d4b")) {
			try {
				action = new DeleteSaleService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/DeleteREAScheduleService.d4b")) {
			try {
				action = new DeleteREAScheduleService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/DeleteSaleService.d4b")) {
			try {
				action = new DeleteSaleService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/DeleteBookMarkService.d4b")) {
			try {
				action = new DeleteBookMarkService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/DeleteBookMarkServiceOk.d4b")) {
			try {
				forward = new ActionForward();
				forward.setPath("/WEB-INF/generic/MypageMain.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// Get =====================================
		else if (url_Command.equals("/GetBookMarkService.d4b")) {
			try {
				action = new GetBookMarkService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetContractService.d4b")) {
			try {
				action = new GetContractService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetContractServiceOk.d4b")) {
			try {
				forward = new ActionForward();
				forward.setPath("/WEB-INF/sale/Contract.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetGenericUserEditService.d4b")) {
			try {
				action = new GetGenericUserEditService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (url_Command.equals("/GetGenericUserMypageMainService.d4b")) {
			try {
				action = new GetGenericUserMypageMainService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (url_Command.equals("/GetREAIntroDataService.d4b")) {
			try {
				action = new GetREAIntroDataService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetREAIntroPageService.d4b")) {
			try {
				action = new GetREAIntroPageService();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetREAIntroPageServiceForUser.d4b")) { // 일반 사용자가 소개 페이지로
			try {
				action = new GetREAIntroPageServiceForUser();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetREAIntroBoardService.d4b")) { // 공인중개사가 후기 작성 페이지로
			try {
				forward = new ActionForward();
				forward.setPath("/WEB-INF/rea/REAIntroBoard.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetREAIntroBoardContentService.d4b")) {
			try {
				action = new GetREAIntroBoardContentService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetREAScheduleListByIdService.d4b")) {
			try {
				action = new GetREAScheduleListByIdService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetREAScheduleListByIdServiceOk.d4b")) {
			try {
				forward = new ActionForward();
				forward.setPath("/WEB-INF/rea/REASchedule.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetGenericUserService.d4b")) {
			try {
				action = new GetGenericUserService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetREAUserService.d4b")) {
			try {
				action = new GetREAUserService();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetREAUserByIdService.d4b")) {
			try {
				action = new GetREAUserByIdService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetReviewListService.d4b")) {
			try {
				action = new GetReviewListService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetReviewListServiceOk.d4b")) {
			try {
				forward = new ActionForward();
				forward.setPath("/REAIntro.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetSaleAddPageService.d4b")) {
			try {
				forward = new ActionForward();
				forward.setPath("/WEB-INF/sale/SaleAdd.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetSaleDataService.d4b")) {
			try {
				action = new GetSaleDataService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetSaleDataServiceOk.d4b")) {
			try {
				forward = new ActionForward();
				forward.setPath("/WEB-INF/sale/SaleDetail.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetSaleImgService.d4b")) {
			try {
				action = new GetSaleImgService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetSaleEditPageService.d4b")) {
			try {
				action = new GetSaleEditPageService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetREAMypageService.d4b")) {
			try {
				action = new GetREAMypageService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetREAMypageEditService.d4b")) {
			try {
				action = new GetREAUserMypageService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/GetUserMainPageService.d4b")) {
			try {
				action = new GetUserMainPageService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// insert=============================================
		else if (url_Command.equals("/InsertBookMarkService.d4b")) {
			try {
				action = new InsertBookMarkService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/InsertGenericUserService.d4b")) {
			try {
				action = new InsertGenericUserService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/InsertREAIntroService.d4b")) {
			try {
				action = new InsertREAIntroService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/InsertREAUserService.d4b")) {
			try {
				action = new InsertREAUserService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/InsertReviewService.d4b")) {
			try {
				action = new InsertReviewService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/InsertSaleImgService.d4b")) {
			try {
				action = new InsertSaleImgService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/InsertSaleService.d4b")) {
			try {
				action = new InsertSaleService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// select ================================================
		else if (url_Command.equals("/SelectREAUserService.d4b")) { // 공인중개사회원 목록보기
			try {
				action = new SelectREAUserService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/SelectREAUserOk.d4b")) { // 공인중개사회원 목록보기
			try {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/admin/AdminMain.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/SelectGenericUserService.d4b")) { // 개인회원 목록보기
			try {
				action = new SelectGenericUserService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/SelectGenericUserOk.d4b")) { // 개인회원 목록보기
			try {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/admin/AdminMain.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/SelectAptListService.d4b")) { // 아파트 목록보기
			try {
				action = new SelectAtpListService();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/SelectAptListServiceOk.d4b")) { // 아파트 목록보기
			try {
				forward = new ActionForward();
				forward.setPath("/WEB-INF/sale/HouseListMain.jsp");
				System.out.println("SelectAptListServiceOk컨트롤러끝난부분입니당: ");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/SaleDeleteService.d4b")) { // 공인중개사회원 목록보기
			try {
				action = new SaleDeleteService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (url_Command.equals("/SelectContractListService.d4b")) { //계약된 매물 목록보기
			try {
				action = new SelectContractListService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// update========================================
		else if (url_Command.equals("/UpdateContractService.d4b")) {
			try {
				action = new UpdateContractService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/UpdateGenericUserService.d4b")) {
			try {
				action = new UpdateGenericUserService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/UpdateREAIntroService.d4b")) {
			try {
				action = new UpdateREAIntroService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/UpdateREAUserService.d4b")) {
			try {
				action = new UpdateREAUserService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/UpdateReviewService.d4b")) {
			try {
				action = new UpdateReviewService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/UpdateSaleImgService.d4b")) {
			try {
				action = new UpdateSaleImgService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/UpdateSaleService.d4b")) {
			try {
				action = new UpdateSaleService(); //
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 로그인 관련 controller 191121 이정은
		else if (url_Command.equals("/LoginService.d4b")) {
			action = new LoginService(); //
			forward = action.execute(request, response);

		} else if (url_Command.equals("/LoginPageService.d4b")) {
			try {
				forward = new ActionForward();
				forward.setPath("view/Login.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_Command.equals("/LogoutService.d4b")) {
			action = new LogoutService();
			forward = action.execute(request, response);
		}
		// 페이지 이동관련 ==========================================
		else if (url_Command.equals("/getMain.d4b")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/Main.jsp");
		} else if (url_Command.equals("/getAdminMain.d4b")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/UserMain.jsp");
		} else if (url_Command.equals("/getLogin.d4b")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/view/Login.jsp");
		}
		// dispatcher =================================================
		if (forward != null) {
			if (forward.isRedirect()) { // true
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
