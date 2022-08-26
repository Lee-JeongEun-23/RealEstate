package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.ReviewDao;
import kr.or.bit.dto.Review;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class GetReviewList
 */
@WebServlet("/GetReviewList")
public class GetReviewList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public GetReviewList() {
        super();
    }

	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        String reaId = request.getParameter("reaId"); //공인중개사 아이디 파라미터로 가져오기
		PrintWriter out = response.getWriter();
		List<Review> reviewList = null;
		ReviewDao dao = null;
		try {
			dao = new ReviewDao();
			reviewList = dao.getReviewList(reaId); //공인중개사 아이디로 리뷰 리스트 가져오기
			JSONArray jsonlist = JSONArray.fromObject(reviewList);
		  	out.print(jsonlist);
		  	
		}catch(Exception e) {
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
