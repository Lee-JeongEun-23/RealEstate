<%@page import="kr.or.bit.dto.Sale"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<jsp:include page="../../css/css.jsp"></jsp:include>
<%String type =(String) request.getAttribute("type");
	if(type==null || type.trim()==""){
		type =(String) request.getParameter("type");
	}
%>
<script>
$.noConflict();

jQuery( document ).ready(function( $ ) {//화면 다 뜨면 시작
	var addrList = []; //주소 저장 리스트
	$.ajax({
        url : 'AddrList',
        type : 'post',
        dataType : 'json',
        success : function(data) { 
     	$.each(data, function(index, element) {
     		if(addrList.indexOf((element.addr.split(" ")[1] + " " + element.addr.split(" ")[2])) == -1 ) addrList.push(element.addr.split(" ")[1] + " " + element.addr.split(" ")[2]);

     	});

     	$("#houseSearch").autocomplete({ //오토 컴플릿트 시작
			source : addrList, // source 는 자동 완성 대상
			select : function(event, ui) { //아이템 선택시

			},
			focus : function(event, ui) { //포커스 가면
				return false;//한글 에러 잡기용도로 사용됨
			},
			minLength : 1,// 최소 글자수
			autoFocus : true, //첫번째 항목 자동 포커스 기본값 false
			classes : { //잘 모르겠음
				"ui-autocomplete" : "highlight"
			},
			delay : 200, //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
			//            disabled: true, //자동완성 기능 끄기
			position : {
				my : "right top",
				at : "right bottom"
			}, //잘 모르겠음
			close : function(event) { //자동완성창 닫아질때 호출
			}
		});     	
     	
        }
	});
	
	$("#submitbtn").click(function() {
		var address= $("#houseSearch").val().trim();
		var addrSplit =[];
		addrSplit= address.split(" ");
		//console.log(address[0]+address[1]+address[2]);	
// 		location.href="'SelectaptListService.d4b?address="+address[0]+address[1]+address[2];
		location.href='SelectAptListService.d4b?search=' + addrSplit[0] + " " + addrSplit[1] +'&type=<%=type%>';
	});
	});
</script>
<style type="text/css">
.input-group {
	height: 50px;
}

a {
	color: #797979;
}

a:hover {
	color: #212529;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
}

@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
}

.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #fff;
}

.carousel-indicators li {
	border-color: #ff;
}

.carousel-indicators li.active {
	background-color: #fff;
}

ol, ul {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	vertical-align: baseline;
	text-decoration: none;
	list-style: none;
	font-weight: bold;
}

blockquote, q {
	quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

</style>
</head>
<jsp:include page="../../css/css.jsp"></jsp:include>

	<div class="culmn">
		<!--Home page style-->

		<!-- Top jsp -->
		<nav
			class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<%if(type.equals("U01")){%>
			<jsp:include page="../include/User_Top.jsp"></jsp:include>
			<%} else if (type.equals("U02")) {%> 
			<jsp:include page="../include/REAUser_Top.jsp"></jsp:include>
				<%}else {%> 
			<jsp:include page="../include/Top.jsp"></jsp:include>
			<%} %>
			<!-- Side jsp -->
			<jsp:include page="../include/Side.jsp"></jsp:include>
		</nav>
		<!--Join Sections-->
		<section id="id" class="about roomy-100">
			<div class="container">
				<div class="about_content">
					<h1 style="font-family: 'Jua', sans-serif; text-align: center;">매물
						리스트</h1>
					<br> <br>
					<div class="row">
						<div class="col-md-8">
							<div class="input-group">
									<input type="text" placeholder="법정동 검색" id="houseSearch"
										name="houseSearch" style="width: 200px; height: 50px;">
								<div class="input-group-append ">
									<button type="submit" class="btn btn-primary btn-block btn-lg" id="submitbtn">검색</button>
								</div>
							</div>
							<br>
						</div>
					</div>
					<jsp:include page="../include/Topic.jsp"></jsp:include>
					<br>
					<div class="row">
						<div class="col-md-12">
							<jsp:include page="../include/HouseList.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>

			<!--End off container -->
		</section>
		<!-- scroll up-->
		<jsp:include page="../include/ScrollUp.jsp"></jsp:include>
		<!-- End off scroll up -->
		<jsp:include page="../include/Bottom.jsp"></jsp:include>
	</div>

	<!-- JS includes -->
	<jsp:include page="../../js/js.jsp"></jsp:include>
</body>
</html>