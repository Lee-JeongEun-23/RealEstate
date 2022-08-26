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


@WebServlet("/Data.do")
public class Data extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Data() {
    
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
        String parameter3 = "";
        StringBuilder datalist = new StringBuilder();
        PrintWriter out = response.getWriter();
        
        
        parameter += "&" + "_type=json";
        String temp = addr +  serviceKey + parameter;        
              
        ArrayList<Integer> lawd = new ArrayList<>();
        lawd.add(11110); //종로구
        lawd.add(11290); //노원구
        lawd.add(11620); //관악구
        lawd.add(11680); //강남구
        lawd.add(11740); //강동구
        lawd.add(11500); //강서구
        
        ArrayList<Integer> date = new ArrayList<>();
        date.add(201909);
        date.add(201910);
        date.add(201911);
        
        datalist.append("[");
        for(int j = 0; j < date.size() ; j++) {
        	parameter3 = "";
        	parameter3 += "&" + "DEAL_YMD="+date.get(j);
        for(int i = 0 ; i < lawd.size() ; i++) {
        	parameter2 = "";
        	parameter2 += "&" + "LAWD_CD="+lawd.get(i);
               		
            addr = temp + parameter2+parameter3;
            
            URL url = new URL(addr);
            
            InputStream in = url.openStream(); 
            CachedOutputStream bos = new CachedOutputStream();
            IOUtils.copy(in, bos);
            in.close();
            bos.close();
            
            String data = bos.getOut().toString();
            
            datalist.append(data+",");
            
        }
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

