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
								<h2 style="text-align: center">?????? ??????</h2>
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
									<label>?????? ?????? &nbsp;&nbsp;&nbsp;&nbsp;</label> <select
										class="form-control" style="width: 95%" name="aptSize"
										id="aptSize">
										<option value="24" selected>24??? (?????? 59???)</option>
										<option value="32">32??? (??????84.9???)</option>
										<option value="42">42??? (?????? 116???)</option>
									</select>
								</div>
								<div class="form-group">
									<label>?????? ?????? &nbsp;&nbsp;&nbsp;&nbsp;</label> <select
										class="form-control" style="width: 95%" name="type" id="type">
										<option value="??????" selected>??????</option>
										<option value="??????">??????</option>
									</select>
								</div>
								<div class="form-group">
								<div class="row">
								<div class="col-sm-12">
									<label>?????? &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdCh"></span>
										<input type="button" class="addrBtn" onclick="searchAddr()"
										value="?????? ??????">
										</label>
										<input type="text" class="form-control" name="addr" id="addr"
											required="required" placeholder="?????? ??????" style="width: 95%"> 
										<input type="text" class="form-control" name="roadAddr" id="roadAddr"
											required="required" placeholder="????????? ??????" style="width: 95%">
									</div>
									</div>																
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6">
											<label>?????????</label> <input type="text" class="form-control"
												name="aptName" id="aptName" required="required">
										</div>
										<div class="col-sm-3">
											<label>???</label> <input type="text" class="form-control"
												name="aptDong" id="aptDong" required="required"
												placeholder="000???">
										</div>
										<div class="col-sm-3">
											<label>???</label> <input type="text" class="form-control"
												name="aptHo" id="aptHo" required="required"
												placeholder="000???">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>?????? ?????? (????????? | ?????????)</label> <input
										type="text" class="form-control" name="price" id="price"
										required="required" placeholder="0??? 0000??? ??????">
								</div>
								<div class="form-group">
									<label>???(??????) &nbsp;&nbsp;&nbsp;&nbsp;</label> <select
										class="form-control" style="width: 95%" name="direction"
										id="direction">
										<option value="blank">-</option>
										<option value="??????">??????</option>
										<option value="?????????">?????????</option>
										<option value="?????????">?????????</option>
										<option value="??????">??????</option>
										<option value="??????">??????</option>
										<option value="??????">??????</option>
										<option value="?????????">?????????</option>
										<option value="?????????">?????????</option>
									</select>
								</div>
								<div class="form-group">
									<label>???????????? &nbsp;&nbsp;&nbsp;&nbsp;</label>
									<p>
										<textarea cols="70" rows="3" placeholder="????????? ?????? ???????????? ??????"
											name="etc" id="etc"></textarea>
									</p>
								</div>
								<input type="hidden" id="isContract" name="isContract" value="???">
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
	                var rAddr = data.roadAddress; // ????????? ?????? ??????
	                var extraRoadAddr = ''; // ?????? ?????? ??????

	                // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
	                // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
	                if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // ???????????? ??????, ??????????????? ?????? ????????????.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = extraRoadAddr;
	                }

	                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
	                document.getElementById("roadAddr").value = rAddr;
	                document.getElementById("addr").value = data.jibunAddress;
	                
	                // ???????????? ???????????? ?????? ?????? ?????? ????????? ?????????.
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