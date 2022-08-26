package kr.or.bit.ajax;
 
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;


@WebServlet("/Notice.do")
public class Notice extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice() {
    
        super();
        // TODO Auto-generated constructor stub
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, JSONException {
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        
        String addr = "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade?serviceKey=";
        String serviceKey = "j0Onh%2BsTbXxrSPgnbJpJ%2Fc1RsY1YHd%2B0%2FKnCwWH3mVdQyTADwTk495K6pnl%2BfzKTak1pISmN0cx31BgMPmxWjg%3D%3D";
        String parameter = "";
        String parameter2 = "";
        StringBuilder datalist = new StringBuilder();
        PrintWriter out = response.getWriter();
        
        parameter += "&" + "DEAL_YMD=201911";
        parameter += "&" + "_type=json";
        String temp = addr +  serviceKey + parameter;        
              
        ArrayList<Integer> lawd = new ArrayList<>();
        lawd.add(11110); //종로구
        lawd.add(11140); //중구
        lawd.add(11170); //용산구
        lawd.add(11200); //성동구
        lawd.add(11215); //광진구
        lawd.add(11230); //동대문구
        lawd.add(11260); //중랑구
        lawd.add(11290); //성북구
        lawd.add(11305); //강북구
        lawd.add(11320); //도봉구
        lawd.add(11350); //노원구
        lawd.add(11380); //은평구
        lawd.add(11410); //서대문구
        lawd.add(11440); //마포구
        lawd.add(11470); //양천구
        lawd.add(11500); //강서구
        lawd.add(11530); //구로구
        lawd.add(11545); //금천구
        lawd.add(11560); //영등포구
        lawd.add(11590); //동작구
        lawd.add(11620); //관악구
        lawd.add(11650); //서초구
        lawd.add(11680); //강남구
        lawd.add(11710); //송파구        
        lawd.add(11740); //강동구

        
        datalist.append("[");

        for(int i = 0 ; i < lawd.size() ; i++) {
        	parameter2 = "";
        	parameter2 += "&" + "LAWD_CD="+lawd.get(i);
               		
            addr = temp + parameter2;
            
            URL url = new URL(addr);
            
            InputStream in = url.openStream(); 
            CachedOutputStream bos = new CachedOutputStream();
            IOUtils.copy(in, bos);
            in.close();
            bos.close();
            
            String data = bos.getOut().toString();
            
            datalist.append(data+",");
            
        }
        
        datalist.append("]");

        final JSONArray json = new JSONArray(datalist.toString());
        out.print(json);
        
        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
			doProcess(request, response);
		} catch (JSONException e) {
			e.printStackTrace();
		}
    }
 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 try {
			doProcess(request, response);
		} catch (JSONException e) {
			e.printStackTrace();
		}
    }	 
}

