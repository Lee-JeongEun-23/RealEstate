package kr.or.bit.ajax;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import java.io.PrintWriter;

@WebServlet("/news.do")
public class NaverNews extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NaverNews() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        
		PrintWriter out = response.getWriter();
		String clientId = "zmK9Brkdj8Npb416smzC";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "CQzJMfmJ4g";// 애플리케이션 클라이언트 시크릿값";

		try {
			String text = URLEncoder.encode("부동산", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text +"&display=5"; // json 결과
			// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
			// // xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response_data = new StringBuffer();
			response_data.append("[");
			while ((inputLine = br.readLine()) != null) {
				response_data.append(inputLine);
			}
	        response_data.append("]");

			br.close();
			final JSONArray json = new JSONArray(response_data.toString());
	        out.print(json);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
