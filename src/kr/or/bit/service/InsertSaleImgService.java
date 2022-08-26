package kr.or.bit.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.ajax.SaleImgUpload;
import kr.or.bit.dao.AdminDao;
import kr.or.bit.dao.SaleDao;
import kr.or.bit.dao.SaleImageDao;
import kr.or.bit.dto.REAImage;
import kr.or.bit.dto.REAUser;
import kr.or.bit.dto.Sale;
import kr.or.bit.dto.SaleImage;

public class InsertSaleImgService implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      ActionForward forward = new ActionForward();
      ServletContext application = request.getServletContext();
      String uploadpath = application.getRealPath("reaimg");
      HttpSession session = request.getSession();
      String userId = (String) session.getAttribute("userId");
      String userType = (String) request.getAttribute("type");
      int result = 0;
      int size = 1024 * 1024 * 10; // 10M 네이버 계산기

      MultipartRequest multi=null;
      
      ArrayList<String> saleImgSaveNames = new ArrayList<String>();
      ArrayList<String> saleImgOriginNames = new ArrayList<String>();
      try {
         multi = new MultipartRequest(request, // 기존에 있는 request 객체의 주소값
               uploadpath, // 실 저장 경로 (배포경로)
               size, // 10M
               "UTF-8", new DefaultFileRenamePolicy() // 파일 중복(upload 폴더 안에:a.jpg -> a_1.jpg(업로드 파일 변경))
         );
        
         Enumeration filenames = multi.getFileNames();
         while(filenames.hasMoreElements()) {
             String name = (String) filenames.nextElement();
             saleImgSaveNames.add(multi.getFilesystemName(name));
             saleImgOriginNames.add(multi.getOriginalFileName(name));
         }

         String aptNum =request.getParameter("aptNum");
         System.out.println("에이피티넘: " + aptNum);
         SaleImage saleImg = new SaleImage();
         saleImg.setSaleImgSaveName1(saleImgSaveNames.get(0));
         saleImg.setSaleImgSaveName2(saleImgSaveNames.get(1));
         saleImg.setSaleImgSaveName3(saleImgSaveNames.get(2));
         saleImg.setSaleImgOriginName1(saleImgOriginNames.get(0));
         saleImg.setSaleImgOriginName2(saleImgOriginNames.get(1));
         saleImg.setSaleImgOriginName3(saleImgOriginNames.get(2));
		 saleImg.setAptNum(aptNum);
		 
		
         SaleImageDao dao = new SaleImageDao();

         result = dao.insertSaleImg(saleImg);
         
        
         forward.setPath("WEB-INF/sale/SaleImgUploadFinish.jsp");

      }catch (Exception e) {

   }
   return forward;

   }
}