package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.dao.SaleImageDao;
import kr.or.bit.dto.SaleImage;

/**
 * Servlet implementation class UploadSaleImage
 */
@WebServlet("/UploadSaleImage")
public class UploadSaleImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public UploadSaleImage() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ServletContext application = request.getServletContext();
        String uploadpath = application.getRealPath("reaimg");
		PrintWriter out = response.getWriter();
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
           
           System.out.println("제발"+result);
           
           out.print("db저장 완료");
           
        }catch (Exception e) {
        	System.out.println(e.getMessage());
     }
    
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
