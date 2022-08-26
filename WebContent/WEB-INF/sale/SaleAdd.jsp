<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userId = (String) session.getAttribute("userId");
	String type= request.getParameter("type");
	if(type==null){
		type= (String) request.getAttribute("type");
	}
%>	
<!doctype html>
<html class="no-js" lang="en">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">

<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d0c0a21e3bf46994d7f7a41d9cc729f&libraries=services"></script>
<jsp:include page="../../css/css.jsp"></jsp:include>

<style type="text/css">
h2 {
	font-family: 'Jua', sans-serif;
}

.genderbox {
	padding: 1px;
	border: 1px solid #cccccc;
	height: 40px;
}

#tdId, #tdEmail, #tdPw, #tdCh {
	font-size: 13px;
	font-family: 'Jua', sans-serif;
	color: #ff6600;
}

.addrBtn:hover {
   color: #fff;
   background-color: #ff6863;
   border-color: #ff6863;
   border: 0.5px solid #eee;
}

.addrBtn{
   color: #ff6863;
   background-color: #eee;
   border-color: #eee;
   border: 2px solid #eee;
   padding: 1rem 1rem;
   text-align: center;
}

.btn-primary {
	color: #fff;
	background-color: #ff6863;
	border: 2px solid;
	border-color: #ff6863;
	padding: 1rem 3rem;
	margin-bottom: 1rem;
	width: 100%;
	height: 50px;
	font-weight: bold;
}

.btn-primary :hover {
	background-color: #eee;
	border-color: #eee;
	border: 2px solid #eee;
	color: #ff6863;
}
</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
	<div class="culmn">
		<!--Home page style-->

		<!-- Top jsp -->
		<nav
			class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<jsp:include page="./../include/REAUser_Top.jsp"></jsp:include>

			<!-- Side jsp -->
			<jsp:include page="./../include/Side.jsp"></jsp:include>
		</nav>
	<section id="join" class="about roomy-100">

			<div class="container">
				<div class="about_content">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="signup-form">
								<br> <br> <br>
								<h2 style="text-align: center">매물 등록</h2>
								<br>
								<hr>
								<br>
							</div>
						</div>
					</div>
					<form action="InsertSaleService.d4b" id="saleForm">
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label>면적 선택 &nbsp;&nbsp;&nbsp;&nbsp;</label> <select
										class="form-control" style="width: 95%" name="aptSize"
										id="aptSize">
										<option value="24" selected>24평 (전용 59㎡)</option>
										<option value="32">32평 (전용84.9㎡)</option>
										<option value="42">42평 (전용 116㎡)</option>
									</select>
								</div>
								<div class="form-group">
									<label>거래 유형 &nbsp;&nbsp;&nbsp;&nbsp;</label> <select
										class="form-control" style="width: 95%" name="type" id="type">
										<option value="매매" selected>매매</option>
										<option value="전세">전세</option>
									</select>
								</div>
								<div class="form-group">
								<div class="row">
								<div class="col-sm-12">
									<label>주소 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdCh"></span>
										<input type="button" class="addrBtn" onclick="searchAddr()"
										value="주소 검색">
										</label>
										<input type="text" class="form-control" name="addr" id="addr"
											required="required" placeholder="지번 주소" style="width: 95%"> 
										<input type="text" class="form-control" name="roadAddr" id="roadAddr"
											required="required" placeholder="도로명 주소" style="width: 95%">
									</div>
									</div>																
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6">
											<label>아파트</label> <input type="text" class="form-control"
												name="aptName" id="aptName" required="required">
										</div>
										<div class="col-sm-3">
											<label>동</label> <input type="text" class="form-control"
												name="aptDong" id="aptDong" required="required"
												placeholder="000동">
										</div>
										<div class="col-sm-3">
											<label>호</label> <input type="text" class="form-control"
												name="aptHo" id="aptHo" required="required"
												placeholder="000호">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>거래 금액 (매매가 | 보증금)</label> <input
										type="text" class="form-control" name="price" id="price"
										required="required" placeholder="0억 0000천 만원">
								</div>
								<div class="form-group">
									<label>향(선택) &nbsp;&nbsp;&nbsp;&nbsp;</label> <select
										class="form-control" style="width: 95%" name="direction"
										id="direction">
										<option value="blank">-</option>
										<option value="남향">남향</option>
										<option value="남동향">남동향</option>
										<option value="남서향">남서향</option>
										<option value="동향">동향</option>
										<option value="서향">서향</option>
										<option value="북향">북향</option>
										<option value="북동향">북동향</option>
										<option value="북서향">북서향</option>
									</select>
								</div>
								<div class="form-group">
									<label>매물특징 &nbsp;&nbsp;&nbsp;&nbsp;</label>
									<p>
										<textarea cols="70" rows="3" placeholder="매물에 관한 부가적인 내용"
											name="etc" id="etc"></textarea>
									</p>
								</div>
								<input type="hidden" id="isContract" name="isContract" value="무">
								<br>
								<br> <input type="hidden" value="<%=userId%>" name="reaId"
									id="reaId">
								<div class="form-group">
									<div class="row">
										<div class="col-sm-4"></div>
										<div class="col-sm-4">
											<input type="submit" class="btn-primary"
												value="NEXT">
										</div>
										<div class="col-sm-4"></div>
									</div>
								</div>
								<br> <br>
							</div>
						</div>
					</form>
				</div>
			</div>

			<!--End off row-->

			<!--End off container -->
		</section>

		<!-- scroll up-->
		<jsp:include page="./../include/ScrollUp.jsp"></jsp:include>
		<!-- End off scroll up -->
		<jsp:include page="./../include/Bottom.jsp"></jsp:include>
	</div>

	<!-- JS includes -->
	<jsp:include page="../../js/js.jsp"></jsp:include>
	<script>
		function searchAddr() {
			new daum.Postcode({
				oncomplete : function(data) {
	                var rAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = extraRoadAddr;
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("roadAddr").value = rAddr;
	                document.getElementById("addr").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(rAddr !== ''){
	                    document.getElementById("aptName").value = extraRoadAddr;
	                } else {
	                    document.getElementById("aptName").value = '';
	                }
	                
	            }
	        }).open();
		}
		


	</script>

</body>
</html>