<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.dto.SaleImage"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.dto.Sale"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.notice {
	width: 100%;
	height: 50px;
	overflow: hidden;
	background-color: #fff;

}

.rolling {
	position: relative;
	width: 100%;
	height: auto;
	
}

.rolling li {
	width: 100%;
	height: 50px;
	line-height: 50px;
}
</style>
<script type="text/javascript">
$(function() { 
  
    
		$.ajax({
               url : 'Notice.do',
               type : 'post',
               dataType : 'json',
               success : function(data) {        
            	
            	$.each(data, function(index, element) {
                let amount = element.response.body.items.item;
				$.each(amount, function(key, value){
					switch(value.지역코드){
				        case 11110: //종로구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 
						        var houseNotice = "";
						        houseNotice +="<li> 종로구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '종로구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
					        	break;
				        case 11140: //중구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 						        
						        var houseNotice = "";
						        houseNotice +="<li> 중구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '중구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11170: //용산구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 		
						        var houseNotice = "";
						        houseNotice +="<li> 용산구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '용산구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11200: //성동구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 		        		
						        var houseNotice = "";
						        houseNotice +="<li> 성동구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '성동구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11215: //광진구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 광진구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '광진구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11230: //동대문구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 동대문구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '동대문구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11260: //중랑구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 			        		
						        var houseNotice = "";
						        houseNotice +="<li> 중랑구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '중랑구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11290: //성북구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 				        		
						        var houseNotice = "";
						        houseNotice +="<li> 성북구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '성북구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11305: //강북구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 				        		
						        var houseNotice = "";
						        houseNotice +="<li> 강북구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '강북구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11320: //도봉구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 				        		
						        var houseNotice = "";
						        houseNotice +="<li> 도봉구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '도봉구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11350: //노원구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 노원구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '노원구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11380: //은평구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 은평구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '은평구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11410: //서대문구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 			        		
						        var houseNotice = "";
						        houseNotice +="<li> 서대문구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '서대문구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11440: //마포구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 마포구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '마포구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11470: //양천구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 양천구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '양천구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11500: //강서구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 강서구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '강서구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11530: //구로구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 구로구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '구로구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11545: //금천구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 금천구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '금천구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11560: //영등포구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 영등포구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '영등포구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11590: //동작구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 				        		
						        var houseNotice = "";
						        houseNotice +="<li> 동작구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '동작구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11620: //관악구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 관악구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '관악구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11650: //서초구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 				        		
						        var houseNotice = "";
						        houseNotice +="<li> 서초구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '서초구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11680: //강남구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 강남구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '강남구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11710: //송파구  
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 송파구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '송파구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
				        case 11740: //강동구
				        	if(value.전용면적 >= 72){
				        		let pyeong = Math.round(value.전용면적 * 0.3025);
				        		let price = value.거래금액.trim(); 					        		
						        var houseNotice = "";
						        houseNotice +="<li> 강동구" + value.법정동  + " " + value.아파트 + "아파트 " + pyeong + "평 " + price + "만 원 </li>";
						  
						        if($('#topic').text() == '강동구'){
							        $('#roll').append(houseNotice);						        	
						        }

				        	}
				        	break;
					}
					
				});
           		
            	});  
            	
            	noticeText();
					
               }
                  
                  
          }); //ajax 닫기
       
          
   function noticeText(){
        	  
		var height = $(".notice").height();
		var num = $(".rolling li").length;
		var max = height * num;
		var move = 0;
		function noticeRolling() {
			move += height;
			$(".rolling").animate({
				"top" : -move
			}, 600, function() {
				if (move >= max) {
					$(this).css("top", 0);
					move = 0;
				}
				;
			});
		}
		;
		noticeRollingOff = setInterval(noticeRolling, 1500);
		$(".rolling").append($(".rolling li").first().clone());
      	  
          }       
       
  }); 
</script>
<%-- <%
	System.out.println("하우스하우스");
	Map<Sale, SaleImage> saleMap = (Map<Sale, SaleImage>) request.getAttribute("saleMap");
	System.out.println("saleMap.toString(): 하우스리스트 입성: " + saleMap.toString());
	ArrayList<String> priceList=new ArrayList<String>();
	String stringPrice=null;
	 double num = 79830;
	 int price = 0;
	 double price2=0;
	Map<Map<Sale, List<SaleImage>>, String> map= new HashMap<Map<Sale, List<SaleImage>>,String>();
	 for(Map<Sale, List<SaleImage>> sale : map.keySet()){
		 for(Sale sale2 : sale.keySet()){
			 price = Integer.parseInt(sale2.getPrice());
			 price2= num / price * 100; 
			 stringPrice = Double.toString(price2)+ "%";
		 }
		 map.put(saleMap, stringPrice);
		}
	 System.out.println(saleMap.toString());
	 System.out.println("===============");
	 System.out.println("맵 ㅡㅡ" + map.toString());
	 System.out.println("===============");
	 
// 	String search=(String)request.getAttribute("search");
// 	System.out.println(search);
	
	
	
	//System.out.println("search: " + search);
	
	//System.out.println(searchSplit[0]);
%>
<% 
//    if(!saleList.isEmpty()){
//       String[] searchSplit = search.split(" ");
   %>
   <p style="font-size: 18px; font-family: 'Jua', sans-serif;">"<%=search %>" 검색 결과 &nbsp;&nbsp; <span id="topic"><%=searchSplit[0] %></span>
   <i class="fas fa-angle-right"></i> <%=searchSplit[1] %></p>   
   <%}else{
      %>
      <p style="font-size: 18px; font-family: 'Jua', sans-serif;"> "<%=search %>" 검색 결과가 없습니다.
   <%} %>   
   <br>
   <div class="notice">
      <ul class="rolling" id="roll">
      
      </ul>
   </div> --%>