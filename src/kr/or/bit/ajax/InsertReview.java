package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.ReviewDao;
import kr.or.bit.dto.Review;
import net.sf.json.JSONArray;

@WebServlet("/InsertReview")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertReview() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	
    	PrintWriter out = response.getWriter();
    	String reaId = request.getParameter("reaId");
    	String userId = request.getParameter("userId");
		String reviewContent = request.getParameter("reviewContent");
		System.out.println("userId"+userId+"/"+"reaId"+reaId+"reviewContent"+reviewContent);
		
    	Date reviewDate = null;
    	int reviewNum = 0;
    	
    	Review review = null;
    	ReviewDao rvdao = null;
    	int result = 0;
    	
    	try {
    		review = new Review();
    		rvdao = new ReviewDao();
    		
    		review.setReaId(reaId);
    		review.setUserId(userId);
    		review.setReviewContent(reviewContent);
    		
    		result = rvdao.insertReview(review); //DB 저장!!
    		
    		reviewDate = rvdao.getReviewDate(review); //DB에서 리뷰 날짜 가져오기
    		
    		reviewNum = rvdao.getReviewNum(review); //지금 넣은 리뷰의 게시글 번호 가져오기
    		
    		review.setReviewDate(reviewDate); // 리뷰 날짜 넣기
    		review.setReviewNum(reviewNum);     		
    		
    		if (result > 0) {
    		  	out.print("success");
    		}
    	} catch (Exception e) {
    		System.out.println("InsertReview ajax 예외발생");
			System.out.println(e.getMessage());
		}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
