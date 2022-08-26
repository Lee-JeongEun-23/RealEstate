<%@page import="kr.or.bit.dto.REAImage"%>
<%@page import="kr.or.bit.dto.REAUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	REAUser reaUser = (REAUser) request.getAttribute("reaUser");
	REAImage reaImg = (REAImage) request.getAttribute("reaImg");
	String type =(String) request.getAttribute("type");
	//System.out.println(reaImg.getReaImgSaveName());
%>
<c:set var="reaUserData" value="<%=reaUser%>"></c:set>
<c:set var="reaImgData" value="<%=reaImg%>"></c:set>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=668464eb0d779bb6eecda046a974a34b&libraries=services"></script>
<jsp:include page="../../css/css.jsp"></jsp:include>
<style type="text/css">
h2, h4, h6, h3{
	font-family: 'Jua', sans-serif;
}
/*
Featured section style
========================*/
.main_featured .head_title {
	width: 70%;
	margin: 0 auto;
}

.slick-center .featured_img {
	position: relative;
}

.slick-center .featured_img:before {
	content: "+";
	width: 50px;
	height: 50px;
	line-height: 50px;
	position: absolute;
	left: 43.5%;
	right: 43.5%;
	top: 35%;
	color: #000;
	background-color: #fff;
	border-radius: 50%;
	font-size: 3rem;
	z-index: 2;
	cursor: pointer;
}

.slick-center .featured_img a {
	position: absolute;
	left: 43.5%;
	right: 43.5%;
	top: 35%;
	display: block;
	width: 50px;
	height: 50px;
	z-index: 3;
}

.featured_img a {
	display: none;
}

.featured_slider {
	width: 100%;
	height: 250px;
	margin: 20px auto;
	text-align: center;
}

.featured_img img {
	width: 100%;
	height: 100%;
}

.featured_slider div {
	margin-right: 5px;
}

.slick-slide {
	opacity: .6;
}

.slick-center {
	display: block;
	max-width: 10% !important;
	max-height: 20% !important;
	opacity: 1;
}

a.btn :hover {
   background-color: #eee;
   border-color: #eee;
   border: 0.5px solid #eee;
   color: #ff6863;
}

a.btn  {
   color: #fff;
   background-color: #ff6863;
   border-color: #ff6863;
   border: 2px solid #eee;
   padding: 1rem 1rem;
   float : right;
}

.page-wrapper {
  width: 100%;
  height: 100%;
  background-size: cover;
}

.blur-it {
  filter: blur(4px);
}

.modal-wrapper {
  width: 100%;
  height: 100%;
  position: fixed;
  background: 	rgb(242, 242, 242, 0.5);  
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
  left: 50%;
  background: #fff;
  opacity: 0;
  transition: all 0.5s ease-in-out;
}

.modal-wrapper.open .modal {
  margin-top: -200px;
  opacity: 1;
}

.head { 
  width: 100%;
  height: 50px;
  padding: 10px;
  overflow: hidden;
  background: #ff6863;
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

</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">

	<div class="culmn">
		<!--Home page style-->

		<!-- Top jsp -->
		<nav
			class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<%if(type=="U01"){%>
			<jsp:include page="../include/REAUser_Top.jsp"></jsp:include>
			<%}else{ %>
			<jsp:include page="../include/User_Top.jsp"></jsp:include>
			<%} %>

			<!-- Side jsp -->
			<jsp:include page="./../include/Side.jsp"></jsp:include>
		</nav>
		<!--Detail Sections-->
		<div class="container-fluid">
			<div class="main_featured m-top-100">
				<h2 style="text-align: center;">매물 상세 페이지</h2>
				<br>
			</div>

			<div class="featured_slider">
				<div>
					<div class="featured_img">
						<img src="./images/house.jpg" alt="" /> <a
							href="./images/house.jpg" class="popup-img"></a>
					</div>
				</div>
				<div>
					<div class="featured_img">
						<img src="./images/house1.jpg" alt="" /> <a
							href="./images/house1.jpg" class="popup-img"></a>
					</div>
				</div>
				<div>
					<div class="featured_img">
						<img src="./images/house2.jpg" alt="" /> <a
							href="./images/house2.jpg" class="popup-img"></a>
					</div>
				</div>
				<div>
					<div class="featured_img">
						<img src="./images/house1.jpg" alt="" /> <a
							href="./images/house1.jpg" class="popup-img"></a>
					</div>
				</div>
			</div>
			</div>
			<div class="container">
			<br> <br> <br> <br>
			<div class="row">
				<div class="col-md-12">
				<div class="houseDetail">
					<div class="page-wrapper">
					  <a class="btn trigger" href="#">담당 부동산</a>
					</div>
					<h4 style="color:#ff6863;"><i class="fas fa-home"></i>&nbsp;<span id="apartment">역삼래미안</span> 아파트 &nbsp;전세</h4> 										
					<input type="text" class="form-control" name="address"
						id="address" required="required" placeholder="도로명 주소" value="서울 강남구 선릉로69길 19">
						<br>
					<!-- Button -->
					<p style="font-size: 20px; font-family: 'Jua', sans-serif;">방
						4개 &nbsp;|&nbsp; 욕실 1개 &nbsp;|&nbsp; 화장실 1개 &nbsp;|&nbsp; 드레스룸 1개</p>
					<br>
					<div class="box">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>면적 </label> <input type="text" class="form-control"
										required="required" placeholder="면적">
								</div>
								<div class="form-group">
									<label>유형 </label> <input type="text" class="form-control" value="전세">
								</div>
								<div class="form-group">
									<label>방향 </label> <input type="text" class="form-control"
										required="required" placeholder="방향">
								</div>								
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>매매가 </label> <input type="text" class="form-control" 	value="0">
								</div>
								<div class="form-group">
									<label>보증금 </label> <input type="text" class="form-control"
										required="required" placeholder="보증금">
								</div>
								<div class="form-group">
									<label>특징 </label> <input type="text" class="form-control"
										required="required" placeholder="특징">
								</div>																
							</div>
						</div>
					</div>
					<br>
					<p style="font-size: 15px; font-family: 'Jua', sans-serif;"><i class="fas fa-subway"></i> 5분 거리 &nbsp; &nbsp;| &nbsp; &nbsp;
					<i class="fas fa-school"></i> 10분 거리 &nbsp; &nbsp;| &nbsp; &nbsp; <i class="fas fa-tree"></i> 5분 거리 </p>
				 <div id="map" style="width: 100%; height: 380px;"></div>	
				 <br> <br> <br> <br>				 					
				</div>
				</div>
			</div>
		</div>
		<!-- End off featured slider -->
		
<!-- Modal -->						
<div class="modal-wrapper">
  <div class="modal">
    <div class="head">
      <a class="btn-close trigger" href="#">
        <i class="fa fa-times" aria-hidden="true"></i>
      </a>
    </div>
    <div class="content">
				<div class="information">
				<br>
				<h3 style="text-align: center;">${reaUser.reaName}</h3>
				<br>
                 <div class="form-group" style="text-align : center">
                    <img id="preview" src="./images/profile.png" style="width:150px" alt="Profile">
                 </div>		
				<br>
				<a href="#" data-toggle="tooltip" title="010-1234-1234" style="float:right; color:#ff6863;">전화번호 &nbsp;&nbsp;&nbsp; &nbsp;</a>
				<br><br>
				<div class="form-group">
					<label>사무소 주소 </label> 
					<input type="text" class="form-control" required="required" placeholder="주소" style="width:320px" value="${reaUser.officeAddr}">
				</div>
				<br>			
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block btn-lg">Click</button>
				</div>					
				</div>
    </div>
  </div>
</div>

		<!-- scroll up-->
		<jsp:include page="./../include/ScrollUp.jsp"></jsp:include>
		<!-- End off scroll up -->
		<jsp:include page="./../include/Bottom.jsp"></jsp:include>
	</div>

	<!-- JS includes -->
	<jsp:include page="../../js/js.jsp"></jsp:include>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.497571, 127.049994), // 지도의 중심좌표
    level: 2 // 지도의 확대 레벨  
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch($('#address').val(), function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords,
            title : document.getElementById('apartment').innerHTML
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
}); 



var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
var centerPosition; // 원의 중심좌표 입니다
var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다

//지도에 클릭 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    
// 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
if (!drawingFlag) {    
    
    // 상태를 그리고있는 상태로 변경합니다
    drawingFlag = true; 
    
    // 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
    centerPosition = mouseEvent.latLng; 

    // 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
    if (!drawingLine) {
        drawingLine = new kakao.maps.Polyline({
            strokeWeight: 3, // 선의 두께입니다
            strokeColor: 'gray', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });    
    }
    
    // 그려지고 있는 원을 표시할 원 객체를 생성합니다
    if (!drawingCircle) {                    
        drawingCircle = new kakao.maps.Circle({ 
            strokeWeight: 1, // 선의 두께입니다
            strokeColor: 'gray', // 선의 색깔입니다
            strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid', // 선의 스타일입니다
            fillColor: 'gray', // 채우기 색깔입니다
            fillOpacity: 0.2 // 채우기 불투명도입니다 
        });     
    }
    
    // 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
    if (!drawingOverlay) {
        drawingOverlay = new kakao.maps.CustomOverlay({
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 1
        });              
    }
}
});

//지도에 마우스무브 이벤트를 등록합니다
//원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
    
// 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
if (drawingFlag) {

    // 마우스 커서의 현재 위치를 얻어옵니다 
    var mousePosition = mouseEvent.latLng; 
    
    // 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
    var linePath = [centerPosition, mousePosition];     
    
    // 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
    drawingLine.setPath(linePath);
    
    // 원의 반지름을 선 객체를 이용해서 얻어옵니다 
    var length = drawingLine.getLength();
    
    if(length > 0) {
        
        // 그려지고 있는 원의 중심좌표와 반지름입니다
        var circleOptions = { 
            center : centerPosition, 
        radius: length,                 
        };
        
        // 그려지고 있는 원의 옵션을 설정합니다
        drawingCircle.setOptions(circleOptions); 
            
        // 반경 정보를 표시할 커스텀오버레이의 내용입니다
        var radius = Math.round(drawingCircle.getRadius()),   
        content = '<div class="info">반경 <span class="number">' + radius + '</span>m</div>';
        
        // 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
        drawingOverlay.setPosition(mousePosition);
        
        // 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
        drawingOverlay.setContent(content);
        
        // 그려지고 있는 원을 지도에 표시합니다
        drawingCircle.setMap(map); 
        
        // 그려지고 있는 선을 지도에 표시합니다
        drawingLine.setMap(map);  
        
        // 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
        drawingOverlay.setMap(map);
        
    } else { 
        
        drawingCircle.setMap(null);
        drawingLine.setMap(null);    
        drawingOverlay.setMap(null);
        
    }
}     
});     

//지도에 마우스 오른쪽 클릭이벤트를 등록합니다
//원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
//마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

if (drawingFlag) {

    // 마우스로 오른쪽 클릭한 위치입니다 
    var rClickPosition = mouseEvent.latLng; 

    // 원의 반경을 표시할 선 객체를 생성합니다
    var polyline = new kakao.maps.Polyline({
        path: [centerPosition, rClickPosition], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
        strokeWeight: 3, // 선의 두께 입니다
        strokeColor: '#ff6863', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid' // 선의 스타일입니다
    });
    
    // 원 객체를 생성합니다
    var circle = new kakao.maps.Circle({ 
        center : centerPosition, // 원의 중심좌표입니다
        radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
        strokeWeight: 1, // 선의 두께입니다
        strokeColor: '#ff6863', // 선의 색깔입니다
        strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid', // 선의 스타일입니다
        fillColor: '#ff6863', // 채우기 색깔입니다
        fillOpacity: 0.2  // 채우기 불투명도입니다 
    });
    
    var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
        content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다

    
    // 반경정보를 표시할 커스텀 오버레이를 생성합니다
    var radiusOverlay = new kakao.maps.CustomOverlay({
        content: content, // 표시할 내용입니다
        position: rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
        xAnchor: 0,
        yAnchor: 0,
        zIndex: 1 
    });  

    // 원을 지도에 표시합니다
    circle.setMap(map); 
    
    // 선을 지도에 표시합니다
    polyline.setMap(map);
    
    // 반경 정보 커스텀 오버레이를 지도에 표시합니다
    radiusOverlay.setMap(map);
    
    // 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
    var radiusObj = {
        'polyline' : polyline,
        'circle' : circle,
        'overlay' : radiusOverlay
    };
    
    // 배열에 추가합니다
    // 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
    circles.push(radiusObj);   

    // 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
    drawingFlag = false;
    
    // 중심 좌표를 초기화 합니다  
    centerPosition = null;
    
    // 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
    drawingCircle.setMap(null);
    drawingLine.setMap(null);   
    drawingOverlay.setMap(null);
}
});    

//지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
function removeCircles() {         
for (var i = 0; i < circles.length; i++) {
    circles[i].circle.setMap(null);    
    circles[i].polyline.setMap(null);
    circles[i].overlay.setMap(null);
}         
circles = [];
}

//마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
//그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
//HTML Content를 만들어 리턴하는 함수입니다
function getTimeHTML(distance) {

// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
var walkkTime = distance / 67 | 0;
var walkHour = '', walkMin = '';

// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
if (walkkTime > 60) {
    walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
}
walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
var bycicleTime = distance / 227 | 0;
var bycicleHour = '', bycicleMin = '';

// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
if (bycicleTime > 60) {
    bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
}
bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
var content = '<ul class="info">';
content += '    <li style="color:black; font-size:15px;">';
content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
content += '    </li>';
content += '    <li style="color:black; font-size:15px;">';
content += '        <span class="label">도보</span>' + walkHour + walkMin;
content += '    </li>';
content += '    <li style="color:black; font-size:15px;">';
content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
content += '    </li>';
content += '</ul>'

return content;
}

$( document ).ready(function() {
	  $('.trigger').on('click', function() {
	     $('.modal-wrapper').toggleClass('open');
	    $('.page-wrapper').toggleClass('blur-it');
	     return false;
	  });
	  $('[data-toggle="tooltip"]').tooltip(); 
	});
</script>	
</body>
</html>