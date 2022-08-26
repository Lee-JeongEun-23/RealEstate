package kr.or.bit.ajax;
 
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;


@WebServlet("/PublicData.do")
public class PublicData extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublicData() {
        super();
        // TODO Auto-generated constructor stub
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, JSONException {
    	request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        String addr = "http://openapi.kab.co.kr/OpenAPI_ToolInstallPackage/service/rest/RealTradingPriceIndexSvc/getAptRealTradingPriceIndexSize?serviceKey=";
        String serviceKey = "j0Onh%2BsTbXxrSPgnbJpJ%2Fc1RsY1YHd%2B0%2FKnCwWH3mVdQyTADwTk495K6pnl%2BfzKTak1pISmN0cx31BgMPmxWjg%3D%3D";
        String parameter = "";
        String parameter2 = "";
        StringBuilder datalist = new StringBuilder();
        PrintWriter out = response.getWriter();
        parameter = parameter + "&" + "startmonth=201901";
        parameter = parameter + "&" + "endmonth=201908";
        parameter = parameter + "&" + "region=11000";
        parameter = parameter + "&" + "contractType=0";  
        String temp = addr +  serviceKey + parameter;
        datalist.append("[");
        for(int i=1; i<=5; i++) {
        	parameter2 = "";
        	parameter2 = parameter2 + "&" + "size="+i;
    		parameter2 = parameter2 + "&" + "_type=json";
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

