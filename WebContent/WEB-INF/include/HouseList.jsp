<%@page import="kr.or.bit.utils.ThePager"%>
<%@page import="kr.or.bit.dto.SaleImage"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.dto.Sale"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d0c0a21e3bf46994d7f7a41d9cc729f&libraries=services"></script>
<script type="text/javascript">
	        $(function () {
	            $('.slick-items').slick({
	                autoplay : true,
	                dots : true,
	                speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
	                infinite : true,
	                autoplaySpeed : 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
	                arrows : true,
	                slidesToShow : 1,
	                slidesToScroll : 1,
	                fade : false
	             });
	          //아파트 이름 마커에 넣기 위해 배열 생성
		          /*
		        	var aptNameValue = $("input[name='aptName']").length;
		        	var aptNameArr = new Array(aptNameValue);
		        	for(var i=0; i< aptNameArr.length; i++){                          
		        		aptNameArr[i] = "<div><span>"+$("input[name='aptName']")[i].value.split(",")[1]+"</span></div>";
		            }
				*/
				
				//아파트 주소를 배열로 생성
	            var arrValue = $("input[name='addr']").length;
	            var array = new Array(arrValue);
	            for(var i=0; i< array.length; i++){                          
	            	array[i] = $("input[name='addr']")[i].value.split(",");
	            }
	        
	            var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    		mapOption = {
	    	   	center: new kakao.maps.LatLng(37.497571, 127.049994), // 지도의 중심좌표
	    	   	level: 6 // 지도의 확대 레벨  
	    		};

		    	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성
		    	//주소-좌표 변환 객체를 생성
		    	var geocoder = new kakao.maps.services.Geocoder();
		    	
		    	for (var i = 0; i < array.length; i++){
		    		geocoder.addressSearch(array[i], function(result, status) {
		    	        // 정상적으로 검색이 완료됐으면 
		    	         if (status === kakao.maps.services.Status.OK) {
		    	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	            // 결과값으로 받은 위치를 마커로 표시
		    	            var marker = new kakao.maps.Marker({
		    	                map: map,
		    	                position: coords,
		    	            });
		    	           marker.setMap(map);
		    	           map.setCenter(coords);
		    	        } 
		    	    }); 
		    	}
		        });
</script>
<%
	String userId = (String) session.getAttribute("userId");
	String search= (String) request.getAttribute("search");
	
	String type= request.getParameter("type");
	if(type==null || type.trim()==""){
		type= (String) request.getAttribute("type");
	}
	
	int pageCount = (int) request.getAttribute("pageCount");
	int count = (int) request.getAttribute("count");
	int pageSize = (int) request.getAttribute("pageSize");
	int cPage = (int) request.getAttribute("cPage");

%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58b9f2ab38f9ccb70e8d94e99bcaab94&libraries=LIBRARY"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58b9f2ab38f9ccb70e8d94e99bcaab94&libraries=services,clusterer,drawing"></script>
<style type="text/css">
h5{
font-family: 'Jua', sans-serif;
}
a.btn :hover {
   color: #fff;
   background-color: #ff6863;
   border-color: #ff6863;
   border: 0.5px solid #eee;
}

a.btn  {
   color: #ff6863;
   background-color: #eee;
   border-color: #eee;
   border: 2px solid #eee;
   padding: 1rem 1rem;
}

.teamskillbar {
   position: relative;
   display: block;
   margin-bottom: 15px;
   width: 100%;
   background: #f2f2f2;
   height: 10px;
   -webkit-transition: 0.4s linear;
   transition: 0.4s linear;
   -webkit-transition-property: width, background-color;
   transition-property: width, background-color;
}

.teamskillbar h6 {
   position: absolute;
   top: -25px;
   left: 0;
}

.teamskillbar-bar {
   height: 10px;
   width: 0px;
   background: #ff6863;
   position: absolute;
   left: 0px;
   top: 0px;
}
.slick-items, .detail{
text-align: center;
}
.btnJoin {
	color: #fff;
	background-color: #ff6863;
	border: 2px solid;
	border-color: #ff6863;
	padding: 1rem 3rem;
}

.btnJoin:hover {
	background-color: #eee;
	border-color: #eee;
	border: 2px solid #eee;
	color: #ff6863;
}

.modal-wrapper {
	width: 100%;
	height: 100%;
	position: fixed;
	background: rgb(242, 242, 242, 0.5);
	top: 0;
	left: 0;
	visibility: hidden;
	Z-index: 1;
}

.modal-wrapper.open {
	opacity: 1;
	visibility: visible;
}

.modal {
	width: 400px;
	height: 600px;
	display: block;
	position: relative;
	top: 40%;
	left: 38%;
	background: #fff;
	opacity: 0;
	transition: all 0.5s ease-in-out;
}

.modal-wrapper.open .modal {
	margin-top: -200px;
	opacity: 1;
}

.btn-close {
	font-size: 28px;
	display: block;
	float: right;
	color: #fff;
}

.content {
	padding: 10%;
}

.head {
	width: 100%;
	height: 50px;
	padding: 10px;
	overflow: hidden;
	background: #ff6863;
}
</style>

<%
	Map<Sale, SaleImage> saleMap = (Map<Sale, SaleImage>)request.getAttribute("saleMap");
%>
<h6>300개 이상의 매물</h6>
<input type="hidden" value="<%=search%>" id="search">
<p style="font-size: 13px"><b>거래 가격의 비율이 높을 수록 평균 가격보다 낮습니다.</b></p>
<br>
<div class="row">
	<div class="col-lg-7" id="items">
		<c:set var="priceList" value="priceList"></c:set>
		<c:set var="stringPrice" value="stringPrice"></c:set>
		<c:set var="listLength" value="listLength"></c:set>
		<c:set var="listLength" value="listLength"></c:set>
		<c:set var="saleData" value=""></c:set>
		<c:forEach var="sale" items="<%=saleMap%>" varStatus="status">
		    <div class="row">
		        <div class="col-lg-1"></div>
		        <div class="col-lg-7">
		            <div class="slick-items">
		                <div>
		                    <img src="reaimg/${sale.value.saleImgSaveName1}" alt="매물사진1" width="500" height="220">
		                </div>
		                <div>
		                    <img src="reaimg/${sale.value.saleImgSaveName2}" alt="매물사진2" width="500" height="220">
		                </div>
		                <div>
		                    <img src="reaimg/${sale.value.saleImgSaveName3}" alt="매물사진3" width="500" height="220">
		                </div>
		            </div>
		        </div>
		        <!-- 내용 -->
		        <div class="col-lg-4">
		            <div class="detail" style="text-align: center;">
						<h5>${sale.key.aptName}</h5>
		                <input type="text" class="form-control" value="평형   ${sale.key.aptSize}평">
		                <br>
		                <div class="skill_bar sm-m-top-50">
		                    <div class="teamskillbar clearfix m-top-20" data-percent="${79830 / sale.key.price * 100}%">
		                        <h6>거래 가격 : ${sale.key.price}</h6>
		                        <div class="teamskillbar-bar"></div>
		                    </div>
		                    <!-- End Skill Bar -->
		                    <div class="teamskillbar clearfix m-top-50" data-percent="90%">
		                        <h6 style="font-size: 12px;">${sale.key.etc}</h6>
		                        <div class="teamskillbar-bar"></div>
		                    </div>
		                    <input type="hidden" name="addr" value=" ${sale.key.addr}">
		                    
		                    <!-- End Skill Bar -->
		                </div>
		                <% if(userId != null && !userId.trim().equals("") ){ %>
		                	<a class="btn" href="GetSaleDataService.d4b?aptNum=${sale.key.aptNum}&type=<%=type%>">See the Details</a>
		                <%} else{%>
		                	<a class='btn trigger' href='#'>See the Details</a>
		                <%} %>
 					</div>
		        </div>
		    </div>
		    <hr>
		</c:forEach>
		    <div>
		<%
			int pagersize=5;
			ThePager pager=new ThePager(count, cPage, pageSize, pagersize, "SelectAptListService.d4b?search="+search, type);
		%>
		<%=pager.toString() %>
	</div>
    </div>


    <!-- map -->
    <div class="col-lg-5">
        <div id="map" style="width: 100%; height: 100%;"></div>
    </div>
	</div>
		<!-- Modal -->
	<div class="modal-wrapper">
		<div class="modal">
			<div class="head">
				<a class="btn-close trigger" href="#"> <i class="fa fa-times"
					aria-hidden="true"></i>
				</a>
			</div>
			<div class="content">
			  <form action="LoginService.d4b" method="post" name="loginForm">
				<div class="information">
					<h3 style="text-align: center;">로그인</h3>
					<br>
					<div class="form-group">
						<label>아이디 </label> 
						<input class="form-control" type="text" name="id" id="id" placeholder="ID" style="width: 320px" required="required">
						<label>비밀번호 </label> 
						<input class="form-control" type="password" name="pwd" id="pwd" required="required" placeholder="PASSWORD" style="width: 320px">
					</div>
					<br>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block btn-lg">Click</button>
						<br>
						<hr>
					</div>
					<br> <span>계정이 없으신가요?</span> <br>
					<br>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">

								<button type="submit" class="btnJoin" onclick="location.href='view/JoinCheckGeneric.jsp'">
									<i class="fas fa-user"></i> 일반
								</button>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<button type="submit" class="btnJoin"
									style="padding-left: 20px; padding-right: 20px;" onclick="location.href='view/JoinCheckREA.jsp'">
									<i class="fas fa-home"></i> 공인중개인
								</button>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<script>

$( document ).ready(function() {
     $('.trigger').click(function(){
    	 $('.modal-wrapper').toggleClass('open');
         $('.page-wrapper').toggleClass('blur-it');
          return false;
     });
     $('[data-toggle="tooltip"]').tooltip(); 
   });
</script>
