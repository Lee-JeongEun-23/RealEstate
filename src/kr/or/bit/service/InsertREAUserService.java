package kr.or.bit.service;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.AdminDao;
import kr.or.bit.dto.REAImage;
import kr.or.bit.dto.REAUser;

public class InsertREAUserService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		ServletContext application = request.getServletContext();
		String uploadpath = application.getRealPath("reaimg");
		int size = 1024 * 1024 * 10; // 10M 네이버 계산기

		MultipartRequest multi=null;
		try {
			multi = new MultipartRequest(request, // 기존에 있는 request 객체의 주소값
					uploadpath, // 실 저장 경로 (배포경로)
					size, // 10M
					"UTF-8", new DefaultFileRenamePolicy() // 파일 중복(upload 폴더 안에:a.jpg -> a_1.jpg(업로드 파일 변경))
			);
			// 1. 데이터 받기 id, pwd, name, frontResNum, backResNum, phoneNum, addr

			String reaId = multi.getParameter("reaId");
			String reaPwd = multi.getParameter("reaPwd");
			String reaName = multi.getParameter("reaName");
			String reaPhoneNum = multi.getParameter("reaPhoneNum");
			String officeName = multi.getParameter("officeName");
			String officeAddr = multi.getParameter("officeAddr");
			String officeDetailAddr = multi.getParameter("officeDetailAddr");
			String officeHp = multi.getParameter("officeHp");
			String regNum = multi.getParameter("regNum");
			String userCode = multi.getParameter("userCode");
			String reaImgOriginName = ""; // 중개사 이미지 원본 파일명
			String reaImgSaveName = ""; // 중개사 이미지 저장 파일명
			
			Enumeration filenames = multi.getFileNames();
			String file = (String) filenames.nextElement();
			reaImgSaveName = multi.getFilesystemName(file);
			reaImgOriginName = multi.getOriginalFileName(file);

			// 2. 객체에 데이터 저장
			REAUser user = new REAUser();
			user.setReaId(reaId);
			user.setReaPwd(reaPwd);
			user.setReaName(reaName);
			user.setReaPhoneNum(reaPhoneNum);
			user.setOfficeName(officeName);
			user.setOfficeAddr(officeAddr);
			user.setOfficeDetailAddr(officeDetailAddr);
			user.setOfficeHp(officeHp);
			user.setRegNum(regNum);
			user.setUserCode(userCode);

			REAImage reaImg = new REAImage();
			reaImg.setReaId(reaId);
			reaImg.setReaImgOriginName(reaImgOriginName);
			reaImg.setReaImgSaveName(reaImgSaveName);

			System.out.println("회원데이터" + user.toString());
			System.out.println("회원 사진 데이터" + reaImg.toString());

			try {
				// 3. DB 저장
				AdminDao dao = new AdminDao();
				int result = dao.insertREAUser(user, reaImg);
				if (result > 0) {
					forward.setPath("/WEB-INF/join/JoinFinish.jsp");
					request.setAttribute("type", userCode);
				} else {
					forward.setPath("/WEB-INF/join/JoinREA.jsp");
				}
			} catch (Exception e) {
				System.out.println("회원가입 서비스 실패");
			}
		} catch (Exception e) {

		}
		return forward;

	}

}