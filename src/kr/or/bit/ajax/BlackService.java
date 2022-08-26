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

import kr.or.bit.dao.GenericUserDao;
import kr.or.bit.dto.GenericUser;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class BlackService
 */
@WebServlet("/BlackService")
public class BlackService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BlackService() {
        super();
    }
    

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	
    	PrintWriter out = response.getWriter();
    	String blackId = request.getParameter("blackId");
    	GenericUserDao gdao = null;
    	List<GenericUser> glist = null;
    	
    	try {
    		gdao = new GenericUserDao();
    		glist = new ArrayList<GenericUser>();
    		
    		glist = gdao.getGenericUserList();
    		JSONArray jsonlist = JSONArray.fromObject(glist);
    		out.print(jsonlist);
    		
    	} catch (Exception e) {
    		System.out.println("genericuser ajax 예외발생");
			System.out.println(e.getMessage());
		}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
